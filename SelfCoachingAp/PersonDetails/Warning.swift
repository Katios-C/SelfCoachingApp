
import SwiftUI
import iOSDevPackage

struct Warning: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {VStack {
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
            }).padding(4)
               // .navigationTitle("Home")
            Spacer()
            
           
            
            
        }
        Spacer()
    }
Text("Пожалуйста, будьте внимательны к своему самочувствию! При малейшем дискомфорте остановите тренировку, проконсультируйтесь с лечащим врачом.")
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10).strokeBorder(Color.green, lineWidth: 2).grayscale(2))
    }
}
