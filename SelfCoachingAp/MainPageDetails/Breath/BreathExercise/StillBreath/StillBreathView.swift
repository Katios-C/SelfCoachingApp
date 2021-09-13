
import SwiftUI

struct StillBreathView: View {
    var body: some View {
        VStack {
            
//            ZStack {
//            Color.gray
//                .clipShape(Capsule())
//                .opacity(0.5)
//                .frame(width: UIScreen.main.bounds.width / 1.8, height: 40, alignment: .center)
//                .shadow(color: .gray, radius: 4, x: 0, y: 4)
//       Text ("Спокойствие")
//        .foregroundColor(.white)
//        .fontWeight(.thin)
//       // .padding(5)
//            }
           
        Text ("Дыхание, которое успокаивает ум, улучшает психологическое состояние, замедляет и расслабляет. Отлично подходит для вечера или в любой стрессовой ситуации.")
            .fontWeight(.thin)
            .padding()
            Divider()
            
            HStack {
            Image(systemName: "lungs.fill")
                
                Text("Вдох 5 секунд")
                    .fontWeight(.thin)
                    .font(.title3)
                Spacer()
            }
            .padding()
            Divider()
            HStack {
            Image(systemName: "lungs")
               
                Text("Выдох 5 секунд")
                    .fontWeight(.thin)
                    .font(.title3)
                Spacer()
            }
            .padding()
            
            
            Divider()
            
            HStack{
            Image(systemName: "hand.raised")
                
                Text("Задержка 5 секунд")
                    .fontWeight(.thin)
                    .font(.title3)
                Spacer()
            }
            .padding()
            
       
            
        }
    }
}

struct StillBreathView_Previews: PreviewProvider {
    static var previews: some View {
        StillBreathView()
    }
}
