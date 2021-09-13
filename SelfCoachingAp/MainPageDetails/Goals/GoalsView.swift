
import SwiftUI
import iOSDevPackage

struct GoalsView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    
    var body: some View {
        VStack {
        Text("GoalsView")
        Button(action: {navigation.pop(to: .previous)}, label: {Text("Back")})
        }
    }
}
