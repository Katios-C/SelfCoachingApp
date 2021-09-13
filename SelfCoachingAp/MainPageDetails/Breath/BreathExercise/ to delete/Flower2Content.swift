
import SwiftUI



struct Flower2Content: View {
    @State private var numberOfPetals: Double = 5
    @State private var isMinimized = false
    @State private var animationDuration = 0.5

    /// Duration of the breathing animation
    @State private var breathDuration = 4.2

    var body: some View {
        List {
            // Flower
            Section {
                FlowerView(isMinimized: $isMinimized,
                           numberOfPetals: $numberOfPetals,
                           animationDuration: $animationDuration
                )
                
                // align the flower nicely
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
            }

            // Number of Petals
            Section(header: Text("Number of Petals: \(Int(numberOfPetals))")) {
                Slider(value: $numberOfPetals, in: 2...10) { onEditingChanged in
                    // detect when interaction with the slider is done and engage snapping to the closest petal
                    if !onEditingChanged {
                        self.numberOfPetals = self.numberOfPetals.rounded()
                    }
                }
            }
            
            // Breathing Duration
            Section(header: Text("Breathing Duration: \(breathDuration)")) {
                Slider(value: $breathDuration, in: 0...10, step: 0.1)
            }

            // Breath Button
            Section {
                Button(action: {
                    self.animationDuration = self.breathDuration
                    self.isMinimized.toggle()

                    DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDuration) {
                        self.isMinimized.toggle()
                    }
                }) {
                    Text("Breath")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(BorderlessButtonStyle())
            .foregroundColor(.white)
            .listRowBackground(Color(UIColor.systemBlue))
        }

        // making the list look nice :]
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
    }
}
