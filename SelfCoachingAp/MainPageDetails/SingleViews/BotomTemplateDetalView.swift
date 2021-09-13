
import SwiftUI
import  iOSDevPackage

struct BotomTemplateDetalView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    var text: String
    
    var body: some View {
        VStack {
            Divider()
            ZStack {
                
                Color.gray
                    .clipShape(Capsule())
                   // .opacity(0.9)
                    .frame(width: UIScreen.main.bounds.width / 1.8, height: 40, alignment: .center)
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    
            Text(text) //
               // .clipShape(Capsule())
                .foregroundColor(.white)
                .fontWeight(.thin)
               
        
            }
        }
        .padding()
        }
    }



