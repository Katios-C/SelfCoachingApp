import SwiftUI

struct TimerViewForCircle: View {
  
    @StateObject var stateObject:  fourCirclesViewModel
    
  //  @State var timeRemaining = 5
 //   let timerS = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        Text("\(timeString(time: stateObject.totaltime))")
            .font(.system(size: 30))
            .frame(height: 40.0)
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.green)
            .background(Color.gray)
          //  .opacity(0.2)
            .grayscale(2)
            .onReceive(timer){ _ in
                          if stateObject.totaltime > 0 {
                              stateObject.totaltime -= 1
                          }
                      }
    }
    
    //Convert the time into 24hr (24:00:00) format
    func timeString(time: Int) -> String {
       // let hours   = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
}
