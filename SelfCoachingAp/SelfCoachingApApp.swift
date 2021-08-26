
import SwiftUI
import iOSDevPackage
import Firebase

@main
struct SelfCoachingApApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("log_status") var log_Status = false
    
    var body: some Scene {
        WindowGroup {
            
                if log_Status{
                    ListView()
                        .environmentObject(UIStateModel())
                } else {
                    Login()
                }
            
//            ListView()
//                .environmentObject(UIStateModel())
//
//
                
        }
    }
}
// init Firebase

