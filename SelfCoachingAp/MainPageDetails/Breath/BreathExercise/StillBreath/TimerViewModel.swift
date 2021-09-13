
import Foundation

class TimerViewModel: ObservableObject, Injectable {
    
    @Published var secondsElapsed = 30
    
      @Published  var timer = Timer()
    @Published var mode: stopWatchMode = .stopped
    var counter: Int = 0
     var breath = ["Выдох", "Задержка"]
    
     var text = "НАЧАЛО"
    
    var indexForText = 0
    
    let timerForText = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.secondsElapsed > 0 {
            self.secondsElapsed = self.secondsElapsed - 1
             }
          //  self.restart()
        
            }
    }
    
    func startTextChange() {
        indexForText = 0

    }
    
    func restart() {
        if self.secondsElapsed == 0 {
            self.secondsElapsed += 30
            
           
        }
       // let cancellableTimerPublisher =  timerForText.upstream.autoconnect()
    }
    
    func pause() {
           timer.invalidate()
      //  timerForText.upstream.connect().cancel()
           mode = .paused
       }
       
    
//    func stop() {
//           timer.invalidate()
//           secondsElapsed = 0
//           mode = .stopped
//       }
    
    func stoptimerForText () {
        
        timerForText.upstream.connect().cancel()
    }
    func counterToMinute() -> String {
        let currentTime = secondsElapsed - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\( minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
    
    
    func changeText() -> String {
    var t = "Вдох"
        if indexForText < 2 {
           t = breath[indexForText]
            indexForText += 1
        }
        else { indexForText = 0 }
        return t
}

    


enum stopWatchMode {
    case running
    case stopped
    case paused
}
}
