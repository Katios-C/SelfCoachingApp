


import SwiftUI
import AuthenticationServices
import CryptoKit
import FirebaseAuth

struct Login: View {
    @StateObject var loginData = LoginViewModel()
    @AppStorage("log_status") var log_Status = false
    
    var body: some View {
        ZStack {
            
            Image("me")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .overlay(Color.black.opacity(0.35))
                .ignoresSafeArea()
            
            VStack(spacing: 25){
//                Text("Классное название")
//                    .font(.largeTitle)
//                    .fontWeight(.heavy)
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity, alignment: .leading)
////                    .background(Color.gray)
////                    .cornerRadius(10)
//                    
//                    .padding()
                
                Spacer()
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("Ты - главный эксперт в своей жизни.")
                        .font(.system(size: 25))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .offset(y: -100)
                    
//                    Text("Техники понимания себя, эффект маленьких шагов, концентрации и самокоучинга")
//                        .foregroundColor(.white)
                
                })
                .padding(.horizontal, 30)
                
            //    Spacer()
                //LoginButton
                
                SignInWithAppleButton(
                    onRequest: { request in
                        let nonce = randomNonceString()
                        loginData.currentNonce = nonce
                        request.requestedScopes = [.fullName, .email]
                        request.nonce = sha256(nonce)
                    },
                    onCompletion: { result in
                        switch result {
                        case .success(let authResults):
                            switch authResults.credential {
                            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                
                                guard let nonce = loginData.currentNonce else {
                                    fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                }
                                guard let appleIDToken = appleIDCredential.identityToken else {
                                    fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                }
                                guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                                    print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                                    return
                                }
                                
                                let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                                Auth.auth().signIn(with: credential) { (authResult, error) in
                                    if (error != nil) {
                                        // Error. If error.code == .MissingOrInvalidNonce, make sure
                                        // you're sending the SHA256-hashed nonce as a hex string with
                                        // your request to Apple.
                                        print(error?.localizedDescription as Any)
                                        return
                                    }
                                    
                                    print("signed in")
                                    withAnimation(.easeInOut){
                                        log_Status = true
                                    }
                                }
                                
                                print("\(String(describing: Auth.auth().currentUser?.uid))")
                            default:
                                break
                                
                            }
                        default:
                            break
                        }
                    }
                )
                .signInWithAppleButtonStyle(.white)
                .frame(height: 55)
                .clipShape(Capsule())
                .padding(.horizontal, 40)
                .offset(y: -70)
                
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
