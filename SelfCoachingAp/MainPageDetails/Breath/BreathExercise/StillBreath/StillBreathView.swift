
import SwiftUI

struct StillBreathView: View {
    var body: some View {
        VStack {

           
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
