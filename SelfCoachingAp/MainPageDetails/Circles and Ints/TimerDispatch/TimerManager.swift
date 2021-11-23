import Foundation
import SwiftUI
import Combine

class TimerManager:ObservableObject {
    
    var sourceTimer: DispatchSourceTimer?

    private let queue = DispatchQueue.init(label: "stopwatch.timer", qos: .background, attributes: [], autoreleaseFrequency: .never, target: .global())
    var counter: Int = 0  // seconds

    var endDate: Date?
    var duration: TimeInterval?
    
    var eventHandler: ((Int) -> Void)?

    var paused = false
    
   var isActive: Bool {
        return  self.sourceTimer != nil
    }
    
    func start() {
        self.paused = false
    
        guard let _ = self.sourceTimer else {
            self.startTimer()
            return
        }
        
        self.resumeTimer()
    }
    
     func finish() {
        
        guard self.sourceTimer != nil else {return}
        self.endDate = Date()
        self.duration = TimeInterval(exactly: Double(self.counter))
//         self.duration = 1.0
        self.sourceTimer?.setEventHandler {}
        self.sourceTimer?.cancel()
        if self.paused == true {
            self.sourceTimer?.resume()
        }
        self.sourceTimer = nil
        self.reset()
 
     }
    
    func pause() {
          self.paused = true
          self.sourceTimer?.suspend()
        
      }
     
     private func reset() {
       //  self.timeDisplayString = "0:00"
         self.counter = 0
    
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
    
    private func updateTimer() {
        self.counter += 1

    }
    

}


extension TimerManager {
    static func convertCountToTimeString(counter: Int) -> String {
       
        let seconds = counter % 60
        let minutes = (counter / 60) % 60
        let hours = (counter / (60 * 60)) % 60
        
     
        var secondsString = "\(seconds)"
        var minutesString = "\(minutes)"
        var hoursString = "\(hours)"
        
        
        if seconds < 10 {
            secondsString = "0" + secondsString
        }
        
        if minutes < 10 {
            minutesString = "0" + minutesString
        }
        
        if hours < 10 {
            hoursString = "0" + hoursString
        }
        
        var watchTimeString = "\(secondsString)"
       
//        if hoursString == "00" {
//            watchTimeString = String(watchTimeString.dropFirst(3))
//        }
        return watchTimeString
    }
}
