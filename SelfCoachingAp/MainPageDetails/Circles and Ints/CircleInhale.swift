import SwiftUI

struct CircleInhale: View {

    @ObservedObject var stateObject: fourCirclesViewModel
 //   @State var percent = 0.0
 
    
    
    var body: some View {
        VStack {
            Text("Вдох")
        ZStack {
            Circle()
                .fill( stateObject.inhale == 0 ? Color.gray.opacity(0.2) : Color.yellow)
                .grayscale(2)
                .frame(width: 60, height: 60)
               // .opacity(0.2)
//                .overlay(Circle()
//                          //  .trim(from: 0, to: stateObject.inhaleProgress * 1.01)
//                          //  .stroke(stateObject.inhale == 0 ? Color.clear : Color(.yellow), lineWidth: 5)
//                            .grayscale(2)
//                            .rotationEffect(.degrees(-90)))
//                .animation(stateObject.inhaleProgress == 0 ? .linear(duration: 0) : .linear(duration: 1))
//
//                .onReceive(timer) { _ in
//
//                 //   stateObject.totaltime -= 1
//
//
////                    if stateObject.inhale > 0 {
////                        stateObject.inhale -= 1
////                    }
//
//
////                    if stateObject.inhaleProgress < 1  {
////                        stateObject.inhaleProgress += percent
////                    }
//                    if stateObject.inhale == 0 && stateObject.totaltime > 0
//                     {
//
//                        stateObject.inhaleEnds = true
//                      //  stateObject.hold2Ends = false
//                    }
//                    }
           
            Text("\(stateObject.inhale)")
                       .onReceive(timer) { time in
                           
                       
                           DispatchQueue.main.async {
                           
                           
                           if stateObject.inhale > 0 {
                               stateObject.inhale -= 1
                           }
                           
                           if stateObject.inhale == 0 && stateObject.totaltime > 0
                            {
                              
                               stateObject.inhaleEnds = true
                            //   timer.upstream.connect().cancel()
                           }
                            
                           }}
    }
           }
           
}

}


