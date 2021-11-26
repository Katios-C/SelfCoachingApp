

import SwiftUI
import iOSDevPackage
import AudioToolbox
import CoreHaptics


struct FourCircleDispatch: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
  //  @EnvironmentObject var timerManager: TimerManager
  //  @StateObject var stateObject =  FourCirclesViewModel()
    @EnvironmentObject  var stateObject: FourCirclesViewModel
    
  //  @State var inhale = 0
 //   @State var hold1 = 0
   // @State var exhale = 0
  //  @State var hold2 = 0
    
    
    @State var totalTime = 0
    
    @State var inhaleends = false
    @State var hold1ends = false
    @State var exhaleends = false
    @State var hold2ends = false
    
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
                   // .navigationTitle("Home")
                Spacer()
                
                MetronomView(stateObject: stateObject)
                
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.green)
                        .opacity(0.5)
                Image(systemName: "ellipsis")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .rotationEffect(.degrees(90))
                    .onTapGesture {
                        navigation.push(PersonDetalsView())
                    }
                
                }
            }
            .padding()
            
            Spacer()
            
            
        HStack(alignment:.center, spacing: 20) {
            VStack {
                Text("Вдох")
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
                Text("Задержка")
                    .opacity(1.0)
                    .font(.footnote)
                ZStack {
                    Circle()
                        .fill(stateObject.hold1 == 0 || !inhaleends ? Color.gray.opacity(0.2) : Color.yellow)
                        .grayscale(2)
                        .frame(width: 60, height: 60)

                    Text("\(stateObject.hold1)")

                }

            }
            
            VStack {
                Text("Выдох")
                    .opacity(1.0)
                    .font(.footnote)
                ZStack {
                    Circle()
                        .fill(stateObject.exhale == 0 || !hold1ends ? Color.gray.opacity(0.2) : Color.yellow)
                        .grayscale(2)
                        .frame(width: 60, height: 60)

                    Text("\(stateObject.exhale)")

                }

            }

            VStack {
                Text("Задержка")
                    .opacity(1.0)
                    .font(.footnote)
                ZStack {
                    Circle()
                        .fill(stateObject.hold2 == 0 || !exhaleends ? Color.gray.opacity(0.2) : Color.yellow)
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
                .opacity(totalTime > 0 ? 0 : 1)
                .animation(.easeInOut(duration: 3))
                .onTapGesture {
//                    stateObject.inhale = UserDefaults.standard.integer(forKey: "inhale")
//                   stateObject.hold1 = UserDefaults.standard.integer(forKey: "hold1")
//                    stateObject.exhale = UserDefaults.standard.integer(forKey: "exhale")
//                    stateObject.hold2 = UserDefaults.standard.integer(forKey: "hold2")
                    stateObject.restartTime()
                    totalTime = stateObject.totaltime
                    
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
           // inhale = stateObject.inhale
         //   hold1 = stateObject.hold1
          //  exhale = stateObject.exhale
           // hold2 = stateObject.hold2
            totalTime = stateObject.totaltime
            
            stateObject.start()
           
                stateObject.incrementIntInhale()
          //  incrementIntInhale()
           
        }
        .onDisappear{
            stateObject.finish()
        }
        
    }
    
    func incrementIntInhale() {
        
        stateObject.sourceTimer?.setEventHandler {


            if stateObject.inhale > 0 && totalTime > 0 {
                stateObject.inhale -= 1
            }
            else {
                inhaleends = true
            }


            if stateObject.hold1  > 0 && inhaleends && totalTime > 0 {
                stateObject.hold1 -= 1
            }
            else {
                if inhaleends {
                hold1ends = true
                }

            }

            if stateObject.exhale  > 0 && hold1ends && totalTime > 0 {
                stateObject.exhale -= 1
            }
            else {
                if hold1ends {
                    exhaleends = true
                }
            }

            if stateObject.hold2 > 0 && exhaleends && totalTime > 0{
                stateObject.hold2 -= 1
            }


            if stateObject.hold2 == 0 && exhaleends && totalTime > 0 {
                stateObject.inhale = UserDefaults.standard.integer(forKey: "inhale")
                stateObject.hold1 = UserDefaults.standard.integer(forKey: "hold1")
                stateObject.exhale = UserDefaults.standard.integer(forKey: "exhale")
                stateObject.hold2 = UserDefaults.standard.integer(forKey: "hold2")

                inhaleends = false
                hold1ends = false
                exhaleends = false
                hold2ends = false
            }


            if totalTime > 0 {
                totalTime -= 1
            } else {
                stateObject.inhale = 0
                stateObject.hold1 = 0
                stateObject.exhale = 0
                stateObject.hold2 = 0
            }
        }

        stateObject.sourceTimer?.schedule(deadline: .now(),
                                   repeating: 1)
    }



    
    
}

