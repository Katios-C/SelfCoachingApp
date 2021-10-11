
import SwiftUI
//let defaultTimerRemaining: CGFloat = 15

struct TriangleTimer: View {
    
    @State private var timeRemaining: CGFloat = defaultTimerRemaining
    private let animation = Animation.linear(duration: 1)
    @State private var isActive = false
    @State private var isSpinning: Bool = true
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   // let timer15 = Timer.publish(every: defaultTimerRemaining , on: .main, in: .common).autoconnect()
    var viewModel = TimerViewModel()
    var body: some View {
        
        
            
                
        VStack {
         
            
 Spacer()
    
        ZStack {
            TriangleSpokoyst()
                .fill(Color.blue.opacity(0.1))
                .rotationEffect(.degrees(0))
                .frame(width: 300, height: 300)
              //  .shadow(color: .gray, radius: 4, x: 0, y: 4)
                
        TriangleSpokoyst()
                .trim(from: 0, to:  1 - ((defaultTimerRemaining - timeRemaining) / defaultTimerRemaining))
            .stroke(Color.red, style: StrokeStyle(lineWidth: 6, lineCap: .round))
            //.fill(Color.red)
            .frame(width: 300, height: 300)
            .rotationEffect(.degrees(0))
           // .shadow(color: .gray, radius: 4, x: 0, y: 4)
            .animation(timeRemaining == 15 ? nil : animation)
           // .grayscale(2)
            
         
            Label("\(isActive ? "" : "")", systemImage: "\(isActive ? "pause.fill" : "play.fill")")
                .foregroundColor(isActive ? .yellow : .yellow)
                .font(.largeTitle)
                .opacity(isActive ? 0.5 : 1)
                .offset(x: 5, y: 40)
                .onTapGesture(perform: {
                    isActive.toggle()
                    
            })
            
            
        
        
            
            
//            Text(viewModel.breathWord(time: Int(timeRemaining), type: "Спокойствие")).font(.title)
      
        }
            Spacer()
            Label(viewModel.breathWord(time: Int(timeRemaining), type: "Спокойствие"), systemImage: "")
                .foregroundColor(.red)
                            //.opacity(0.5)
                            .font(.footnote)
                           
                            
            
                            .padding(20)

                .onReceive(timer, perform: { _ in
                       
                     //   withAnimation(animation) {
                        guard isActive else {return}
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        } else {
                           // isActive = false
                            timeRemaining = defaultTimerRemaining
                            
                     //   }
                        }
                    
                    })
            
            
            
//        Spacer()
//        HStack() {
//
//
//            Label(viewModel.breathWord(time: Int(timeRemaining), type: "Спокойствие"), systemImage: "")
//                            .foregroundColor(.yellow).font(.title)
//
//                .onReceive(timer, perform: { _ in
//
//                     //   withAnimation(animation) {
//                        guard isActive else {return}
//                        if timeRemaining > 0 {
//                            timeRemaining -= 1
//                        } else {
//                           // isActive = false
//                            timeRemaining = defaultTimerRemaining
//
//                     //   }
//                        }
//
//                    })
//
//    }
            Spacer()
}
        .onAppear{
            isActive = true
        }

}
}

