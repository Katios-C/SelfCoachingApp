import SwiftUI
import iOSDevPackage
import CryptoKit
import FirebaseAuth
import AuthenticationServices

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObject
    @AppStorage("log_status") var log_Status = false
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    
    var body: some View {
       
        if log_Status{
            ListView()
                .environmentObject(UIStateModel())
        } else {
            Login()
        }
    }
    
    
}

