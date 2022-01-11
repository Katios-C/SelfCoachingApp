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
            
            Image(fon_6)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                HStack {
                    Button(action: {
                        navigation.pop(to: .previous)
                    }, label: {
                        Image(back)
                            .font(.title2)
                        
                    })
                        .padding()
                    Spacer()
                    
                    
                    MetronomView(stateObject: stateObject)
                    Image(infoImage)
                        .font(.title2)
                        .foregroundColor(.white)
                        .onTapGesture {
                            navigation.push(PersonDetalsView())
                        }
                        .padding()
                }.padding(.top, 20)
                
                Spacer()
                ZStack {
                    
                    Image(ellipseImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text("\(stateObject.timeString())")
                        .padding(20)
                }
                .frame(width: UIScreen.main.bounds.width / 3)
                .offset(x: 0, y: UIScreen.main.bounds.height * stateObject.adjust2screen(screen: UIScreen.main.bounds.height) )
                
                VStack {
                    HStack(alignment:.center, spacing: 20) {
                        VStack {
                            Text(inhaleText)
                                .opacity(1.0)
                                .font(.footnote)
                            ZStack {
                                Image(stateObject.inhale == 0 ? circleImage_1 : circleImage_2)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                                Text("\(stateObject.inhale)")
                            }
                        }
                        
                        VStack {
                            Text(holdText)
                                .opacity(1.0)
                                .font(.footnote)
                            ZStack {
                                Image(stateObject.hold1 == 0 || !stateObject.inhaleEnds ? circleImage_1 : circleImage_2)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                                Text("\(stateObject.hold1)")
                            }
                        }
                        
                        VStack {
                            Text(exhaleText)
                                .opacity(1.0)
                                .font(.footnote)
                            ZStack {
                                Image(stateObject.exhale == 0 || !stateObject.hold1Ends ?  circleImage_1 : circleImage_2)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                                Text("\(stateObject.exhale)")
                            }
                        }
                        
                        VStack {
                            Text(holdText)
                                .opacity(1.0)
                                .font(.footnote)
                            ZStack {
                                Image(stateObject.hold2 == 0 || !stateObject.exhaleEnds ? circleImage_1 : circleImage_2)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                                Text("\(stateObject.hold2 )")
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.1)
                    VStack {
                        ZStack {
                            Image(button)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .opacity(stateObject.totaltime > 0 ? 0 : 1)
                                .animation(.easeInOut(duration: 3))
                                .overlay(
                                    Image(repeatedImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: UIScreen.main.bounds.width / 2.7)
                                        .opacity(stateObject.totaltime > 0 ? 0 : 1)
                                )
                        }
                        .frame(width: UIScreen.main.bounds.width / 1.5)
                        .onTapGesture {
                            stateObject.restartTime()
                            inhaleends = false
                            hold1ends = false
                            exhaleends = false
                            hold2ends = false
                            
                            let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                            impactMed.impactOccurred()
                        }
                    }
                    .padding(.bottom, 30)
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
