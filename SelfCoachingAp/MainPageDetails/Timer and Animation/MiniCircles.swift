
import SwiftUI
import iOSDevPackage

struct MiniCircles: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    private let animation = Animation.linear(duration: 1)
    @State private var miniCircleTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var changeInt = 0
    
  //  @EnvironmentObject var viewModel: MiniCirclesViewModel
    
    @ObservedObject var viewModel: MiniCirclesViewModel
    
//    @Binding var inhale: Int
//    @Binding var hold1: Int
//    @Binding var exhale: Int
//    @Binding var hold2: Int
    
    var body: some View {
        
        
        ZStack {
            
        Image("m6")
            
            VStack {
                HStack {
            Button(action: {
                navigation.pop(to: .previous)
            }, label: {
                Text("Back")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(width: UIScreen.main.bounds.width / 4)
                    .background(Color.green)
                    .clipShape(Capsule())
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    .grayscale(2)
            })
                    Spacer()
                }
                .padding()
                Divider()
                Spacer()
                
                HStack {
//                    Text("\(viewModel.inhale)")
//                    Text("\(viewModel.hold1)")
//                    Text("\(viewModel.exhale)")
//                    Text("\(viewModel.hold2)")
                    SingleCircle( delay: 0, viewModel: viewModel)
                    SingleCircle( delay:  Double(viewModel.inhale), viewModel: viewModel)
                    SingleCircle( delay: Double(viewModel.inhale + viewModel.hold1), viewModel: viewModel)
                    SingleCircle( delay:  Double(viewModel.inhale + viewModel.hold1 + viewModel.exhale), viewModel: viewModel)
                }
                .animation(animation)
               
               
                .padding(.bottom, 50)
                
            }
           
        }
    }
    
//    func returnTotalTime() -> Double {
//        var resultTime = Double(inhale + hold1 + exhale + hold2)
//
//        print("returnTotalTime - \((4 * resultTime) / 20)")
//        return (4 * resultTime) / 20
//    }
        
}
let defaultTimerRemain: CGFloat = 15

struct SingleCircle: View {
   
    
    @State private var timeRemaining: CGFloat = defaultTimerRemaining
   // @State var changeInt = 0
    @State var progress: CGFloat = 0
    @State var delay: Double
   
    
    @State private var miniCircleTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private let animation = Animation.linear(duration: 10)
    
    @ObservedObject var viewModel: MiniCirclesViewModel
    
    var body: some View {
        Circle()
            .trim(from: 0, to: progress)
           // .stroke(Color.yellow, style: StrokeStyle(lineWidth: 4, lineCap: .round))
           
            .frame(width: 75, height: 75)
            .rotationEffect(.degrees(-90))
          //  .foregroundColor(Color.green)
            // .padding(5)
            .animation(progress == 0 ? nil : animation.delay(delay))
            .onReceive(miniCircleTimer, perform: { _ in
        
                if progress <= viewModel.returnTotalTime() {
                    progress += 0.2
                }
                else {
                    progress = 0
                }
                    
                 })
         
           
             }
    

    }


