
import SwiftUI
import iOSDevPackage

struct ConcentrateEx: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    @StateObject var timerStateObject =  TimerViewModel()
    
    var body: some View {
        VStack {
       // TAnimation()
            TriangleTimer(stateObject: timerStateObject)
            Spacer()
        Text("ConcentrateEx")
        Button(action: {navigation.pop(to: .previous)}, label: {Text("Back")})
        }.padding()
        }
    }



