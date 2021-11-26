

import SwiftUI
import iOSDevPackage

struct AboutTimer: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    navigation.pop(to: .previous)
                }, label: {
                    Text("Back")
//                        .padding(.vertical, 12)
//                        .foregroundColor(.black)
//                        .frame(width: UIScreen.main.bounds.width / 4)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10).foregroundColor(.blue).grayscale(2).opacity(0.5) .shadow(color: .gray, radius: 4, x: 0, y: 4))
                    
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
            
          Text("О таймере")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .frame(width: UIScreen.main.bounds.width / 3)
                .background(Color.red)
                .clipShape(Capsule())
                .shadow(color: .gray, radius: 4, x: 0, y: 4)
                .grayscale(2)
//                          .padding()
//                          .background(
//                            RoundedRectangle(cornerRadius: 10).foregroundColor(.purple).shadow(color: .gray, radius: 4, x: 0, y: 4)
//                                .grayscale(2).opacity(0.5))
            
                                
                                //.strokeBorder(Color.yellow, lineWidth: 0.5))
            
            
            VStack(alignment: .leading, spacing: 6) {
          
                HStack {
                    Image(systemName: "lungs").resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .shadow(color: .green, radius: 4, x: 0, y: 4)
                 Text("Таймер предназначен для дыхательных тренировок")
                    .padding(4)
                   // .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 0.5))
                   // .frame(width: UIScreen.main.bounds.width / 1.1)
                }
                
                HStack {
                  
                    Image(systemName: "circle.grid.cross").resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .shadow(color: .green, radius: 4, x: 0, y: 4)
                Text("Вы можете  выставить необходимые интервалы и задать общее время тренировки.")
                    .padding(4)
                 //  .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 0.5))
                   // .frame(width: UIScreen.main.bounds.width / 1)
                                    }
                HStack {
              
                    HStack {
                        Image(systemName: "metronome").resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                            .shadow(color: .green, radius: 4, x: 0, y: 4)
                Text("Дополнительно можно добавить звук метронома.")
                    .padding(4)
//.background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 0.5))
                   // .frame(width: UIScreen.main.bounds.width / 1)
                }
                }
                
            }
            Spacer()
//            .background(
//                RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 0.5))
//            .padding()

        }
    }
}

struct AboutTimer_Previews: PreviewProvider {
    static var previews: some View {
        AboutTimer()
    }
}
