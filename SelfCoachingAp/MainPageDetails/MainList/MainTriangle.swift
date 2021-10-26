
import SwiftUI
import iOSDevPackage
import Firebase
import Combine

struct MainTriangle: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
   
    @StateObject var stateObject = fourCirclesViewModel()
    
    @AppStorage("log_status") var log_Status = false

  //  var container = Container()
    
    
    @AppStorage("inhale") var inhale =  0
    @AppStorage("hold1")  var  hold1 = 0
    @AppStorage("exhale")  var  exhale = 0
    @AppStorage("hold2")  var  hold2 = 0
    @AppStorage("inputTime") var inputTime = 0
    
    @State var isTapped = false
   // @EnvironmentObject var viewModel: MiniCirclesViewModel
    @StateObject var settings = MiniCirclesViewModel()
    
    var body: some View {
        ZStack {
            
            
            Image("m6")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.2)
               // .blur(radius: 2)
              // .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
            HStack {
//                Image("logout")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: UIScreen.main.bounds.width / 5)
//                    .onTapGesture {
//                        DispatchQueue.global(qos: .background).async {
//                                                try? Auth.auth().signOut()
//                                            }
//                                            withAnimation(.easeInOut) {
//                                                log_Status = false
//                                            }
//                    }
                    
                Button(action: {
                    DispatchQueue.global(qos: .background).async {
                        try? Auth.auth().signOut()
                    }
                    withAnimation(.easeInOut) {
                        log_Status = false
                    }
                }, label: {
                    Text("Log Out")
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
                
                
                              // Image(systemName: "square.grid.3x3.fill")
                   Image(systemName: "line.3.horizontal.circle.fill")
               // Image(systemName: "ellipsis")
                    .font(.title2)
                    .foregroundColor(.gray)
                   // .rotationEffect(.degrees(90))
                    .onTapGesture {
                        navigation.push(PersonDetalsView())
                    }
                
                
            }
            .padding()
            // .border(Color.green)
            Divider()
            
           Spacer()
                VStack {
                    VStack {
                    Text("Время тренировки")
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                                   .fill(Color.yellow)
                                                   .grayscale(2)
                                                   .frame(width: 70, height: 70)
                            Picker("InputTome", selection: $inputTime) {
                        ForEach(1...100, id: \.self) { number in
                            Text("\(number)")
                             
                        }
                    }.pickerStyle(.menu)
                //   .padding(15)
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                 //   .border(Color.pink, width: 0.5)
                  //  .background(Color.gray)
              //      .background(isTapped ? Color.gray : Color.white)
                    
                }
                    }
                HStack {
                  
                        
                VStack{
                    
                Text("вдох")
//                    Image("inhale")
//                        .resizable()
//                        .aspectRatio( contentMode: .fit)
//                        .frame(width: UIScreen.main.bounds.width / 7)
//
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
            //    .padding(15)
                
               
                
            //   .border(Color.pink, width: 0.5)
              //  .background(Color.gray)
             //   .background(isTapped ? Color.gray : Color.white)
                .shadow(color: .gray, radius: 4, x: 0, y: 4)
            }
                    }
                .padding(7)
                    VStack{
                       
                    Text("задержка")
//                        Image("hold")
//                            .resizable()
//                            .aspectRatio( contentMode: .fit)
//                            .frame(width: UIScreen.main.bounds.width / 4.5)
                        
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
                //   .padding(15)
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                 //   .border(Color.pink, width: 0.5)
                  //  .background(Color.gray)
              //      .background(isTapped ? Color.gray : Color.white)
                    
                }
                    }
                 //   .padding(5)
                    
                    VStack{
                    Text("выдох")
//                        Image("exhale")
//                            .resizable()
//                            .aspectRatio( contentMode: .fit)
//                            .frame(width: UIScreen.main.bounds.width / 6)
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
                  //  .padding(15)
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    
                   // .border(Color.pink, width: 0.5)
                  //  .background(Color.gray)
                 //   .background(isTapped ? Color.gray : Color.white)
                   
                }
                    }
                //    .padding(7)
                    
                    VStack{
                    Text("задержка")
//                        Image("hold")
//                            .resizable()
//                            .aspectRatio( contentMode: .fit)
//                            .frame(width: UIScreen.main.bounds.width / 4.5)
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
                //    .padding(15)
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    
                   // .border(Color.pink, width: 0.5)
                  //  .background(Color.gray)
                 //   .background(isTapped ? Color.gray : Color.white)
                   
                }
                    }
               //     .padding(5)

                    
            }
                .padding(.vertical, 15)
                
                    
                    HStack {
                        
                        Button(action: {
                            navigation.push(MainView())
                        }){
                           
                                Text("Круг")
                                    .fontWeight(.semibold)
                                    .font(.title)

                            
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
                Button(action: {
    //               navigation.push(MiniCircles(viewModel: stateObject))
//                    stateObject.inhale = inhale
//                     stateObject.hold1 = hold1
//                   stateObject.exhale = exhale
//                     stateObject.hold2 = hold2
                    stateObject.totaltime = inputTime * 60
                    
                  //  UserDefaults.standard.set(self.inhale, forKey: "inhale")
//                    UserDefaults.standard.set(self.hold1, forKey: "hold1")
//                    UserDefaults.standard.set(exhale, forKey: "exhale")
//                    UserDefaults.standard.set(hold2, forKey: "hold2")
//                    container.inhale = stateObject.inhale
//                    container.hold1 = stateObject.hold1
//                    container.exhale = stateObject.exhale
//                    container.hold2 = stateObject.hold2
                    
                    
                  //  navigation.push(FourCircles(stateObject: stateObject))
                    navigation.push(StillExView(stateObject: stateObject))
                }){
//                    Image("BreathButton")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                       // .shadow(color: .gray, radius: 4, x: 0, y: 4)
//                        .frame(width: UIScreen.main.bounds.width / 2)
                        
                    
                    HStack {
//                        Image(systemName: "trash")
//                            .font(.title)
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
            }
           
    }
       
      
}
       
}
}
}