
import SwiftUI
import iOSDevPackage

struct FourCircles: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    @StateObject var stateObject:  fourCirclesViewModel
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    navigation.pop(to: .previous)
                }, label: {
                    Text("Back")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(width: UIScreen.main.bounds.width / 4)
                        .background(Color.green)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        .grayscale(2)
                })
                .navigationTitle("Home")
                Spacer()
                
                Image (systemName: "speaker.slash")
                Image (systemName: "speaker.slash.fill")
                Image(systemName: "ellipsis")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .rotationEffect(.degrees(90))
                    .onTapGesture {
                        navigation.push(PersonDetalsView())
                    }
                
                
            }
            .padding()
            // .border(Color.green)
            Divider()
            Spacer()
        HStack {
            CircleInhale(stateObject: stateObject)
            CircleHold1(stateObject: stateObject)
            CircleExhale(stateObject: stateObject)
            CircleHold2(stateObject: stateObject)
        }
            Spacer()
             TikTak()
            Spacer()
            
//            VStack {
//                 Text(String(describing: stateObject.first))
//                 Text(String(describing: stateObject.second))
//               }
//               .onAppear { stateObject.starT() }
//               .onDisappear { stateObject.stoP() }
            
            
            Button(action: {

            }){

                VStack {
                    TimerViewForCircle(stateObject: stateObject)
                        .padding()
                HStack {
//
                    Text("Повторить")
                        .fontWeight(.semibold)
                     

                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .clipShape(Capsule())
                .padding(.vertical, 12)

                .cornerRadius(8)
                .frame(width: UIScreen.main.bounds.width / 2)
                .grayscale(2)
                .shadow(color: .gray, radius: 4, x: 0, y: 4)
                .opacity(stateObject.totaltime > 0 ? 0 : 1)
                .animation(.easeInOut(duration: 3))
                .onTapGesture {
                    stateObject.totaltime = UserDefaults.standard.integer(forKey: "inputTime") * 60
                    
                    stateObject.inhale = UserDefaults.standard.integer(forKey: "inhale")
                    
                   stateObject.hold1 = UserDefaults.standard.integer(forKey: "hold1")
                stateObject.exhale = UserDefaults.standard.integer(forKey: "exhale")
                   stateObject.hold2 = UserDefaults.standard.integer(forKey: "hold2")
                    
                    stateObject.inhaleEnds = false
                    stateObject.hold1Ends = false
                     stateObject.exhaleEnds = false
                }
                
                
    }
}

}
        
}

}
