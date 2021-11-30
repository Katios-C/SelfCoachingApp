import SwiftUI
import iOSDevPackage


struct AboutMe: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    navigation.pop(to: .previous)
                }, label: {
                    Text("BACK")
                        .padding(.vertical, 12)
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width / 4)
                        .background(
                            RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 2))
                }).padding()
                Spacer()
            }
            
            Spacer()
            Text("Привет! Меня зовут Катя, я придумала и сделал это приложение. С огромной помощью моего наставника Коли и участием компании ISSArt")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 2))
            
            Spacer()
        }
    }
}

