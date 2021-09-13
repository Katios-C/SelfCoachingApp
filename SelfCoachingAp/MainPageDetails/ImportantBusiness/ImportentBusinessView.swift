
import SwiftUI
import iOSDevPackage

struct ImportentBusinessView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    
    var body: some View {
        VStack {
        Text("ImportentBusinessView")
        Button(action: {navigation.pop(to: .previous)}, label: {Text("Back")})
        }
    }
}

struct ImportentBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        ImportentBusinessView()
    }
}
