import SwiftUI
struct MainView: View {
    @State private var fillPoint = 1.0
    @State private var animationDuration = 10.0
    @State private var  stopAnimation = true
    @State private var countdownTimer: Timer?
    
    private var ring: Ring {
        let ring = Ring(fillPoint: self.fillPoint)
        return ring
    }
    
    var body: some View {
        VStack {
            ring.stroke(Color.red, lineWidth: 15.0)
                .frame(width: 200, height: 200)
                .padding(40)
                .animation(self.stopAnimation ? nil : .easeIn(duration: 0.1))
            HStack {
                Button(action: {
                    self.stopAnimation = false
                    self.countdownTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                        guard self.animationDuration > 0 else {
                            self.countdownTimer?.invalidate()
                            return
                        }
                        self.fillPoint = self.animationDuration/10
                        self.animationDuration -= 0.1
                    })
                }) {
                    Text("Start")
                }
                Button(action: {
                    self.countdownTimer?.invalidate()
                    self.stopAnimation = true
                    
                }) {
                    Text("Stop")
                }
            }
        }
    }
}


struct Ring: Shape {
  var startArcAngle: Double = 360.0

  var fillPoint: Double {
    willSet {
      startArcAngle = 360 * newValue
    }
  }

  internal var animatableData: Double {
    get { return fillPoint }
    set { fillPoint = newValue }
  }

  internal func path(in rect: CGRect) -> Path {
    let endArcAngle = 0.0

    var path = Path()

    path.addArc(center: CGPoint(x: rect.size.width / 2,
                                y: rect.size.height / 2),
                radius: rect.size.width / 2,
                startAngle: .degrees(startArcAngle - 90),
                endAngle: .degrees(endArcAngle - 90),
                clockwise: true)

    return path
  }
}
