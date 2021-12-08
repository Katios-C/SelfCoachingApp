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
    
    
    var body: some View {
        ZStack {
            Image(imageForMainScreen)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.2)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.green)
                                .opacity(0.5)
                            Image(systemName: ellipsis)
                                .font(.title2)
                                .foregroundColor(.gray)
                                .rotationEffect(.degrees(90))
                                .onTapGesture {
                                    navigation.push(PersonDetalsView())
                                }
                        }
                    }.padding(10)
                }
                Spacer()
                
                VStack {
                    VStack {
                        Text(trainTimeText)
                            .font(.footnote)
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.yellow)
                                .grayscale(2)
                                .frame(width: 70, height: 70)
                            
                            Picker("\(inputTime)", selection: $inputTime) {
                                ForEach(1...100, id: \.self) { number in
                                    Text("\(number)")
                                }
                                
                            }.pickerStyle(.menu)
                                .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        }
                    }
                    HStack {
                        VStack{
                            Text(inhaleTextMin)
                                .font(.footnote)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.yellow)
                                    .grayscale(2)
                                    .frame(width: 70, height: 70)
                                Picker( "\(inhale)", selection: $inhale) {
                                    
                                    ForEach(0...100, id: \.self) { number in
                                        Text("\(number)")
                                    }
                                }.pickerStyle(.menu)
                                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                                    .frame(width: 70, height: 70)
                            }
                        }
                        
                        VStack{
                            Text(holdTextMin)
                                .font(.footnote)
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.yellow)
                                    .grayscale(2)
                                    .frame(width: 70, height: 70)
                                Picker("\(hold1)", selection: $hold1) {
                                    ForEach(0...100, id: \.self) { number in
                                        Text("\(number)")
                                        
                                    }
                                }.pickerStyle(.menu)
                                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                            }
                        }
                        
                        
                        VStack{
                            Text(exhaleTextMin)
                                .font(.footnote)
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.yellow)
                                    .grayscale(2)
                                    .frame(width: 70, height: 70)
                                Picker("\(exhale)", selection: $exhale) {
                                    ForEach(0...100, id: \.self) { number in
                                        Text("\(number)")
                                        
                                    }
                                }.pickerStyle(.menu)
                                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                            }
                        }
                        
                        
                        VStack{
                            Text(holdTextMin)
                                .font(.footnote)
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.yellow)
                                    .grayscale(2)
                                    .frame(width: 70, height: 70)
                                Picker("\(hold2)", selection: $hold2) {
                                    ForEach(0...100, id: \.self) { number in
                                        Text("\(number)")
                                        
                                    }
                                }.pickerStyle(.menu)
                                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                            }
                        }
                    }
                    .padding(.vertical, 15)
                    
                    
                    HStack {
                        Button(action: {
                            stateObject.intervalToAdjust(inhalE: inhale, holD1: hold1, exhalE: exhale, holD2: hold2, total: inputTime)
                            if stateObject.isNotNull(inhale:  inhale, inputTime: inputTime){
                                navigation.push(FourCircleView(stateObject: stateObject))
                            }
                        }){
                            HStack {
                                Text(startBreath)
                                    .fontWeight(.semibold)
                                    .font(.title)
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
                            
                        }
                        .alert(isPresented: $stateObject.showAlert, content: {
                            Alert(title: Text(alertWarning),
                                  message: Text(alertMessage),
                                  dismissButton: .default(Text(okText), action: {}))
                        })
                    }
                    
                }
            }
        }
    }
}
