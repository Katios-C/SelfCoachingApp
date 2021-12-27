import SwiftUI
import iOSDevPackage
import Combine

struct StartPageView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    @StateObject var stateObject = FourCirclesViewModel()
    
    @AppStorage(inhaleUD) var inhale =  0
    @AppStorage(hold1UD) var  hold1 = 0
    @AppStorage(exhaleUD) var exhale = 0
    @AppStorage(hold2UD) var  hold2 = 0
    @AppStorage(inputTimeUI) var inputTime = 0
    
    @State var screen:CGFloat = 0
    
 
    
    //let screen13Mini = 812.0

    
    
    var body: some View {
       
        ZStack {
            Image("fon3")
                .resizable()
                .aspectRatio(contentMode: .fill)
               // .opacity(0.7)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//.scaleEffect(x: 1.01, y: 1.01, anchor: .center)
//               .offset(x: -15)
              //  .offset(x: UIScreen.main.bounds.width * -0.01 , y: 0)
                //* -0.025
          

           
            VStack {
              
                    HStack {
                        
                        Spacer()
                        Image("infopdf")
                            .font(.title2)
                            .padding()
                            .onTapGesture {
                                navigation.push(PersonDetalsView())
                            }
//                            .offset(x: UIScreen.main.bounds.width * -0.02, y:  UIScreen.main.bounds.height * 0.05  )
                    }.padding(.top, 25)
//                    .padding(.vertical,  UIScreen.main.bounds.width / 4.5)
//                    .padding(.horizontal, 20)
                    
                 
                Spacer()

                    VStack {
                        Image("trainTimePDF")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 2.5)
                            .padding(5)
                        ZStack {
                            

                            Image("elipsePDF")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                           
                                
                                
                            Picker("\(inputTime)", selection: $inputTime) {
                                ForEach(0...100, id: \.self) { number in
                                    Text("\(number)")
                                    
                                        
                                      
                                }
                                //.foregroundColor(.green)
                                
                            }.pickerStyle(.menu)
                                .foregroundColor(.black)
                                .shadow(color: .gray, radius: 4, x: 0, y: 4)
                                
                        }
                        .frame(width: UIScreen.main.bounds.width / 3)
                        .onAppear{
                            print(UIScreen.main.bounds.width)
                            print(UIScreen.main.bounds.height)
                        }
                        
                    }
                    .offset(x: 0, y: UIScreen.main.bounds.height * stateObject.adjust(screen: UIScreen.main.bounds.height) )
                //y: UIScreen.main.bounds.height * -0.21
                  //geometry.size.height * -0.333
               // Spacer()
                
                    HStack() {
                        VStack{
//                            Text(inhaleTextMin)
//                                .font(.footnote)
                            Image("inhalePDF")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width / 10)
                              
//
                            ZStack {
                        
                                
                               Image("circle2pdf")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
//
//                                Image("elipsePDF")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
            
                                Picker( "\(inhale)", selection: $inhale) {
                                    
                                    ForEach(0...100, id: \.self) { number in
                                        Text("\(number)")
                                            
                                    }
                                }.pickerStyle(.menu)
                                    .foregroundColor(.white)

                                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                                   // .padding(15)
                                   // .frame(width: 60, height: 60)
                            }
                           
                        }
                        
                        VStack{
//                            Text(holdTextMin)
//                                .font(.footnote)
                            Image("holdPDF")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width / 5)
                              
                            ZStack {
                                Image("circle2pdf")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
//
//                                Image("elipsePDF")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
                                  
                                Picker("\(hold1)", selection: $hold1) {
                                    ForEach(0...100, id: \.self) { number in
                                        Text("\(number)")
                                           // .foregroundColor(.white)
                                        
                                    }
                                }.pickerStyle(.menu)
                                    .foregroundColor(.white)

                                    .shadow(color: .gray, radius: 4, x: 0, y: 5)
                                  //  .frame(width: 70, height: 70)
                                   // .frame(width: 60, height: 60)
                            }
                        }
                        
                        
                        VStack{
                            Image("exhalePDF")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width / 8)
                               
                            ZStack {
                                Image("circle2pdf")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
//                                Image("elipsePDF")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
                         
                                Picker("\(exhale)", selection: $exhale) {
                                    ForEach(0...100, id: \.self) { number in
                                        Text("\(number)")
                                        
                                    }
                                }.pickerStyle(.menu)
                                    .foregroundColor(.white)

                                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                                  //  .frame(width: 70, height: 70)
                                 //   .frame(width: 60, height: 60)
                            }
                        }
                        
                        
                        VStack{
                            Image("holdPDF")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width / 5)
                              
                            ZStack {
                                Image("circle2pdf")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
//                                Image("elipsePDF")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
                          
                                Picker("\(hold2)", selection: $hold2) {
                                    ForEach(0...100, id: \.self) { number in
                                        Text("\(number)")
                                        
                                    }
                                }.pickerStyle(.menu)
                                    .foregroundColor(.white)

                                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                                 //   .frame(width: 70, height: 70)
                                  //  .frame(width: 60, height: 60)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.1)
                    .padding()
                   // .padding(.vertical, 15)
                    
                    
                    HStack {
                        Button(action: {
                            stateObject.intervalToAdjust(inhalE: inhale, holD1: hold1, exhalE: exhale, holD2: hold2, total: inputTime)
                            if stateObject.isNotNull(inhale:  inhale, inputTime: inputTime){
                                navigation.push(FourCircleView(stateObject: stateObject))
                            }
                        }){
                            HStack {
                                ZStack {
                                    Image("buttonPDF")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .overlay(
                                        Image("BreathPDF")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: UIScreen.main.bounds.width / 3.5)
                                        )
                                    
//                                Text(startBreath)
//                                    .fontWeight(.semibold)
//                                    .font(.title)
//                                    .foregroundColor(.white)
                            }
//.padding()
                                .frame(width: UIScreen.main.bounds.width / 1.5)
                            }
//                            .padding()
//                            .foregroundColor(.white)
//                            .background(Color.green)
//                            .clipShape(Capsule())
//                            .padding(.vertical, 12)
//                            .cornerRadius(8)
//                            .frame(width: UIScreen.main.bounds.width / 2)
//                            .grayscale(2)
//                            .shadow(color: .gray, radius: 4, x: 0, y: 4)
                            
                        }
                        .alert(isPresented: $stateObject.showAlert, content: {
                            Alert(title: Text(alertWarning),
                                  message: Text(alertMessage),
                                  dismissButton: .default(Text(okText), action: {}))
                        })
                    }
                    .padding(.bottom, 30)
               // }
            }
        
    }
    }
    
    

}

