import SwiftUI

struct CircleInhale: View {
    
    @ObservedObject var stateObject: fourCirclesViewModel
    let timerInhale = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack {
            Text("Вдох")
            ZStack {
                Circle()
                    .fill( stateObject.inhale == 0 ? Color.gray.opacity(0.2) : Color.yellow)
                    .grayscale(2)
                    .frame(width: 60, height: 60)
                
                Text("\(stateObject.inhale)")
                    .onReceive(timer) { time in
                        if stateObject.inhale  > 0 && stateObject.totaltime > 0 {
                            stateObject.inhale -= 1
                        }
                        
                        
                        else if stateObject.inhale == 0 && stateObject.totaltime > 0
                        {
                            stateObject.inhaleEnds = true
                            
                 }
               }
            }
        }
    }
}


