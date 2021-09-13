import SwiftUI
struct TimerButton: View {
    
    let label: String
    let buttonColor: Color
    
    var body: some View {
        Text(label)
            .foregroundColor(.white)
            .padding(10)
            //.padding(.horizontal, 90)
            .background(buttonColor)
            .cornerRadius(10)
    }
}
