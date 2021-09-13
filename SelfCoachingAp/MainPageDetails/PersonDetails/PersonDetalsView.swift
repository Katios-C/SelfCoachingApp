
import SwiftUI
import iOSDevPackage



struct PersonDetalsView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    
    var body: some View {
        VStack {
        Text("More Info")
            Button(action: {navigation.pop(to: .previous)}, label: {Text("Back")})
        }
    }
}

struct PersonDetalsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetalsView()
    }
}

