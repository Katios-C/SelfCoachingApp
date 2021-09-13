
import SwiftUI
import iOSDevPackage

struct StillExView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    let persistenceController = PersistenceController.shared
    @State var counter: Int = 0
      var countTo: Int = 300
    
    
    var body: some View {
        VStack {
            TopTemplateForDetalView()
            Spacer()
      
            
            StillBRCircle()
            .padding()


            
           TimerView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            .padding()
            
        }
        .padding()
    }

}

