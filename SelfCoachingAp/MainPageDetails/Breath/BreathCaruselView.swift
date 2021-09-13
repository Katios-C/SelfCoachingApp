
import SwiftUI


struct BreathCaruselView: View {
    
   
    @EnvironmentObject var breathViewModelShared: BreathViewModel

    
    var body: some View {
        let colors: [Color] = [.gray, .green, .purple, .red]
        let titles = ["Спокойствие", "Концентрация", "Бодроость", "Здоровье легких"]
       
       
        
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0..<4) { index in
                    Text("\(titles[index])")
                        .foregroundColor(.white)
                        .font(.title3)
                        .frame(width: 150, height: 100)
                        .background(colors[index])
                        .grayscale(2)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        .onTapGesture {
                         
                            print("Carusel \(titles[index])")
                            breathViewModelShared.playingSubj = titles[index]
                        }
                        
                }
            }
            .padding(25)
        }
    }
}

