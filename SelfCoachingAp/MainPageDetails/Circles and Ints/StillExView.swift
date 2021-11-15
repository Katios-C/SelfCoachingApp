
import SwiftUI
import iOSDevPackage

struct StillExView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    @StateObject var stateObject:  FourCirclesViewModel
    
    
    var body: some View {
        ZStack {
            Image("m2")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                Text("StillExView")
                Text("Back").onTapGesture {
                    navigation.pop(to: .previous)
                    
                }
                .padding(8)
                .border(.red, width: 2)
                Spacer()
                
                TimerViewForCircle(stateObject: stateObject)
            }
        }
    }
}
