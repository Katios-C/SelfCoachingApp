
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
                
                TikTak(stateObject: stateObject)
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
            HStack(alignment:.center, spacing: 20) {
                
                VStack {
                    Text("Вдох")
                        .opacity(stateObject.inhale == 0 ? 0.1 : 0.7)
                        .font(.footnote)
                    ZStack {
                        Circle()
                            .fill( stateObject.inhale == 0 ? Color.gray.opacity(0.2) : Color.yellow)
                            .grayscale(2)
                            .frame(width: 60, height: 60)
                        
                        Text("\(stateObject.inhale)")
                            .onReceive(timer) { time in
                                
                                
                                print("\(stateObject.totaltime)")
                                if stateObject.inhale  > 0   {
                                    stateObject.inhale -= 1
                                }
                                
                                //&& stateObject.totaltime > 0 && stateObject.inhale < stateObject.totaltime
                                else if stateObject.inhale == 0 && stateObject.totaltime > 0
                                {
                                    
                                    stateObject.inhaleEnds = true
                                    
                                }
                            }
                    }
                    
                }
                
                // here
                
                VStack {
                    
                    Text("Задержка")
                        .opacity(stateObject.hold1 == 0 ? 0.1 : 0.7)
                        .font(.footnote)
                    ZStack {
                        Circle()
                            .fill(stateObject.hold1 == 0 || !stateObject.inhaleEnds ? Color.gray.opacity(0.2) : Color.yellow)
                            .grayscale(2)
                            .frame(width: 60, height: 60)
                        
                        Text("\(stateObject.hold1)")
                            .onReceive(timer) { timer in
                                
                                if stateObject.hold1 > 0 && stateObject.inhaleEnds   {
                                    stateObject.hold1 -= 1
                                }
                                
                                // && stateObject.totaltime > 0 && stateObject.hold1 < stateObject.totaltime
                                
                                else if stateObject.hold1 == 0 && stateObject.totaltime > 1 {
                                    stateObject.hold1Ends = true
                                }
                            }
                    }
                }
                //
                //            // here
                //
                VStack {
                    Text("Выдох")
                        .opacity(stateObject.exhale == 0 ? 0.1 : 0.7)
                        .font(.footnote)
                    
                    ZStack {
                        Circle()
                        
                        
                            .fill(stateObject.exhale == 0 || !stateObject.hold1Ends ? Color.gray.opacity(0.2) : Color.yellow)
                            .grayscale(2)
                            .frame(width: 60, height: 60)
                        Text("\(stateObject.exhale)")
                            .onReceive(timer) { time in
                                
                                if stateObject.exhale > 0 && stateObject.hold1Ends  {
                                    stateObject.exhale -= 1
                                }
                                //  && stateObject.totaltime > 0 && stateObject.exhale < stateObject.totaltime
                                if stateObject.exhale == 0 && stateObject.totaltime > 0 {
                                    stateObject.exhaleEnds = true
                                }
                            }
                    }
                }
                
                
                //here
                
                VStack {
                    Text("Задержка")
                        .opacity(stateObject.hold2 == 0 ? 0.1 : 0.7)
                        .font(.footnote)
                    ZStack {
                        Circle()
                            .fill(stateObject.hold2 == 0 || !stateObject.exhaleEnds ? Color.gray.opacity(0.2) : Color.yellow)
                            .grayscale(2)
                            .frame(width: 60, height: 60)
                        
                        
                        Text("\(stateObject.hold2)")
                            .onReceive(timer) { time in
                                
                                if stateObject.hold2 > 0 && stateObject.exhale == 0  {
                                    stateObject.hold2 -= 1
                                }
                                // && stateObject.hold2 < stateObject.totaltime
                                else if stateObject.hold2 == 0 && stateObject.totaltime > 0 {
                                    
                                    
                                    stateObject.inhaleEnds = false
                                    stateObject.hold1Ends = false
                                    stateObject.exhaleEnds = false
                                    
                                    
                                    stateObject.inhale = UserDefaults.standard.integer(forKey: "inhale")
                                    
                                    stateObject.hold1 = UserDefaults.standard.integer(forKey: "hold1")
                                    stateObject.exhale = UserDefaults.standard.integer(forKey: "exhale")
                                    stateObject.hold2 = UserDefaults.standard.integer(forKey: "hold2")
                                    
                                }
                            }
                    }
                }
                
            }
            Spacer()
            
            
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


let timer = Timer
    .publish(every: 1, on: .main,  in: .common)
    .autoconnect()
