import SwiftUI


struct FlowerView: View {
    @Binding var isMinimized: Bool
    @Binding var numberOfPetals: Double

    /// The duration of any animation performed to the flower.
    @Binding var animationDuration: Double
    
    /// The diameter of each petal.
    let circleDiameter: CGFloat = 80
    
    /// The color of each petal. It is recommended to also use opacity to create an overlap effect.
    var color = Color(UIColor.cyan).opacity(0.6)
    
    /// This represents the absolute amount of rotation needed for each petal
    private var absolutePetalAngle: Double {
        return 360 / numberOfPetals
    }
      
    var body: some View {
        ZStack() {
              ForEach(0..<Int(numberOfPetals), id: \.self) {
                  Circle()
                      .frame(width: self.circleDiameter, height: self.circleDiameter)
                      .foregroundColor(self.color)
                 
                      // The color of the petal. It is recommended to also use opacity to create an overlap effect.
                      .foregroundColor(Color(UIColor.cyan).opacity(0.6))

                      // Rotate the petal around it's leading anchor to create the flower
                      .rotationEffect(.degrees(self.absolutePetalAngle * Double($0)),
                                      anchor: .leading)
              }
          }
          // Center the view along the center of the Flower
          .offset(x: isMinimized ? 0 : circleDiameter / 2)
         
          // create a frame around the flower,
          // helful for adding padding around the whole flower
          .frame(width: circleDiameter * 2, height: circleDiameter * 2)

          // smoothly animate any change to the Flower
          .animation(.easeInOut(duration: animationDuration))

          // This modifiers are optional
          // The purpose of the code bellow is to align the orientation to perfectly match Apple's implementation
          .rotationEffect(.degrees(-60))
          .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
    }
}

struct FlowerView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerView(isMinimized: .constant(false),
                   numberOfPetals: .constant(5),
                   animationDuration: .constant(4.2))
    }
}
