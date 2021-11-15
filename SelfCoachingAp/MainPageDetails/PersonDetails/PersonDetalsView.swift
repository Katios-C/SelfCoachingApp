
import SwiftUI
import iOSDevPackage



struct PersonDetalsView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    
    var body: some View {
        ZStack {
            Image("m6")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            
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
                }).padding()
                   // .navigationTitle("Home")
                Spacer()
                
               
                
                
            }
      
            Spacer()
            
            Button(action: {
                navigation.push(AboutTimer())
            }, label: {
                Text("О таймере")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(width: UIScreen.main.bounds.width / 1.3)
                    .background(Color.yellow)
                    .grayscale(2)
                    .clipShape(Capsule())
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
              
            }).padding()
            
          
            Button(action: {
                navigation.push(BreathSceme())
            }, label: {
                Text("Схемы дыхания")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(width: UIScreen.main.bounds.width / 1.3)
                    .background(Color.yellow)
                    .grayscale(2)
                    .clipShape(Capsule())
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                
            }).padding()
          
            
            Button(action: {
                navigation.push(Warning())
            }, label: {
                Text("Предостережение")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(width: UIScreen.main.bounds.width / 1.3)
                    .background(Color.yellow)
                    .grayscale(2)
                    .clipShape(Capsule())
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                
            }).padding()
            
            
            
            
            Button(action: {
                navigation.push(AboutMe())
            }, label: {
                Text("О разработчике")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(width: UIScreen.main.bounds.width / 1.3)
                    .background(Color.yellow)
                    .grayscale(2)
                    .clipShape(Capsule())
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                
            }).padding()
            Spacer()

            
         
        }
    }
    }
}
