
import SwiftUI
import iOSDevPackage

struct ConcentrateEx: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    var body: some View {
        VStack {
       // TAnimation()
            TriangleTimer()
            Spacer()
        Text("ConcentrateEx")
        Button(action: {navigation.pop(to: .previous)}, label: {Text("Back")})
        }.padding()
        }
    }



