import SwiftUI

struct CircleHold2: View {
  
    
    @ObservedObject var stateObject: fourCirclesViewModel
    
    @State var percent = 0.0
    
    
    var body: some View {
        VStack {
            Text("Задержка")
        ZStack {
            Circle()
              
            
                .fill(stateObject.hold2 == 0 || !stateObject.exhaleEnds ? Color.gray.opacity(0.2) : Color.yellow)
                .grayscale(2)
                .frame(width: 60, height: 60)
              //  .opacity(0.2)
//                .overlay(Circle()
//                            .trim(from: 0, to: stateObject.hold2Progress * 1.01)
//                            .stroke(stateObject.hold2 == 0 ? Color.clear : Color(.blue), lineWidth: 5)
//                            .grayscale(2)
//                            .rotationEffect(.degrees(-90)))
//                .animation(stateObject.hold1Progress == 0 ? nil : .linear(duration: 1))
//                .onReceive(timer) { _ in
//
////                    if stateObject.hold2 > 0 && stateObject.exhaleEnds {
////                        stateObject.hold2 -= 1
////                    }
//                    if stateObject.hold2 == 0 && stateObject.totaltime > 0 {
//                       
//
//                     stateObject.inhaleEnds = false
//                     stateObject.hold1Ends = false
//                      stateObject.exhaleEnds = false
//                   //  stateObject.hold2Ends = true
//
////
////                       stateObject.inhaleProgress = 0
////                      stateObject.hold1Progress = 0
////                    stateObject.exhaleProgress = 0
////                      stateObject.hold2Progress = 0
//
//                        stateObject.inhale = UserDefaults.standard.integer(forKey: "inhale")
//
//                       stateObject.hold1 = UserDefaults.standard.integer(forKey: "hold1")
//                    stateObject.exhale = UserDefaults.standard.integer(forKey: "exhale")
//                       stateObject.hold2 = UserDefaults.standard.integer(forKey: "hold2")
//
//                    }                     }
                
            Text("\(stateObject.hold2)")
                       .onReceive(timer) { time in
                           DispatchQueue.main.async {
                           if stateObject.hold2 > 0 && stateObject.exhaleEnds {
                               stateObject.hold2 -= 1
                           }
                           
                           if stateObject.hold2 == 0 && stateObject.totaltime > 0 {
                              
                               
                            stateObject.inhaleEnds = false
                            stateObject.hold1Ends = false
                             stateObject.exhaleEnds = false
                          //  stateObject.hold2Ends = true
                               
       //
       //                       stateObject.inhaleProgress = 0
       //                      stateObject.hold1Progress = 0
       //                    stateObject.exhaleProgress = 0
       //                      stateObject.hold2Progress = 0

                               stateObject.inhale = UserDefaults.standard.integer(forKey: "inhale")
                               
                              stateObject.hold1 = UserDefaults.standard.integer(forKey: "hold1")
                           stateObject.exhale = UserDefaults.standard.integer(forKey: "exhale")
                              stateObject.hold2 = UserDefaults.standard.integer(forKey: "hold2")
                               
                           }
                           
                           }
        }
    }
           }
//        .onAppear {
//            percent = stateObject.progressResult(whatBreath: stateObject.hold1)
//            print("PERCENT")
//            print(percent)
//        }
             
}

    


}
