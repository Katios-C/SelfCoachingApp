
import SwiftUI
import iOSDevPackage

struct StillExView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    let persistenceController = PersistenceController.shared
    @State var counter: Int = 0
      var countTo: Int = 300
    @State var isPlay = false
    
    
    @State var isStarted = false
    
    var body: some View {
        VStack {
            TopTemplateForDetalView()
            Spacer()
      
            
//            StillBRCircle()
//            .padding()

            
            if isStarted {
                TimerView().onAppear() {
                    isPlay = true
                }

            } else {
                StartButtonBreath(isStarted: $isStarted)
            }
     //  MainView()
            
        }
        .padding()
    }

}

