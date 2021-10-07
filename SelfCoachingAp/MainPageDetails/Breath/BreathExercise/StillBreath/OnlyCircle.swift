import SwiftUI
struct OnlyCircle: View {
   
   
    
    @Binding var isAnimating: Bool
    @State private var scale: CGFloat = 0.3
    @State private var animFlag = false
    @State var animationFlag = true
    @State private var vector = 0
    
    
    var id: Double {
            duration * Double(isAnimating ? 1000 : 1)
        }
    let duration: TimeInterval
    
    
    @ObservedObject var timerViewModelShared = TimerViewModel()
    var timerView = TimerView()
    var body: some View {
       
        let anim = Animation.linear(duration: duration).repeatCount(1, autoreverses: true)
            
        let noAnim = Animation.easeInOut(duration: duration).repeatCount(0)
ZStack {
    
    Color.blue
        .id(id)
        .clipShape(Circle())
        .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .center)
        .shadow(color: .gray, radius: 4, x: 0, y: 4)
        .onAnimationCompleted( for: id, completion: {

                animFlag.toggle()
           // if !timerView.isPlay {
            delaystart()

                //timerViewModelShared.delaystart()
       //    }


           // vector += 1
//            if vector == 1 {
//                isAnimating.toggle()
//            }
           //isAnimating.toggle()
           // print(vector)
        })
        .scaleEffect(animFlag ? 1.3 : 0.3)
        .animation(anim)
        .saturation(0.3)
        
        .onAppear{
            print("ON APPEAR")

        
           //   if isAnimating  {
                  animFlag.toggle()
//                    withAnimation(timerView.isPlay ? anim : nil) {
//                        animFlag.toggle()
//
//                        //print(vector)
//                    }
//
          //     }
}
}
}
    
    func delaystart() {
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
         //   isAnimating.toggle()
          //  if !isAnimating   {
                delaystart()
          //  }
            print("Dispatch")
                           
        }
    }
    

    
    
}

extension View {

    func onAnimationCompleted<Value: VectorArithmetic>(for value: Value, completion: @escaping () -> Void) -> ModifiedContent<Self, AnimationCompletionObserverModifier<Value>> {
        return modifier(AnimationCompletionObserverModifier(observedValue: value, completion: completion))
    }
}

struct AnimationCompletionObserverModifier<Value>: AnimatableModifier where Value: VectorArithmetic {


    var animatableData: Value {
        didSet {
            notifyCompletionIfFinished()
        }
    }


    private var targetValue: Value


    private var completion: () -> Void

    init(observedValue: Value, completion: @escaping () -> Void) {
        self.completion = completion
        self.animatableData = observedValue
        targetValue = observedValue
    }
    
    
    private func notifyCompletionIfFinished() {
        guard animatableData == targetValue else { return }

        DispatchQueue.main.async {
            self.completion()
        }
    }

    func body(content: Content) -> some View {
        return content
    }
}
