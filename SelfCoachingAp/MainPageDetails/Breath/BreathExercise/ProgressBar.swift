//import SwiftUI
//
//struct ProgressBars: View {
//    @Binding var value: Float
//    @State var counter: Int = 0
//     var countTo: Int = 60
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .leading) {
//                Rectangle().frame(width: geometry.size.width  , height: geometry.size.height ).cornerRadius(45)
//                    //.rotationEffect(.degrees(45))
//                    .opacity(0.3)
//                .foregroundColor(Color(UIColor.systemTeal))
//                
//                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
//                    .foregroundColor(Color(UIColor.systemBlue)).cornerRadius(45)
//                    //.rotationEffect(.degrees(45))
//                    .foregroundColor(Color(UIColor.systemBlue))
//                    .animation(.linear(duration: 5))
//                
//                
//            }
//            
//        }
//        .onReceive(timer) { time in
//            if (self.counter < self.countTo) {
//                self.counter += 1
//            }
//
//        }
//        
//    }
//}
//
//
//struct TimerView: View {
//    @State var progressValue: Float = 0.0
//    @State var counter: Int = 0
//     var countTo: Int = 5
//    
//    var body: some View {
//        VStack {
//            ProgressBars(value: $progressValue).frame(height: 20)
//            
////            Button(action: {
////                self.startProgressBar()
////            }) {
////                Text("Start Progress")
////            }.padding()
//           
//            
//            Button(action: {
//                self.resetProgressBar()
//            }) {
//                Text("Reset")
//            }
//            
//            ClockCircl(counter: counter, countTo: countTo)
//            Spacer()
//        }.padding()
//        
//        .onReceive(timer) {time in
//            
//            self.startProgressBar()
//            
//            if (self.counter < self.countTo) {
//                self.counter += 1
//            }
//        }
//        
//      
//    }
//    
//    func startProgressBar() {
//        for _ in 0...1280 {
//            self.progressValue += 1
//        }
//    }
//    
//    func resetProgressBar() {
//        self.progressValue = 0.0
//    }
//}
//
//
//struct ClockCircl: View {
//    var counter: Int
//    var countTo: Int
//    
//    
//    var body: some View {
//        VStack{
//            Text("\(counterToMinutes())")
//                .font(.system(size: 20))
//                .fontWeight(.black)
//        }
//    }
//    
//    func counterToMinutes() -> String {
//        let currentTime = countTo - counter
//        let seconds = currentTime % 60
//        let minutes = Int(currentTime / 60)
//        
//        return "\( minutes):\(seconds < 10 ? "0" : "")\(seconds)"
//    }
//}
