
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
//                    .fontWeight(.semibold)
//                    .foregroundColor(.white)
//                    .padding(.vertical, 12)
//                    .frame(width: UIScreen.main.bounds.width / 4)
//                    .background(Color.green)
//                    .clipShape(Capsule())
//                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
//                    .grayscale(2)
            }).padding()
               // .navigationTitle("Home")
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

