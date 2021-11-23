
import SwiftUI
import iOSDevPackage


@main
struct SelfCoachingApApp: App {
   // let timerView = TimerManager()
    init() {
        ServiceLocator.shared.addDependancy(object: FourCirclesViewModel())
        ServiceLocator.shared.addDependancy(object: TestClass())
    }
    
    var body: some Scene {
        WindowGroup {
            
            NavigationControllerView(transition: .custom(.opacity, .opacity)) {
               // ContentView()
                MainTriangle()
                   // .environmentObject(timerView)
            }
        }
    }
}

