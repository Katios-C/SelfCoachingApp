

import SwiftUI

struct RingView: View {
    
    @ObservedObject var stateObject: TimerViewModel
    private let animation = Animation.linear(duration: 1)
    
    var body: some View {
        ZStack {
            Ring(fillPoint: 1)
                .fill(Color.blue.opacity(0.1))
                .rotationEffect(.degrees(0))
                .frame(width: 100, height: 100)
            
            Ring(fillPoint: 1)
                .trim(from: 0, to:  1 - ((stateObject.defaultTimeRemain - stateObject.timeRemain) / stateObject.defaultTimeRemain))
            .stroke(Color.red, style: StrokeStyle(lineWidth: 6, lineCap: .round))
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(180))
           
            .animation(stateObject.timeRemain == stateObject.defaultTimeRemain ? nil : animation)
        }
    }
}


