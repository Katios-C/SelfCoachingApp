
import Foundation
import SwiftUI
import CoreData
import  iOSDevPackage

struct TimerView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
 
    @Environment(\.managedObjectContext) private var managedObjectContext

    @State var duration: TimeInterval = 5
 //   @State var isAnimating: Bool = false
    
    @State var isPlay = true
    
    @State private var stopAnimation = true
    @State private var countdownTimer: Timer?
    
    
    @ObservedObject var timerViewModelShared = TimerViewModel()
    @ObservedObject var persistenceShared =  PersistenceController()
    
  
    @State var timeText = "00:30"
    
    @State var isStart = false
   
    let persistenceController = PersistenceController.shared
    
    
    
    var body: some View {
       
        VStack {
          //  CircleTry(duration: duration, isAnimating: isAnimating)
            OnlyCircle(isAnimating: $timerViewModelShared.isA, duration: duration)
            
            Button(isPlay ? "Stop" : "Start") {
                isPlay.toggle()
//                if isPlay {
//                    timerViewModelShared.isButtonPressed = true
//                    print("ISPLAY")
//
//
//                } else {
//                   // timerViewModelShared.isA.toggle()
//                    print("NOTPLAY")
//                }
                timerViewModelShared.isA.toggle()
               
                
            }
      
            
            
          
//            ZStack {
//
//                Color.gray
//                    .clipShape(Circle())
//                   // .opacity(0.9)
//                    .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .center)
//                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
//                    .onAppear(perform:  {
//                        self.scale = 1.3
//
//
//                    })
//                    .scaleEffect(scale)
//                    .animation( .easeInOut(duration: 5).repeatCount(10))
//
//                   // .scaleEffect(text == "Выдох" ? 1 : 0.5)
//
//
//
//            Text(text)
//                .foregroundColor(.white)
//                .fontWeight(.thin)
//            .padding()
//            .fixedSize()
//                .onTapGesture {
//                    self.repeatCount = 0
//                    print("TAP")
//                    animationGlag = false
//                }
//            .onReceive(timerViewModelShared.timerForText) {_ in
//                if timerViewModelShared.secondsElapsed > 0 {
//                text = timerViewModelShared.changeText()
//            }
//                else {
//                    timerViewModelShared.stoptimerForText()
//                }
//
//        }
//            }

            Spacer()
//            HStack {
//            Text(timeText)
//                .foregroundColor(.green)
//                .fontWeight(.heavy)
//                .padding(10)
//               // .background(Color.green)
//                .cornerRadius(10)
//               // .frame(width: 150, height: 50)
//                .fixedSize()
//
//                .onAppear() {
//                    self.timerViewModelShared.start()
//
//                }
//
//                .onReceive(timer) { _ in
//                    timeText = timerViewModelShared.counterToMinute()
//                }
//
//
//            }
//                ZStack {
//            if timerViewModelShared.mode == .stopped {
//                           Button(action: {self.timerViewModelShared.start()}) {
//                               TimerButton(label: "Start", buttonColor: .blue)
//                           }
//                       }
//
//            if timerViewModelShared.mode == .running && timerViewModelShared.secondsElapsed > 0  {
//
//                Button(action: {self.timerViewModelShared.pause()}) {
//                                TimerButton(label: "Pause", buttonColor: .blue)
//
//                }
//
//                        }
//
//
//            if timerViewModelShared.mode == .paused {
//                            Button(action: {self.timerViewModelShared.start()}) {
//                                TimerButton(label: "Start", buttonColor: .blue)
//                            }
//
//                        }
//            if timerViewModelShared.secondsElapsed == 0 {
//                Button(action: {self.timerViewModelShared.restart()
//
//                }) {
//                    TimerButton(label: "Restart", buttonColor: .yellow)
//                }.onReceive(timerViewModelShared.timerForText) {_ in
//                    timerViewModelShared.startTextChange()
//
//                }
//
//            }
//                }
            VStack {
                TimerButton(label: "Переход к списку CoreDate", buttonColor: .blue)
                    .onTapGesture {
                        navigation.push(SavedMinutesList().environment(\.managedObjectContext, self.managedObjectContext))
                    }
                }
                    }
        .onAppear() {
            isStart = true
            
            
        }
                }
    
    
            }
    
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct CircleTry: View {

    
    var id: Double {
            duration * Double(isAnimating ? 1000 : 1)
        }
    let duration: TimeInterval
    var isAnimating: Bool
    @State private var scale: CGFloat = 0.3
        @State private var animFlag = false
    
    
   // @State var scale: CGFloat = 0.3
    @State var text = "Вдох"
    @ObservedObject var timerViewModelShared = TimerViewModel()
    @State var animationFlag = true
    @State private var repeatCount = 10
    
   
    var body: some View {
        let _ = print("REDRAW")
        let anim = Animation.easeInOut(duration: duration).repeatCount(2, autoreverses: true)
            
        let noAnim = Animation.easeInOut(duration: duration).repeatCount(0)
ZStack {
    
    Color.gray
        .id(id)
        .clipShape(Circle())
       // .opacity(0.9)
        .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .center)
        .shadow(color: .gray, radius: 4, x: 0, y: 4)
        .animation(text != "Вдох" ? anim : nil)
//        .onAppear(perform:  {
//            self.scale = 1.3
//
//
//        })
//        .scaleEffect(scale)
//        .animation( .easeInOut(duration: 5).repeatCount(10))
        
       // .scaleEffect(text == "Выдох" ? 1 : 0.5)
        .scaleEffect(animFlag ? 1.3 : 0.3)
        .onAppear {
            print("ON APPEAR")
           
                if isAnimating {
                    withAnimation(anim) {
                        animFlag.toggle()
                    }
                }
            
            
        }
       // .animation(isAnimating ? anim : noAnim)
//        .onTapGesture {
//            timerViewModelShared.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//                if  timerViewModelShared.secondsElapsed > 0 {
//                    timerViewModelShared.secondsElapsed = timerViewModelShared.secondsElapsed - 1
//                 }
//        }
//        }
Text(text)
    .foregroundColor(.white)
    .fontWeight(.thin)
.padding()
.fixedSize()
//    .onReceive(timerViewModelShared.timerForText) {_ in
//        if timerViewModelShared.secondsElapsed > 0 {
//      //  text = timerViewModelShared.changeText()
//            text = "раз"
//    }
//        else {
//            timerViewModelShared.stoptimerForText()
//        }
//
//    }
//    .onReceive(timerViewModelShared.timerForText){_ in
//        if isAnimating {
//        if timerViewModelShared.secondsElapsed > 0 {
//              text = timerViewModelShared.changeText()
//               //   text = "раз"
//          }
//              else {
//                  timerViewModelShared.stoptimerForText()
//              }
//        }
//    }
}
}
}
    

