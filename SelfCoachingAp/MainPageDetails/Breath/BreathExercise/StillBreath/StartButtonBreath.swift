
import SwiftUI
import  iOSDevPackage


struct StartButtonBreath: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    let persistenceController = PersistenceController.shared
    @Binding var isStarted: Bool
    
    
    var body: some View {
        VStack {
            
            Button(action:
                    
                    {
                isStarted = !isStarted
            }
//                {navigation.push(TimerView().environment(\.managedObjectContext, persistenceController.container.viewContext))}
        
        ) {
            TimerButton(label: " Старт", buttonColor: .green)
        }
        }
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonBreath(isStarted: .constant(false))
    }
}
