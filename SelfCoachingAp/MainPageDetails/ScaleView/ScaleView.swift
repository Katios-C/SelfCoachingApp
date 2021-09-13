
import SwiftUI
import iOSDevPackage

struct ScaleView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    
    var body: some View {
        VStack {
        Text("ScaleView")
        Button(action: {navigation.pop(to: .previous)}, label: {Text("Back")})
        }
    }
}
