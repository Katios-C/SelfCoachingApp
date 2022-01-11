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
    
    var body: some View {
        
        ZStack {
            Image(fon_3)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                HStack {
                    Spacer()
                    Image(infoImage)
                        .font(.title2)
                        .padding()
                        .onTapGesture {
                            navigation.push(PersonDetalsView())
                        }
                }.padding(.top, 25)
                Spacer()
                
                VStack {
                    Image(trainTimeImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 2.5)
                        .padding(5)
                    ZStack {
                        Image(ellipseImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Picker("\(inputTime)", selection: $inputTime) {
                            ForEach(0...100, id: \.self) { number in
                                Text("\(number)")
                            }
                        }.pickerStyle(.menu)
                            .foregroundColor(.black)
                            .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    }
                    .frame(width: UIScreen.main.bounds.width / 3)
                }
                .offset(x: 0, y: UIScreen.main.bounds.height * stateObject.adjust(screen: UIScreen.main.bounds.height) )
                
                HStack() {
                    VStack{
                        Image(inhaleTextMin)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 10)
                        
                        ZStack {
                            Image(circlePDF)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            
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
                        Image(holdTextMin)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 5)
                        
                        ZStack {
                            Image(circlePDF)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Picker("\(hold1)", selection: $hold1) {
                                ForEach(0...100, id: \.self) { number in
                                    Text("\(number)")
                                }
                            }.pickerStyle(.menu)
                                .foregroundColor(.white)
                            
                                .shadow(color: .gray, radius: 4, x: 0, y: 5)
                        }
                    }
                    
                    
                    VStack{
                        Image(exhaleTextMin)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 8)
                        
                        ZStack {
                            Image(circlePDF)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            
                            Picker("\(exhale)", selection: $exhale) {
                                ForEach(0...100, id: \.self) { number in
                                    Text("\(number)")
                                    
                                }
                            }.pickerStyle(.menu)
                                .foregroundColor(.white)
                            
                                .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        }
                    }
                    
                    
                    VStack{
                        Image(holdTextMin)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 5)
                        
                        ZStack {
                            Image(circlePDF)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            
                            Picker("\(hold2)", selection: $hold2) {
                                ForEach(0...100, id: \.self) { number in
                                    Text("\(number)")
                                    
                                }
                            }.pickerStyle(.menu)
                                .foregroundColor(.white)
                            
                                .shadow(color: .gray, radius: 4, x: 0, y: 4)
                            
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width / 1.1)
                .padding()
                
                
                HStack {
                    Button(action: {
                        stateObject.intervalToAdjust(inhalE: inhale, holD1: hold1, exhalE: exhale, holD2: hold2, total: inputTime)
                        if stateObject.isNotNull(inhale:  inhale, inputTime: inputTime){
                            navigation.push(FourCircleView(stateObject: stateObject))
                        }
                    }){
                        HStack {
                            ZStack {
                                Image(button)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .overlay(
                                        Image(startBreathText)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: UIScreen.main.bounds.width / 3.5)
                                    )
                            }
                            
                            .frame(width: UIScreen.main.bounds.width / 1.5)
                        }
                        
                    }
                    .alert(isPresented: $stateObject.showAlert, content: {
                        Alert(title: Text(alertWarning),
                              message: Text(alertMessage),
                              dismissButton: .default(Text(okText), action: {}))
                    })
                }
                .padding(.bottom, 30)
            }
        }
    }
}

