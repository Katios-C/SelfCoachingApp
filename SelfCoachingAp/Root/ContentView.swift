import SwiftUI
import iOSDevPackage


struct ContentView: View {
   // @Environment(\.managedObjectContext) var managedObject
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    var body: some View {
        MainTriangle()
    }
}

