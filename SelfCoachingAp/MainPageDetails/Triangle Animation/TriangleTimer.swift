
import SwiftUI


struct TriangleTimer: View {
    @ObservedObject var stateObject: TimerViewModel
    @State private var isActive = false

    private let animation = Animation.linear(duration: 1)

    
    var body: some View {
       
        VStack {


            if  UserDefaults.standard.integer(forKey: "hold1") == 0 && UserDefaults.standard.integer(forKey: "hold2") != 0 {
                VStack {
                   
                TriangleView(stateObject: stateObject)
                    
                    ThreeLines()
                        .trim(from: 0, to:  1 - ((stateObject.defaultTimeRemain - stateObject.timeRemain) / stateObject.defaultTimeRemain))
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                        .frame(width: 100, height: 100)
                        .rotationEffect(.degrees(90))

                        .animation(stateObject.timeRemain == stateObject.defaultTimeRemain ? nil : animation)
                }
            }

            else if UserDefaults.standard.integer(forKey: "hold1") == 0 && UserDefaults.standard.integer(forKey: "hold2") == 0 {
                RingView(stateObject: stateObject)
            }

            else {
            RectBreathView(stateObject: stateObject)

            }


            Label(stateObject.breathWord(time: Int(stateObject.timeRemain), type: "Спокойствие"), systemImage: "")
                .foregroundColor(.red)
                            .font(.footnote)
                            .padding()

                .onReceive(timer, perform: { _ in

                        guard stateObject.isActive else {return}
                        if stateObject.timeRemain > 0 {
                            stateObject.timeRemain -= 1
                        } else {
                            stateObject.timeRemain = stateObject.defaultTimeRemain
                        }


                    })
}
        .onAppear{
            stateObject.isActive = true
        }

}
}

