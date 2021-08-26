//  Created by Екатерина Чернова on 23.08.2021.


import SwiftUI
import iOSDevPackage
import CryptoKit
import FirebaseAuth
import AuthenticationServices

struct ContentView: View {
    
  
    @AppStorage("log_status") var log_Status = false

    
    var body: some View {
        
        ZStack{
            if log_Status{
                ListView()
                    .environmentObject(UIStateModel())
            } else {
                Login()
            }
        }
        //        NavigationControllerView(transition: .custom(.slide, .slide)) {
        //            ListView()
        //        }
//        SignInWithAppleButton(
//            onRequest: { request in
//                let nonce = randomNonceString()
//                currentNonce = nonce
//                request.requestedScopes = [.fullName, .email]
//                request.nonce = sha256(nonce)
//            },
//            onCompletion: { result in
//                switch result {
//                case .success(let authResults):
//                    switch authResults.credential {
//                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
//                        
//                        guard let nonce = currentNonce else {
//                            fatalError("Invalid state: A login callback was received, but no login request was sent.")
//                        }
//                        guard let appleIDToken = appleIDCredential.identityToken else {
//                            fatalError("Invalid state: A login callback was received, but no login request was sent.")
//                        }
//                        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
//                            print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
//                            return
//                        }
//                        
//                        let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
//                        Auth.auth().signIn(with: credential) { (authResult, error) in
//                            if (error != nil) {
//                                // Error. If error.code == .MissingOrInvalidNonce, make sure
//                                // you're sending the SHA256-hashed nonce as a hex string with
//                                // your request to Apple.
//                                print(error?.localizedDescription as Any)
//                                return
//                            }
//                            
//                            print("signed in")
//                        }
//                        
//                        print("\(String(describing: Auth.auth().currentUser?.uid))")
//                    default:
//                        break
//                        
//                    }
//                default:
//                    break
//                }
//            }
//        )
//        .frame(width: 280, height: 45, alignment: .center)
        
    }
}

