import SwiftUI
import iOSDevPackage

struct WarningView: View {
    
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
                
                Image(heartIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 14)
                
                Image(warning)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 2.2)
                    .padding(20)
                
                Text(warningViewText)
                    .font(Font.custom(MazzardMFont, size: 20))
                    .foregroundColor(Color(UIColor(red: 90 / 255, green: 68 / 255, blue: 130 / 255, alpha: 1)))
                    .lineSpacing(5)
                    .padding(20)
                Spacer()
            }
        }
    }
}
