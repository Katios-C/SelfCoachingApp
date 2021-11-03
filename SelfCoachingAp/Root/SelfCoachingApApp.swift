
import SwiftUI
import iOSDevPackage
import Firebase
import CoreData

@main
struct SelfCoachingApApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate


    init() {
      //  ServiceProvider.shared.addDependency(dependency: LoginViewModel())
//        DependencyInjector.register(dependency: LoginViewModel())
    }
    
   
    var body: some Scene {
        WindowGroup {
            
            NavigationControllerView(transition: .custom(.opacity, .opacity)) {
             
                ContentView()
               
            }
            

        
            }

    }
}

