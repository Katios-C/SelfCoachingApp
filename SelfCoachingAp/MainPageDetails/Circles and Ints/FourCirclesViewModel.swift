
import Foundation
import SwiftUI
import AVKit
import Combine

class FourCirclesViewModel: ObservableObject {
    @Published var inhale = 0
    @Published var hold1 = 0
    @Published var exhale = 0
    @Published var hold2 = 0
    
    @Published var inhaleEnds = false
    @Published var hold1Ends = false
    @Published var exhaleEnds = false
    @Published var hold2Ends = false
    
    @Published var totaltime = 0
    
    
    var paused = false
    
    var timerManager = TimerManager()
    
    var audioPlayer: AVAudioPlayer!
    
    var showAlert: Bool = false
    
    private let queue = DispatchQueue.init(label: "stopwatch.timer", qos: .background, attributes: [], autoreleaseFrequency: .never, target: .global())
    
    var timer = Timer
        .publish(every: 1, on: .main,  in: .common).autoconnect()
    
    private var sourceTimer: DispatchSourceTimer?
    
    private func startTimer() {
        self.sourceTimer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags.strict,
                                                          queue: self.queue)
    }
    
    
    
    func progressResult(whatBreath: Int) -> CGFloat {
        return CGFloat(((1 / Double(whatBreath) * 10) / 10))
    }
    
    func intervalToAdjust(inhalE: Int, holD1: Int, exhalE: Int, holD2: Int) {
        inhale = inhalE
        hold1 = holD1
        exhale = exhalE
        hold2 = holD2
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
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func timeString(time: Int) -> String {
        // let hours   = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func descendTime(time: inout Int) {
        
        if time > 0 {
            time -= 1
        }
        
    }
    
    func descendTime(time: inout Int, previosEnd: Bool) {
        if time > 0 && previosEnd == true {
            time -= 1
        }
    }
    
    func isEnd(breathTime: Int, endTime: inout Bool) {
        if breathTime == 0 && totaltime > 0 {
            endTime = true
        }
        
        
    }
    
    
    func fetchData() {
        if hold2 == 0 && totaltime > 0 {
            
            inhaleEnds = false
            hold1Ends = false
            exhaleEnds = false
            
            
            inhale = UserDefaults.standard.integer(forKey: "inhale")
            
            hold1 = UserDefaults.standard.integer(forKey: "hold1")
            exhale = UserDefaults.standard.integer(forKey: "exhale")
            hold2 = UserDefaults.standard.integer(forKey: "hold2")
            
        }
    }
    func restartPeriods() {
        
        totaltime = UserDefaults.standard.integer(forKey: "inputTime") * 60
        
        
        inhale = UserDefaults.standard.integer(forKey: "inhale")
        
        hold1 = UserDefaults.standard.integer(forKey: "hold1")
        exhale = UserDefaults.standard.integer(forKey: "exhale")
        hold2 = UserDefaults.standard.integer(forKey: "hold2")
        
        inhaleEnds = false
        hold1Ends = false
        exhaleEnds = false
        
        
    }
    
    func playTikTak() {
        let sound = Bundle.main.path(forResource: "tiktak", ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
    }
    
    
    func configureTimer() -> DispatchSourceTimer {
        let timer = DispatchSource.makeTimerSource()
        timer.schedule(deadline: .now(), leeway: .never)
        timer.setEventHandler{
            
        }
        
        timer.activate()
        
        
        return timer
    }
    
}

