import SwiftUI
import iOSDevPackage


struct MainView: View {
    @State private var fillPoint = 1.0
    @State private var animationDuration = 5.0
    @State private var  stopAnimation = true
    @State private var countdownTimer: Timer?
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    private var ring: Ring {
        let ring = Ring(fillPoint: self.fillPoint)
        return ring
    }
    
    var body: some View {
        VStack {
            Text("MainTriangle")
            Text("Back").onTapGesture {
                navigation.pop(to: .previous)
                    
            }
            .padding(8)
            .border(.red, width: 2)
            
            
            ring.stroke(Color.red, lineWidth: 6.0)
                .frame(width: 200, height: 200)
                .padding(40)
                .animation(self.stopAnimation ? nil : .linear(duration: 1))
            HStack {
                Button(action: {
                    self.stopAnimation = false
                    self.countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                        guard self.animationDuration > 0 else {
                            self.countdownTimer?.invalidate()
                            return
                        }
                        self.fillPoint = self.animationDuration/10
                        self.animationDuration -= 1
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

    path.addArc(center: CGPoint(x: rect.size.width / 3,
                                y: rect.size.height / 3),
                radius: rect.size.width / 3,
                startAngle: .degrees(startArcAngle - 90),
                endAngle: .degrees(endArcAngle - 90),
                clockwise: true)

    return path
  }
}
