

import SwiftUI
import iOSDevPackage

struct FourCircleDispatch: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    @EnvironmentObject var timerManager: TimerManager
    @StateObject var stateObject:  FourCirclesViewModel
    
    
    @State var inhale = 0
    @State var hold1 = 0
    @State var exhale = 0
    @State var hold2 = 0
    
    
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
                    .navigationTitle("Home")
                Spacer()
                
                TikTak(stateObject: stateObject)
                
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
                        .fill(inhale == 0 ? Color.gray.opacity(0.2) : Color.yellow)
                        .grayscale(2)
                        .frame(width: 60, height: 60)
                    
                    Text("\(inhale)")
                       
                }
                
            }

            VStack {
                Text("Задержка")
                    .opacity(1.0)
                    .font(.footnote)
                ZStack {
                    Circle()
                        .fill(hold1 == 0 || !inhaleends ? Color.gray.opacity(0.2) : Color.yellow)
                        .grayscale(2)
                        .frame(width: 60, height: 60)

                    Text("\(hold1)")

                }

            }
            
            VStack {
                Text("Выдох")
                    .opacity(1.0)
                    .font(.footnote)
                ZStack {
                    Circle()
                        .fill(exhale == 0 || !hold1ends ? Color.gray.opacity(0.2) : Color.yellow)
                        .grayscale(2)
                        .frame(width: 60, height: 60)

                    Text("\(exhale)")

                }

            }

            VStack {
                Text("Задержка")
                    .opacity(1.0)
                    .font(.footnote)
                ZStack {
                    Circle()
                        .fill(hold2 == 0 || !exhaleends ? Color.gray.opacity(0.2) : Color.yellow)
                        .grayscale(2)
                        .frame(width: 60, height: 60)

                    Text("\(hold2)")

                }

            }

            
            
          
            
        }
            Spacer()
            
            
            VStack {

                Text("\(stateObject.timeString(time: totalTime))")
                
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
                    inhale = stateObject.inhale
                    hold1 = stateObject.hold1
                    exhale = stateObject.exhale
                    hold2 = stateObject.hold2
                    totalTime = stateObject.totaltime
                    
                    inhaleends = false
                    hold1ends = false
                    exhaleends = false
                    hold2ends = false
                  
                }
            }

            
    }
        
        .onAppear{
            inhale = stateObject.inhale
            hold1 = stateObject.hold1
            exhale = stateObject.exhale
            hold2 = stateObject.hold2
            totalTime = stateObject.totaltime
            
            timerManager.start()
            incrementIntInhale()
           
        }
        .onDisappear{
            timerManager.finish()
        }
        
    }
    
    func incrementIntInhale() {
        timerManager.sourceTimer?.setEventHandler {
           
          
            if inhale > 0 && totalTime > 0 {
                inhale -= 1
            }
            else {
                inhaleends = true
            }
            
         
            if hold1  > 0 && inhaleends && totalTime > 0 {
                hold1 -= 1
            }
            else {
                if inhaleends {
                hold1ends = true
                }
             
            }
            
            if exhale  > 0 && hold1ends && totalTime > 0 {
                exhale -= 1
            }
            else {
                if hold1ends {
                    exhaleends = true
                }
            }
            
            if hold2 > 0 && exhaleends && totalTime > 0{
                hold2 -= 1
            }
  
            
            if hold2 == 0 && exhaleends && totalTime > 0 {
                inhale = stateObject.inhale
                hold1 = stateObject.hold1
                exhale = stateObject.exhale
                hold2 = stateObject.hold2
                
                inhaleends = false
                hold1ends = false
                exhaleends = false
                hold2ends = false
            }
            
            
            if totalTime > 0 {
                totalTime -= 1
            } else {
                inhale = 0
                hold1 = 0
                exhale = 0
                hold2 = 0
            }
        }
        
        timerManager.sourceTimer?.schedule(deadline: .now(),
                                   repeating: 1)
    }


}

