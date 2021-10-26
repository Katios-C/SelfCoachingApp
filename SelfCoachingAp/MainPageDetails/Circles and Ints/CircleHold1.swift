import SwiftUI

struct CircleHold1: View {

    @State var percent = 0.0
    
    @ObservedObject var stateObject: fourCirclesViewModel
    var body: some View {
        VStack {
            
        Text("Задержка")
        ZStack {
            Circle()
              
            
                .fill(stateObject.hold1 == 0 || !stateObject.inhaleEnds ? Color.gray.opacity(0.2) : Color.yellow)
                .grayscale(2)
                .frame(width: 60, height: 60)
               // .opacity(0.2)
//                .overlay(Circle()
//                            .trim(from: 0, to: stateObject.hold1Progress * 1.01)
//                            .stroke(stateObject.hold1 == 0 ? Color.clear : Color(.green), lineWidth: 5)
//                            .grayscale(2)
//                            .rotationEffect(.degrees(-90)))
//                .animation(stateObject.hold1Progress == 0 ? nil : .linear(duration: 1))
//                .onReceive(timer) { _ in
//
////                    if stateObject.hold1 > 0 && stateObject.inhaleEnds {
////                        stateObject.hold1 -= 1
////                    }
//                    if stateObject.hold1 == 0 && stateObject.totaltime > 1 {
//                        stateObject.hold1Ends = true
//
//                    }
//                    }
                
            Text("\(stateObject.hold1)")
                       .onReceive(timer) { timer in
                           DispatchQueue.main.async {
                           if stateObject.hold1 > 0 && stateObject.inhaleEnds {
                               stateObject.hold1 -= 1
                           }
                           
                           if stateObject.hold1 == 0 && stateObject.totaltime > 1 {
                               stateObject.hold1Ends = true
                              
                           }
        }
    }
           }
        }
           
    }
       
}

    


