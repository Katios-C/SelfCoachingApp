import SwiftUI
import iOSDevPackage

struct WarningView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {VStack {
        HStack {
            Button(action: {
                navigation.pop(to: .previous)
            }, label: {
                Text(back)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(width: UIScreen.main.bounds.width / 4)
                    .background(Color.green)
                    .clipShape(Capsule())
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    .grayscale(2)
            }).padding(4)
            Spacer()
        }
        Spacer()
    }
        Text(warningViewText)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10).strokeBorder(Color.green, lineWidth: 2).grayscale(2))
    }
}
