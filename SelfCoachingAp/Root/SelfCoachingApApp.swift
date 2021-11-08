
import SwiftUI
import iOSDevPackage


@main
struct SelfCoachingApApp: App {
  //  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    var body: some Scene {
        WindowGroup {
            
            NavigationControllerView(transition: .custom(.opacity, .opacity)) {
                ContentView()
            }
        }
    }
}

