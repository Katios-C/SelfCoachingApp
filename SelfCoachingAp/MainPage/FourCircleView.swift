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
            
            Image("fon1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        VStack {
            HStack {
                Button(action: {
                    navigation.pop(to: .previous)
                }, label: {
                    Image("arrowpdf")
                        .font(.title2)

                })
                    .padding()

                   // .offset(x: -120, y: 0)
                   
                Spacer()
                
                
              
Image("metronomPDF")
                        .font(.title2)
                        .foregroundColor(.white)
                       // .padding()
                      //  .opacity(0.5)
                        


                    Image("infopdf")
                        .font(.title2)
                        .foregroundColor(.white)
                        .onTapGesture {
                            navigation.push(PersonDetalsView())
                        }
                        .padding()
         
              
            
            
//                .offset(x: UIScreen.main.bounds.width * -0.0000005, y:  UIScreen.main.bounds.height * 0.05  )
               // .padding(10)
            }.padding(.top, 10)
           
        
                   

            Spacer()
            ZStack {
                
            Image("elipsePDF")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
                Text("\(stateObject.timeString())")
                    .padding(20)
            }
            .frame(width: UIScreen.main.bounds.width / 3)
            .offset(x: 0, y: UIScreen.main.bounds.height * stateObject.adjust2screen(screen: UIScreen.main.bounds.height) )
            
//            .offset(x: 0, y: UIScreen.main.bounds.height * adjust() )
            
            
            
            
            VStack {
            HStack(alignment:.center, spacing: 20) {
                VStack {
                    Text(inhaleText)
                        .opacity(1.0)
                        .font(.footnote)
                    ZStack {
//                        Circle()
//                            .fill(stateObject.inhale == 0 ? Color.gray.opacity(0.2) : Color.yellow)
//                            .grayscale(2)
//                            .frame(width: 60, height: 60)
                        Image(stateObject.inhale == 0 ? "circle1pdf" : "circle4pdf")
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
                        Image(stateObject.hold1 == 0 || !stateObject.inhaleEnds ? "circle1pdf" : "circle4pdf")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
//                        Circle()
//                            .fill(stateObject.hold1 == 0 || !stateObject.inhaleEnds ? Color.gray.opacity(0.2) : Color.yellow)
//                            .grayscale(2)
//                            .frame(width: 60, height: 60)
                        
                        Text("\(stateObject.hold1)")
                    }
                }
                
                VStack {
                    Text(exhaleText)
                        .opacity(1.0)
                        .font(.footnote)
                    ZStack {
//                        Circle()
//                            .fill(stateObject.exhale == 0 || !stateObject.hold1Ends ? Color.gray.opacity(0.2) : Color.yellow)
//                            .grayscale(2)
//                            .frame(width: 60, height: 60)
                        Image(stateObject.exhale == 0 || !stateObject.hold1Ends ?  "circle1pdf" : "circle4pdf")
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
//                        Circle()
//                            .fill(stateObject.hold2 == 0 || !stateObject.exhaleEnds ? Color.gray.opacity(0.2) : Color.yellow)
//                            .grayscale(2)
//                            .frame(width: 60, height: 60)
                        
                        Image(stateObject.hold2 == 0 || !stateObject.exhaleEnds ? "circle1pdf" : "circle4pdf")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("\(stateObject.hold2 )")
                    }
                }
            }
            //here
            .frame(width: UIScreen.main.bounds.width / 1.1)
           // Spacer()
            VStack {
                
               
                ZStack {
                  
                Image("buttonPDF")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(stateObject.totaltime > 0 ? 1 : 1)
                    .animation(.easeInOut(duration: 3))
                    .overlay(
                    Image("repeatPDF")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 2.7)
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
                   // AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {   }
                }
            }
            .padding(.bottom, 30)
        }
        }
       // .padding(.top, 25)
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
