

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
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(width: UIScreen.main.bounds.width / 4)
                        .background(Color.green)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        .grayscale(2)
                }).padding()
                
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

            VStack(alignment: .leading, spacing: 6) {
          
                HStack {
                    Image(systemName: "lungs").resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .shadow(color: .green, radius: 4, x: 0, y: 4)
                 Text("Таймер предназначен для дыхательных тренировок")
                    .padding(4)
                }
                
                HStack {
                  
                    Image(systemName: "circle.grid.cross").resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .shadow(color: .green, radius: 4, x: 0, y: 4)
                Text("Вы можете  выставить необходимые интервалы и задать общее время тренировки.")
                    .padding(4)
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
                }
                }
            }
            Spacer()
        }
    }
}

