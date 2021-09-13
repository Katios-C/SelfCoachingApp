
import SwiftUI
import iOSDevPackage

struct QuestionOfDayView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        VStack {
        Text("Breath Page")
        Button(action: {navigation.pop(to: .previous)}, label: {Text("Back")})
        }
    }
}

