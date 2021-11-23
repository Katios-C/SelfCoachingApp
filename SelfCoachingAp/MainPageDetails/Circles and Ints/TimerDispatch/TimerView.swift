//
//import SwiftUI
//
//struct TimerView: View {
//
//    @EnvironmentObject  var timerManager: TimerManager
//
//    @State var timerDisplayString: String = "0:00"
//    
//    func setTimerEventHandler() {
//        
//        self.timerManager.eventHandler = { counter in
//            DispatchQueue.main.async {
//                self.timerDisplayString = TimerManager.convertCountToTimeString(counter: counter)
//            }
//        }
//    }
//    
//    var body: some View {
//        VStack {
//                 
//              HStack {
//                VStack {
//                   // Text("Timer View").font(.headline).padding()
//                    
//                     Text(self.timerDisplayString).onTapGesture {
//                        if self.timerManager.paused == false {
//                            self.timerManager.pause()
//                        } else {
//                            self.timerManager.start()
//                        }
//
//                    }
//                    
//                }
//
//            }
//        }.onAppear(perform: {
//           
//            if self.timerManager.isActive == false {
//
//                self.timerManager.start()
//                
//            }
//            
//            self.timerDisplayString = TimerManager.convertCountToTimeString(counter: self.timerManager.counter)
//            
//            self.setTimerEventHandler()
//            
//        })
//    }
//}
