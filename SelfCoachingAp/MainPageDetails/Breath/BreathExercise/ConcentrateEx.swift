
import SwiftUI
import iOSDevPackage

struct ConcentrateEx: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    var body: some View {
        VStack {
        Text("ConcentrateEx")
        Button(action: {navigation.pop(to: .previous)}, label: {Text("Back")})
        }
        }
    }



