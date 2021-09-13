
import SwiftUI
import iOSDevPackage

struct StatisticView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    
    var body: some View {
        VStack {
        Text("StatisticView")
        Button(action: {navigation.pop(to: .previous)}, label: {Text("Back")})
        }
    }
}
