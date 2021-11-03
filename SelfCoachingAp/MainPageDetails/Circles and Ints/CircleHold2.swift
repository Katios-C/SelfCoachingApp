import SwiftUI

struct CircleHold2: View {
    
    
    @ObservedObject var stateObject: fourCirclesViewModel
    
    @State var percent = 0.0
    @State var hold2 = 0
    
    
    var body: some View {
        VStack {
            Text("Задержка")
            ZStack {
                Circle()
                    .fill(stateObject.hold2 == 0 || !stateObject.exhaleEnds ? Color.gray.opacity(0.2) : Color.yellow)
                    .grayscale(2)
                    .frame(width: 60, height: 60)
                
                
                Text("\(stateObject.hold2)")
                    .onReceive(timer) { time in
                        
                        if stateObject.hold2 > 0 && stateObject.exhale == 0{
                            stateObject.hold2 -= 1
                        }
                        
                        if stateObject.hold2 == 0 && stateObject.totaltime > 0 {
                            
                            
                            stateObject.inhaleEnds = false
                            stateObject.hold1Ends = false
                            stateObject.exhaleEnds = false
                            
                            stateObject.inhale = UserDefaults.standard.integer(forKey: "inhale")
                            
                            stateObject.hold1 = UserDefaults.standard.integer(forKey: "hold1")
                            stateObject.exhale = UserDefaults.standard.integer(forKey: "exhale")
                            stateObject.hold2 = UserDefaults.standard.integer(forKey: "hold2")
                            
                        }
                    }
            }
        }
    }
}
