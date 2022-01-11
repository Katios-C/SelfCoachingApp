import SwiftUI
import iOSDevPackage

struct AboutMeView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        ZStack {
            Image(fon_2)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            VStack {
                HStack {
                    Button(action: {
                        navigation.pop(to: .previous)
                    }, label: {
                        Image(back)
                            .font(.title2)
                    })
                        .padding()
                    Spacer()
                }
                .padding(.top, 20)
                Spacer()
            }
            VStack{
                Spacer()
                
                Text("Об авторе")
                    .font(Font.custom(MazzardMFont, size: 30))
                    .foregroundColor(.white)
                    .lineSpacing(5)
                    .padding()
                
                
                Text(aboutMeText)
                    .font(Font.custom(MazzardMFont, size: 20))
                    .foregroundColor(Color(UIColor(red: 90 / 255, green: 68 / 255, blue: 130 / 255, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .lineSpacing(5)
                    .padding(20)
                Spacer()
            }
        }
    }
}
