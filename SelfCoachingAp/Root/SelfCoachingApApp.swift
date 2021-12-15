import SwiftUI
import iOSDevPackage

@main
struct SelfCoachingApApp: App {
   
    init() {
        ServiceLocator.shared.addDependancy(object: FourCirclesViewModel())
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationControllerView(transition: .custom(.opacity, .opacity)) {
                StartPageView()
            
            }
        }
    }
}

