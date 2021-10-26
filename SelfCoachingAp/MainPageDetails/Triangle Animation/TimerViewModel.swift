
import Foundation

class TimerViewModel: ObservableObject {
    
   // @Published var secondsElapsed = 29
    
      @Published  var timer = Timer()
    @Published var mode: stopWatchMode = .stopped
    var counter: Int = 0
     var breath = ["Выдох", "Задержка"]
    
  //  @Published var isAnimated = false
    
    var isA = false {
        didSet {
            objectWillChange.send()
        }
    }
    
    
   //  var text = "НАЧАЛО"
   // @Published var isButtonPressed = false
    var indexForText = 0
    
    let timerForText = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    
    func start() {
//        mode = .running
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//            if self.secondsElapsed > 0 {
//            self.secondsElapsed = self.secondsElapsed - 1
//             }
//          //  self.restart()
//
//            }
    }
    
    func breathWord(time: Int, type: String) -> String {
        var returnWord = ""
        
        if type == "Бодрость" {
        if time >= 10 {
            returnWord = "Вдох"
        }
        else if time <= 9 && time > 5 {
            returnWord = "Задержка"
        }
        else {
            returnWord = "Выдох"
        }
}

        if type == "Спокойствие" {
            if time >= 10 {
                returnWord = "вдох"
            }
            else if time <= 9 && time > 4 {
                returnWord = "выдох"
            }
            else {
                returnWord = "задержка"
            }
        }
        
        
        return returnWord
    }
    
    
    func delaystart() {
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
//           self.isA.toggle()
//            print("isS - \(self.isA)")
//            if !self.isA {
//                print("block else")
//                self.delaystart()
//            }
//            print("Dispatch")
//                           }
//       // self.objectWillChange.send()
    }
    
    func startTextChange() {
       // indexForText = 0

    }
    
    func restart() {
//        if self.secondsElapsed == 0 {
//            self.secondsElapsed += 30
            
           
        }
       // let cancellableTimerPublisher =  timerForText.upstream.autoconnect()
    }
    
    func pause() {
//           timer.invalidate()
//      //  timerForText.upstream.connect().cancel()
//           mode = .paused
       }
       
 
    
    
//    func stop() {
//           timer.invalidate()
//           secondsElapsed = 0
//           mode = .stopped
//       }
    
    func stoptimerForText () {
        
      //  timerForText.upstream.connect().cancel()
    }
    func counterToMinute() -> String {
//        let currentTime = secondsElapsed - counter
//               let seconds = currentTime % 60
//               let minutes = Int(currentTime / 60)
//
//               return "\( minutes):\(seconds < 10 ? "0" : "")\(seconds)"
        return ""
    }
    
    
//    func changeText() -> String {
//    var t = "Вдох"
//        if indexForText < 2 {
//           t = breath[indexForText]
//            indexForText += 1
//        }
//        else { indexForText = 0 }
//        return t
//}

    


enum stopWatchMode {
    case running
    case stopped
    case paused
}
//}
