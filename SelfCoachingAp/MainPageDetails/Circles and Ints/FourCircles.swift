
import SwiftUI
import iOSDevPackage

struct FourCircles: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    @StateObject var stateObject:  FourCirclesViewModel
    
    
    
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
            // .border(Color.green)
          //  Divider()
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
                            .onReceive(stateObject.timer) { time in
                                stateObject.descendTime(time: &stateObject.inhale)
                         
                                stateObject.isEnd(breathTime: stateObject.inhale, endTime: &stateObject.inhaleEnds)
                            }
                    }
                    
                }
                
                
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
                            .onReceive(stateObject.timer) { timer in
                                
                                stateObject.descendTime(time: &stateObject.hold1, previosEnd: stateObject.inhaleEnds)
                                
                                stateObject.isEnd(breathTime: stateObject.hold1, endTime: &stateObject.hold1Ends)
                            }
                    }
                }
               
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
                            .onReceive(stateObject.timer) { time in
                                stateObject.descendTime(time: &stateObject.exhale, previosEnd: stateObject.hold1Ends)
                                
                                
                                stateObject.isEnd(breathTime: stateObject.exhale, endTime: &stateObject.exhaleEnds)
                              
                            }
                    }
                }
                
                
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
                            .onReceive(stateObject.timer) { time in
                              
                                stateObject.descendTime(time: &stateObject.hold2, previosEnd: stateObject.exhaleEnds)
                                
                                stateObject.fetchData()
    
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
                        stateObject.restartPeriods()
                    }
                }
            }
        }
    }
    
}


