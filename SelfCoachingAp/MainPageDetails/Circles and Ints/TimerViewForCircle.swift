import SwiftUI

struct TimerViewForCircle: View {
    
    @StateObject var stateObject:  FourCirclesViewModel
    @EnvironmentObject var timerManager: TimerManager
    
    var body: some View {
        
        
        Text("\(stateObject.timeString())")
            .font(.system(size: 50))
            .frame(height: 40.0)
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.gray)
            .opacity(0.2)
            .onReceive(stateObject.timer){ _ in
                stateObject.descendTime(time: &stateObject.totaltime)
             
            }
     
        
    }
    
}
