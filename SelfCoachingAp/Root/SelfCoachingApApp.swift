import SwiftUI
import iOSDevPackage

@main
struct SelfCoachingApApp: App {
    
   // @StateObject var timeManager = TimerManager()
    init() {
        ServiceLocator.shared.addDependancy(object: FourCirclesViewModel())
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationControllerView(transition: .custom(.opacity, .opacity)) {
                MainTriangle()
                   
                    //.environmentObject(timeManager)
            }
        }
    }
}

