import SwiftUI
import iOSDevPackage


struct AboutMeView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    navigation.pop(to: .previous)
                }, label: {
                    Text(back)
                        .padding(.vertical, 12)
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width / 4)
                        .background(
                            RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 2))
                }).padding()
                Spacer()
            }
            
            Spacer()
            Text(aboutMeText)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 2))
            
            Spacer()
        }
    }
}

