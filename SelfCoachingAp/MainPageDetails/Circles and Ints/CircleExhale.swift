import SwiftUI

struct CircleExhale: View {

    @ObservedObject var stateObject: fourCirclesViewModel
    @State var percent = 0.0
    
    var body: some View {
        VStack {
            Text("Выдох")
        
        ZStack {
            Circle()
              
            
                .fill(stateObject.exhale == 0 || !stateObject.hold1Ends ? Color.gray.opacity(0.2) : Color.yellow)
                .grayscale(2)
                .frame(width: 60, height: 60)
               // .opacity(0.2)
//                .overlay(Circle()
//                            .trim(from: 0, to: stateObject.exhaleProgress * 1.1)
//                            .stroke(stateObject.exhale == 0 ? Color.clear : Color(.purple), lineWidth: 5)
//                            .grayscale(2)
//                            .rotationEffect(.degrees(-90)))
//                .animation(stateObject.exhaleProgress == 0 ? .linear(duration: 0) : .linear(duration: 1))
//                .onReceive(timer) { _ in
//
////                    if stateObject.exhale > 0 && stateObject.hold1Ends {
////                        stateObject.exhale -= 1
////                    }
////
//
//                    if stateObject.exhale == 0 && stateObject.totaltime > 0 {
//                        stateObject.exhaleEnds = true
//
//                    }
//                    }
                
            Text("\(stateObject.exhale)")
                       .onReceive(timer) { time in
                           DispatchQueue.main.async {
                           if stateObject.exhale > 0 && stateObject.hold1Ends {
                               stateObject.exhale -= 1
                           }
                           
                           if stateObject.exhale == 0 && stateObject.totaltime > 0 {
                               stateObject.exhaleEnds = true
                              
                           }
        }
    }
        }}
             
}

    
}

