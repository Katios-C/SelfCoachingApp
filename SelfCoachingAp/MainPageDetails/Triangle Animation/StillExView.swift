
import SwiftUI
import iOSDevPackage

struct StillExView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    @StateObject var stateObject:  fourCirclesViewModel
    
    
    let persistenceController = PersistenceController.shared
    @State var counter: Int = 0
      var countTo: Int = 300
    @State var isPlay = false
    
    
    @State var isStarted = false
    
    var body: some View {
        ZStack {
            Image("m2")
                .resizable()
                .aspectRatio( contentMode: .fill)
                
              //  .cornerRadius(8)
               // .ignoresSafeArea()
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
                
        VStack {
            Text("StillExView")
            Text("Back").onTapGesture {
                navigation.pop(to: .previous)
                    
            }
            .padding(8)
            .border(.red, width: 2)
          //  TopTemplateForDetalView()
            Spacer()
      
            
//            StillBRCircle()
//            .padding()

            
//            if isStarted {
//                TimerView().onAppear() {
//                    isPlay = true
//                }
//
//            } else {
//                StartButtonBreath(isStarted: $isStarted)
//            }
   
            TriangleTimer()
                
            Spacer()
            TimerViewForCircle(stateObject: stateObject)
        }
        
       
     
    }
       // .ignoresSafeArea()
        
      //  .padding()

}
}
