
import SwiftUI

struct TriangleView: View {
    
    
    @ObservedObject var stateObject: TimerViewModel
    private let animation = Animation.linear(duration: 1)
    
    
    var body: some View {
       
        ZStack {
            TriangleSpokoyst()
                .fill(Color.blue.opacity(0.1))
                .rotationEffect(.degrees(0))
                .frame(width: 100, height: 100)
             
                
        TriangleSpokoyst()
                .trim(from: 0, to:  1 - ((stateObject.defaultTimeRemain - stateObject.timeRemain) / stateObject.defaultTimeRemain))
            .stroke(Color.red, style: StrokeStyle(lineWidth: 6, lineCap: .round))
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(0))
            .animation(stateObject.timeRemain == stateObject.defaultTimeRemain  ? nil : animation)
           
            
         
            Label("\(stateObject.isActive ? "" : "")", systemImage: "\(stateObject.isActive ? "pause.fill" : "play.fill")")
                .foregroundColor(stateObject.isActive ? .yellow : .yellow)
                .font(.largeTitle)
                .opacity(stateObject.isActive ? 0.5 : 1)
                .offset(x: 5, y: 40)
                .onTapGesture(perform: {
                    stateObject.isActive.toggle()
                    
            })
            

      
        }
    }
}
