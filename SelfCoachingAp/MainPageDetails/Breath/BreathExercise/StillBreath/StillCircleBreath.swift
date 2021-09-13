

import SwiftUI
import iOSDevPackage

struct StillBRCircle: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    
    var timerView = TimerView()
    
    @State private var  stopAnimation = true
        @State private var countdownTimer: Timer?
    
    @State var counter: Int = 0
      var countTo: Int = 300
    @State var isPlay = false
    
    @State private var breathIn = false
    @State private var braethOut = false
    @State private var hold = true
    @State private var circularMotion = false
    @State private var displayHold = false
    @State private var displayBreathOut = false
    @State private var hideBreathOut = false
    @State private var hideBreathIn = false
    @State private var hideHold = false
    @State private var displaySecondHold = false
    @State private var hideSecondHold = false
    
    @State var text = ""

    
    let grape = Color.purple
    let aqua = Color.blue
    let iron = Color.gray
    let snsow = Color.white
    let screenBackGround = Color.white
    
    let fillGradient = LinearGradient(gradient: Gradient(colors: [Color.gray, Color.gray.opacity(0.5)]), startPoint: .bottomLeading, endPoint: .topTrailing)
    
    var body: some View {
        
        var animation = isPlay ? {       withAnimation(Animation.linear(duration: 15).repeatCount(countTo / 15, autoreverses: false)) {
            circularMotion = true
        }
        } : {}
        
        
        VStack {
        ZStack {
            ZStack {
                screenBackGround.edgesIgnoringSafeArea(.all)
                ZStack {
                    fillGradient // central Circle
                        .clipShape(Circle())
                        .frame(width: 340, height: 340)
                    
                    Circle() // region for hold

                        .stroke(lineWidth: 5)
                        .frame(width: 370, height: 370)
                        .foregroundColor(iron)
//
//                    Circle() // region for exhale
//                        .trim(from: 0, to: 1/3)
//                        .stroke(lineWidth: 5)
//                        .frame(width: 370, height: 370)
//                        .foregroundColor(aqua)
//                        .rotationEffect(.degrees(-120))
//
//                    Circle() // region for inhale
//                        .trim(from: 0, to: 1/3)
//                        .stroke(lineWidth: 5)
//                        .frame(width: 370, height: 370)
//                        .foregroundColor(grape)
//                        .rotationEffect(.degrees(120))
                    
                    Capsule() //bottom
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(snsow)
                        .offset(y: 187)
                    
                    Capsule() //right
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(snsow)
                        .rotationEffect(.degrees(247))
                        .offset(x: 175, y: -66)
                    
//                    Capsule() //right
//                        .trim(from: 1/2, to: 1)
//                        .frame(width: 20, height: 25)
//                        .foregroundColor(snsow)
//                        .rotationEffect(.degrees(-90))
//                        .offset(x: 187)
                    
                    Capsule() //left
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(snsow)
                        .rotationEffect(.degrees(112))
                        .offset(x: -175, y: -66)
                    
                    ZStack {
                        Circle()
                            .stroke()
                            .frame(width: 360, height: 360)
                            .opacity(0)
                            //.foregroundColor(.red)
                        
                        Capsule() //
                            .trim(from: 1/2, to: 1)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.pink.opacity(0.5))
//                            .shadow(color: .gray, radius: 4, x: 0, y: 4)
                            .offset(y: 187)
                            .rotationEffect(.degrees(circularMotion ? 360 : 0))
                          //  .onTapGesture(perform: animation)
                            
                            .onAppear{
                              
    
                                withAnimation(Animation.linear(duration: 15).repeatCount(countTo / 15, autoreverses: false)) {
                                    self.circularMotion = true
                                }

                           
                            }
                    
                    }
                }.frame(width: 360, height: 360)
//                .scaleEffect(breathIn ? 1 : 1)
//                .scaleEffect(hold ? 1 : 1)
//                .scaleEffect(braethOut ? 1 : 1)
                
                
                .onAppear() {
                    
                    withAnimation(Animation.linear(duration: 5)) {
                        
                        self.breathIn.toggle()
                    }
                    
                    withAnimation(Animation.linear(duration: 5).delay(5)) {
                        
                        self.hold.toggle()
                    }
                    
                    withAnimation(Animation.linear(duration: 5).delay(9)) {
                        self.braethOut.toggle()
                    }
//                    withAnimation(Animation.linear(duration: 5).delay(15)) {
//                        self.hold.toggle()
//                    }
                }
//                VStack {
//                    HStack {
//                        Text("Задержка")
//                    }
//
//                    HStack {
//                        Text("Вдох")
//                        Spacer()
//                    }
//                    HStack {
//                        Spacer()
//                        Text("Выдох")
//
//                    }
//
//
//                }
//                .padding(5)
               
               // Text(breathIn ? "Вдох" : "Выдох")
//
                
               
                    
                ZStack {
                    Text("Задержка")
                        .foregroundColor(snsow)
                        .scaleEffect(1)
                        .opacity(displayBreathOut ? 1: 0)
                        .opacity(hideBreathOut ? 0 : 1)
                        .onAppear() {
                            withAnimation(Animation.easeOut(duration: 0.5).delay(11)) {
                                self.displayBreathOut.toggle()
                            }

                            withAnimation(Animation.easeOut(duration: 0.5).delay(15)) {
                                self.hideBreathOut.toggle()
                            }
                        }

//                    Text("Hold")
//                        .foregroundColor(snsow)
//                        .scaleEffect(1)
//                        .opacity(displaySecondHold ? 1: 0)
//                        .opacity(hideSecondHold ? 0 : 1)
//                        .onAppear() {
//                            withAnimation(Animation.easeInOut(duration: 0.4).delay(12)) {
//                                self.displaySecondHold.toggle()
//                            }
//                            withAnimation(Animation.easeInOut(duration: 0.4).delay(16)) {
//                                self.hideSecondHold.toggle()
//                            }
//                        }


                    Text("Выдох")
                        .foregroundColor(snsow)
                        .scaleEffect(1)
                        .opacity(displayHold ? 1: 0)
                        .opacity(hideHold ? 0 : 1)
                        .onAppear() {
                            withAnimation((Animation.easeInOut(duration: 0.5).delay(5))) {
                                self.displayHold.toggle()
                            }
                            withAnimation((Animation.easeInOut(duration: 0.5).delay(10))) {
                                self.hideHold.toggle()
                            }

                        }


                    Text("Вдох")
                        .foregroundColor(snsow)
                        .opacity(hideBreathIn ? 0 : 1)
                        .animation(Animation.easeInOut(duration: 0.5).delay(4))
                        .onAppear(){
                            self.hideBreathIn.toggle()
                        }

                }
            }
        }
//            Button(action: {
//                isPlay.toggle()
//
//            }, label: {Text("Start")})
        } //vstack
       
    }
    
    func switchText() -> String {
        if self.breathIn {
            text = "Вдох"
        }
        else if self.braethOut {
            text = "Выдох"
        }
        else if self.hold {
            text = "Задержка"
        }
        return text
    }
}


struct ClockCircle: View {
    var counter: Int
    var countTo: Int
    
    
    var body: some View {
        VStack{
            Text("\(counterToMinutes())")
                .font(.system(size: 20))
                .fontWeight(.black)
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\( minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
    
   
}



let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()
