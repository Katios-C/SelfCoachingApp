
import SwiftUI
import iOSDevPackage
import Firebase
import CoreData

@main
struct SelfCoachingApApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("log_status") var log_Status = false
    
    private let manager = DependencyManager()
 //   @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
  
    

    init() {
      //  ServiceProvider.shared.addDependency(dependency: LoginViewModel())
//        DependencyInjector.register(dependency: LoginViewModel())
    }
    
   
    var body: some Scene {
        WindowGroup {
            
          
            
            NavigationControllerView(transition: .custom(.opacity, .opacity)) {
             
                ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            

        
            }

    }
}

