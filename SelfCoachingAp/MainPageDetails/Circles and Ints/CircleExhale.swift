import SwiftUI

struct CircleExhale: View {
    
    @ObservedObject var stateObject: fourCirclesViewModel
    var body: some View {
        VStack {
            Text("Выдох")
            
            ZStack {
                Circle()
                    .fill(stateObject.exhale == 0 || !stateObject.hold1Ends ? Color.gray.opacity(0.2) : Color.yellow)
                    .grayscale(2)
                    .frame(width: 60, height: 60)
                
                Text("\(stateObject.exhale)")
                    .onReceive(timer) { time in
                        
                        if stateObject.exhale > 0 && stateObject.hold1Ends && stateObject.totaltime > 0  {
                            stateObject.exhale -= 1
                        }
                        
                        if stateObject.exhale == 0 && stateObject.totaltime > 0 {
                            stateObject.exhaleEnds = true
                        }
                    }
            }
        }
        
    }
}

