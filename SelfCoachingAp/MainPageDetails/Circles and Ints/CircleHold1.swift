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
                
                Text("\(stateObject.hold1)")
                    .onReceive(timer) { timer in
                        
                        if stateObject.hold1 > 0 && stateObject.inhaleEnds  && stateObject.totaltime > 0 {
                            stateObject.hold1 -= 1
                        }
                        else if stateObject.hold1 == 0 && stateObject.totaltime > 1 {
                            stateObject.hold1Ends = true
                        }
                    }
            }
        }
    }
}




