import SwiftUI
import iOSDevPackage
import AudioToolbox
import CoreHaptics



struct FourCircleView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    @StateObject var stateObject: FourCirclesViewModel
    
    @State var totalTime = 0
    @State var inhaleends = false
    @State var hold1ends = false
    @State var exhaleends = false
    @State var hold2ends = false
    
    var body: some View {
        
        ZStack {
            
            Image("fon_color")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.7)
                .ignoresSafeArea()
        
        VStack {
            HStack {
                Button(action: {
                    navigation.pop(to: .previous)
                }, label: {
                    Text(back)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(width: UIScreen.main.bounds.width / 4)
                        .background(Color.green)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        .grayscale(2)
                })
                    .padding(.horizontal, 30)
                    .offset(x: -100, y: 0)
                   
              //  Spacer()
                
                HStack {
                MetronomView(stateObject: stateObject)
                   // .padding(.horizontal, 30)
                    .offset(x: 65, y: 0)
                
                ZStack {

                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.yellow)
                        .grayscale(2)
                        .frame(width: 35, height: 35)
                    Image(systemName: "info.circle")
                        .font(.title2)
                        .foregroundColor(.white)
                        .onTapGesture {
                            navigation.push(PersonDetalsView())
                        }
                }
                //.padding(.horizontal, 30)
                .offset(x: 70, y: 0)
            }
            }
           
           // .padding()
           // .border(.red)
            
            Spacer()
            
            VStack {
            Image("man2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.6)
                .frame(width: 400, height: 400)
               // .edgesIgnoringSafeArea(.bottom)
//.padding(15)
            }

            
            HStack(alignment:.center, spacing: 20) {
                VStack {
                    Text(inhaleText)
                        .opacity(1.0)
                        .font(.footnote)
                    ZStack {
                        Circle()
                            .fill(stateObject.inhale == 0 ? Color.gray.opacity(0.2) : Color.yellow)
                            .grayscale(2)
                            .frame(width: 60, height: 60)
                        
                        Text("\(stateObject.inhale)")
                    }
                }
                
                VStack {
                    Text(holdText)
                        .opacity(1.0)
                        .font(.footnote)
                    ZStack {
                        Circle()
                            .fill(stateObject.hold1 == 0 || !stateObject.inhaleEnds ? Color.gray.opacity(0.2) : Color.yellow)
                            .grayscale(2)
                            .frame(width: 60, height: 60)
                        
                        Text("\(stateObject.hold1)")
                    }
                }
                
                VStack {
                    Text(exhaleText)
                        .opacity(1.0)
                        .font(.footnote)
                    ZStack {
                        Circle()
                            .fill(stateObject.exhale == 0 || !stateObject.hold1Ends ? Color.gray.opacity(0.2) : Color.yellow)
                            .grayscale(2)
                            .frame(width: 60, height: 60)
                        
                        Text("\(stateObject.exhale)")
                        
                    }
                }
                
                VStack {
                    Text(holdText)
                        .opacity(1.0)
                        .font(.footnote)
                    ZStack {
                        Circle()
                            .fill(stateObject.hold2 == 0 || !stateObject.exhaleEnds ? Color.gray.opacity(0.2) : Color.yellow)
                            .grayscale(2)
                            .frame(width: 60, height: 60)
                        
                        Text("\(stateObject.hold2 )")
                    }
                }
            }
            Spacer()
            VStack {
                
                Text("\(stateObject.timeString())")
                
                HStack {
                    Text(repeatText)
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
                    stateObject.restartTime()
                    
                    inhaleends = false
                    hold1ends = false
                    exhaleends = false
                    hold2ends = false
                    
                    //   let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                    //    impactMed.impactOccurred()
                    AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {   }
                }
            }
        }
        
        .onAppear{
            stateObject.start()
            stateObject.incrementIntInhale()
        }
        .onDisappear{
            stateObject.finish()
        }
    }
}

}
