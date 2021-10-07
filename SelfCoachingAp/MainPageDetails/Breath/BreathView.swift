

import SwiftUI
import iOSDevPackage
import Combine

struct BreathView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
   
    @EnvironmentObject var breathViewModelShared: BreathViewModel
    
   @State var breathCaruselViewShared = BreathCaruselView()
    @State var val = ""
  
    var body: some View {
        VStack {
            TopTemplateForDetalView()
               
            

          BreathCaruselView()
            
            
            if breathViewModelShared.playingSubj == "" {
                BreathStartPageView() }
            else if breathViewModelShared.playingSubj == "Концентрация" {
                ConcentrateBreathView()
            }
            else  if breathViewModelShared.playingSubj == "Спокойствие"{
                StillBreathView()
            }
            else {
                EnergyBreathView()
            }
        
            
            Spacer()
            
            if breathViewModelShared.playingSubj == "" {
               
                    Divider()
               Text("Text")
                .foregroundColor(Color.white)
               
                 }
            else {
                BotomTemplateDetalView(text: "Начать упражнение")
                    .onTapGesture {
                       
                        switch breathViewModelShared.playingSubj {
                        case "Спокойствие" : navigation.push(StillExView())
                        case "Концентрация": navigation.push(ConcentrateEx())
                            
                        default:
                            navigation.push(BreathStartPageView())
                        }
                        
                        }
                    
                    }
            }
            
            
            
       
            }
}
    


