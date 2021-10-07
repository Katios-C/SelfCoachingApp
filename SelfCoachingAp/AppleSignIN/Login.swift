import SwiftUI
import AuthenticationServices
import Resolver

struct Login: View {

  
    @Injected var dependency: LoginViewModel
    
    var body: some View {
        
      
        
        ZStack {
            Image("me_color")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .overlay(Color.black.opacity(0.5))
                .ignoresSafeArea()
            
            VStack(spacing: 25){
                Text("Начало")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    .padding()
                
                Spacer()
                VStack(alignment: .leading, spacing: 20, content: {
                    
                    Text("Цитата из Пелевина")
                        .font(.system(size: 25))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .offset(y: -100)
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)

//                    Text("Техники понимания себя, эффект маленьких шагов, концентрации и самокоучинга")
//                        .foregroundColor(.white)
                    
                })
                .padding(.horizontal, 30)
            
                SignInWithAppleButton(
                    onRequest: { request in
                    
                        dependency.onRequest(request: request)
                        //loginData.onRequest(request: request)
                    },
                    onCompletion: { result in
                       // loginData.onCompletion(result: result)
                        dependency.onCompletion(result: result)
                    }
                )
                .signInWithAppleButtonStyle(.white)
                .frame(height: 55)
                .shadow(color: .gray, radius: 4, x: 0, y: 4)
                .clipShape(Capsule())
                .padding(.horizontal, 40)
                .offset(y: -70)
            }
        }
    }
}

