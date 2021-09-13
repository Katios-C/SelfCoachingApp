
import SwiftUI
import iOSDevPackage

struct SleepView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    
    var body: some View {
        VStack {
        Text("SleepView")
        Button(action: {navigation.pop(to: .previous)}, label: {Text("Back")})
        }
    }
}
