import Foundation
import SwiftUI
import AVKit
import Combine

class FourCirclesViewModel: ObservableObject {
    
    @Published var inhale = 0
    @Published var hold1 = 0
    @Published var exhale = 0
    @Published var hold2 = 0
    @Published var totaltime = 0
    
    @Published var inhaleEnds = false
    @Published var hold1Ends = false
    @Published var exhaleEnds = false
    @Published var hold2Ends = false
    
    private let queue = DispatchQueue.init(label: timerLabelText, qos: .background, attributes: [], autoreleaseFrequency: .never, target: .global())
    
    var counter: Int = 0  // seconds
    var endDate: Date?
    var duration: TimeInterval?
    var eventHandler: ((Int) -> Void)?
    var paused = false
    var showAlert: Bool = false
    var audioPlayer: AVAudioPlayer!
    var sourceTimer: DispatchSourceTimer?
    
    var isActive: Bool {
        return  self.sourceTimer != nil
    }
    
    
    func intervalToAdjust(inhalE: Int, holD1: Int, exhalE: Int, holD2: Int, total: Int) {
        inhale = inhalE
        hold1 = holD1
        exhale = exhalE
        hold2 = holD2
        totaltime = total
        
    }
    
    func isNotNull(inhale: Int, inputTime: Int) -> Bool {
        var iStrue = false
        if inhale > 0 && inputTime > 0 {
            totaltime = inputTime * 60
            iStrue = true
        }
        else {
            showAlert = true
        }
        return iStrue
    }
    
    
    func timeString() -> String {
        // let hours   = Int(time) / 3600
        let minutes = Int(totaltime) / 60 % 60
        let seconds = Int(totaltime) % 60
        return String(format:format, minutes, seconds)
    }

    func playTikTak() {
        if totaltime > 0 {
        let sound = Bundle.main.path(forResource: tiktak, ofType: mp3)
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
    
    func restartTime() {
        inhale = UserDefaults.standard.integer(forKey: inhaleUD)
        hold1 = UserDefaults.standard.integer(forKey: hold1UD)
        exhale = UserDefaults.standard.integer(forKey: exhaleUD)
        hold2 = UserDefaults.standard.integer(forKey: hold2UD)
        totaltime = UserDefaults.standard.integer(forKey: inputTimeUI) * 60
        
        inhaleEnds = false
        hold1Ends = false
        exhaleEnds = false
        hold2Ends = false
    }
    
    
    
    func incrementIntInhale() {
        sourceTimer?.setEventHandler {
            DispatchQueue.main.async {
                if self.inhale > 0 && self.totaltime > 0 {
                    self.inhale -= 1
                }
                else {
                    self.inhaleEnds = true
                }
                
                if self.hold1  > 0 && self.inhaleEnds && self.totaltime > 0 {
                    self.hold1 -= 1
                }
                else {
                    if self.inhaleEnds {
                        self.hold1Ends = true
                    }
                }
                
                if self.exhale  > 0 && self.hold1Ends && self.totaltime > 0 {
                    self.exhale -= 1
                }
                else {
                    if self.hold1Ends {
                        self.exhaleEnds = true
                    }
                }
                
                if self.hold2 > 0 && self.exhaleEnds && self.totaltime > 0{
                    self.hold2 -= 1
                }
                
                
                if self.hold2 == 0 && self.exhaleEnds && self.totaltime > 0 {
                    self.inhale = UserDefaults.standard.integer(forKey: inhaleUD)
                    self.hold1 = UserDefaults.standard.integer(forKey: hold1UD)
                    self.exhale = UserDefaults.standard.integer(forKey: exhaleUD)
                    self.hold2 = UserDefaults.standard.integer(forKey: hold2UD)
              
                    
                    self.inhaleEnds = false
                    self.hold1Ends = false
                    self.exhaleEnds = false
                    self.hold2Ends = false
                }
                
                
                if self.totaltime > 0 {
                    self.totaltime -= 1
                } else {
                    self.inhale = 0
                    self.hold1 = 0
                    self.exhale = 0
                    self.hold2 = 0
                }
            }
        }
        self.sourceTimer?.schedule(deadline: .now(),
                                   repeating: 1)
        
    }
    
    func finish() {
        
        guard self.sourceTimer != nil else {return}
        self.endDate = Date()
        self.duration = TimeInterval(exactly: Double(self.counter))
        self.sourceTimer?.setEventHandler {}
        self.sourceTimer?.cancel()
        if self.paused == true {
            self.sourceTimer?.resume()
        }
        self.sourceTimer = nil
        self.reset()
        
    }
    
    private func reset() {
        self.counter = 0
        
    }
    
    func start() {
        self.paused = false
        
        guard let _ = self.sourceTimer else {
            self.startTimer()
            return
        }
        
        self.resumeTimer()
    }
    
    private func startTimer() {
        self.sourceTimer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags.strict,
                                                          queue: self.queue)
        self.resumeTimer()
    }
    
    func resumeTimer() {
        self.sourceTimer?.setEventHandler {  [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.counter += 1
            strongSelf.eventHandler?(strongSelf.counter)
        }
        self.sourceTimer?.schedule(deadline: .now(),
                                   repeating: 1)
        self.sourceTimer?.resume()
    }
}

