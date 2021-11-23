//
//import SwiftUI
//
//struct SingleCircle: View {
//   @State var text = 5
//  //  var dispatchTimer = DispatchTimerViewModel()
//    @EnvironmentObject var timerManager: TimerManager
//    
//    
//    var body: some View {
//        ZStack {
//        Circle()
//            .fill(Color.yellow)
//            .grayscale(2)
//            .frame(width: 60, height: 60)
//            
//            Text("\(text)")
//        }.onAppear{
//            timerManager.start()
//            incrementInt()
//        }
//    }
//    func incrementInt() {
//        timerManager.sourceTimer?.setEventHandler {
//            
//            if text > 0 {
//                text -= 1
//            }
//            else {
//                text = 5}
//            
//            
//         
//            
//            timerManager.eventHandler?(text)
//        }
//        
//        timerManager.sourceTimer?.schedule(deadline: .now(),
//                                   repeating: 1)
//       // timerManager.sourceTimer?.resume()
//    }
//}
//
