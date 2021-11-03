
import SwiftUI
import iOSDevPackage
import Firebase
import Combine

struct MainTriangle: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    @StateObject var stateObject = fourCirclesViewModel()
    
    @AppStorage("inhale") var inhale =  0
    @AppStorage("hold1")  var  hold1 = 0
    @AppStorage("exhale")  var exhale = 0
    @AppStorage("hold2")  var  hold2 = 0
    @AppStorage("inputTime") var inputTime = 0
    
    
    @State private var showAlert: Bool = false
    
    
    var body: some View {
        ZStack {
            Image("m6")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.2)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "line.3.horizontal.circle.fill")
                    
                        .font(.title2)
                        .foregroundColor(.gray)
                        .onTapGesture {
                            navigation.push(PersonDetalsView())
                        }
                    
                }
                .padding()
                
                Divider()
                
                Spacer()
                
                VStack {
                    
                    
                    VStack {
                        Text("Время тренировки в минутах")
                            .font(.footnote)
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.yellow)
                                .grayscale(2)
                                .frame(width: 70, height: 70)
                            Picker("InputTome", selection: $inputTime) {
                                ForEach(0...100, id: \.self) { number in
                                    Text("\(number)")
                                    
                                }
                            }.pickerStyle(.menu)
                                .shadow(color: .gray, radius: 4, x: 0, y: 4)
                            
                            
                        }
                    }
                    HStack {
                        
                        
                        VStack{
                            
                            Text("вдох")
                            
                                .font(.footnote)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.yellow)
                                    .grayscale(2)
                                    .frame(width: 70, height: 70)
                                Picker("Inhale", selection: $inhale) {
                                    
                                    ForEach(0...100, id: \.self) { number in
                                        Text("\(number)")
                                        
                                        
                                    }
                                }.pickerStyle(.menu)
                                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                            }
                        }
                        
                        VStack{
                            
                            Text("задержка")
                                .font(.footnote)
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.yellow)
                                    .grayscale(2)
                                    .frame(width: 70, height: 70)
                                Picker("Inhale", selection: $hold1) {
                                    ForEach(0...100, id: \.self) { number in
                                        Text("\(number)")
                                        
                                    }
                                }.pickerStyle(.menu)
                                
                                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                                
                            }
                        }
                        
                        
                        VStack{
                            Text("выдох")
                                .font(.footnote)
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.yellow)
                                    .grayscale(2)
                                    .frame(width: 70, height: 70)
                                Picker("Inhale", selection: $exhale) {
                                    ForEach(0...100, id: \.self) { number in
                                        Text("\(number)")
                                        
                                    }
                                }.pickerStyle(.menu)
                                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                                
                                
                            }
                        }
                        
                        
                        VStack{
                            Text("задержка")
                                .font(.footnote)
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.yellow)
                                    .grayscale(2)
                                    .frame(width: 70, height: 70)
                                Picker("Inhale", selection: $hold2) {
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
                            stateObject.inhale = inhale
                            stateObject.hold1 = hold1
                            stateObject.exhale = exhale
                            stateObject.hold2 = hold2
                            
                            
                            if inhale > 0 && inputTime > 0 {
                                stateObject.totaltime = inputTime * 60
                                navigation.push(FourCircles(stateObject: stateObject)) }
                            else {
                                showAlert = true
                                
                            }
                            
                        }){
                            
                            HStack {
                                Text("Дышать")
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
                        .alert(isPresented: $showAlert, content: {
                            Alert(title: Text("Внимание"),
                                  message: Text("Время вдоха и время тренировки должны быть больше 0"),
                                  dismissButton: .default(Text("OK"), action: {}))
                        })
                    }
                    
                }
            }
        }
    }
}
