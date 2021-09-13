//
//  BRCircle.swift
//  SelfCoachingAp
//
//  Created by Екатерина Чернова on 31.08.2021.
//

import SwiftUI

struct BRCircle: View {
    
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
    
    let grape = Color.purple
    let aqua = Color.blue
    let iron = Color.gray
    let snsow = Color.white
    let screenBackGround = Color.white
    
    let fillGradient = LinearGradient(gradient: Gradient(colors: [Color.purple, Color.pink]), startPoint: .bottomLeading, endPoint: .topTrailing)
    
    var body: some View {
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
                    
                    Circle() // region for exhale
                        .trim(from: 0, to: 1/4)
                        .stroke(lineWidth: 5)
                        .frame(width: 370, height: 370)
                        .foregroundColor(aqua)
                        .rotationEffect(.degrees(-90))
                    
                    Circle() // region for inhale
                        .trim(from: 0, to: 1/4)
                        .stroke(lineWidth: 5)
                        .frame(width: 370, height: 370)
                        .foregroundColor(grape)
                        .rotationEffect(.degrees(90))
                    
                    Capsule() //bottom
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(snsow)
                        .offset(y: 187)
                    
                    Capsule() //top
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(snsow)
                        .rotationEffect(.degrees(180))
                        .offset(y: -187)
                    
                    Capsule() //right
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(snsow)
                        .rotationEffect(.degrees(-90))
                        .offset(x: 187)
                    
                    Capsule() //left
                        .trim(from: 1/2, to: 1)
                        .frame(width: 20, height: 25)
                        .foregroundColor(snsow)
                        .rotationEffect(.degrees(90))
                        .offset(x: -187)
                    
                    ZStack {
                        Circle()
                            .stroke()
                            .frame(width: 360, height: 360)
                            .opacity(0)
                            //.foregroundColor(.red)
                        
                        Capsule() //
                            .trim(from: 1/2, to: 1)
                            .frame(width: 25, height: 25)
                            .foregroundColor(aqua)
                            .offset(y: 187)
                            .rotationEffect(.degrees(circularMotion ? 360 : 0))
                            .onAppear(){
                                withAnimation(Animation.linear(duration: 15)) {
                                    self.circularMotion = true
                                }
                            }
                    }
                }.frame(width: 360, height: 360)
                .scaleEffect(breathIn ? 1 : 0.8)
                .scaleEffect(hold ? 1 : 1)
                .scaleEffect(braethOut ? 0.8 : 1)
                
                .onAppear() {
                    withAnimation(Animation.linear(duration: 4)) {
                        self.breathIn.toggle()
                    }
                    
                    withAnimation(Animation.linear(duration: 4).delay(4)) {
                        self.hold.toggle()
                    }
                    
                    withAnimation(Animation.linear(duration: 4).delay(8)) {
                        self.braethOut.toggle()
                    }
                    withAnimation(Animation.linear(duration: 4).delay(12)) {
                        self.hold.toggle()
                    }
                }
                
                ZStack {
                    Text("Breath Out")
                        .foregroundColor(snsow)
                        .scaleEffect(1)
                        .opacity(displayBreathOut ? 1: 0)
                        .opacity(hideBreathOut ? 0 : 1)
                        .onAppear() {
                            withAnimation(Animation.easeOut(duration: 0.4).delay(8)) {
                                self.displayBreathOut.toggle()
                            }
                            
                            withAnimation(Animation.easeOut(duration: 0.4).delay(12)) {
                                self.hideBreathOut.toggle()
                            }
                        }
                    
                    Text("Hold")
                        .foregroundColor(snsow)
                        .scaleEffect(1)
                        .opacity(displaySecondHold ? 1: 0)
                        .opacity(hideSecondHold ? 0 : 1)
                        .onAppear() {
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(12)) {
                                self.displaySecondHold.toggle()
                            }
                            withAnimation(Animation.easeInOut(duration: 0.4).delay(16)) {
                                self.hideSecondHold.toggle()
                            }
                        }
                    
                    
                    Text("Hold")
                        .foregroundColor(snsow)
                        .scaleEffect(1)
                        .opacity(displayHold ? 1: 0)
                        .opacity(hideHold ? 0 : 1)
                        .onAppear() {
                            withAnimation((Animation.easeInOut(duration: 0.4).delay(4))) {
                                self.displayHold.toggle()
                            }
                            withAnimation((Animation.easeInOut(duration: 0.4).delay(8))) {
                                self.hideHold.toggle()
                            }
                            
                        }
                    
                    
                    Text("Breath In")
                        .foregroundColor(snsow)
                        .opacity(hideBreathIn ? 0 : 1)
                        .animation(Animation.easeInOut(duration: 0.4).delay(4))
                        .onAppear(){
                            self.hideBreathIn.toggle()
                        }
                        
                }
            }
        }
    }
}

struct BRCircle_Previews: PreviewProvider {
    static var previews: some View {
        BRCircle()
    }
}
