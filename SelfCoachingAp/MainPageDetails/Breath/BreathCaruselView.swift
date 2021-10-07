
import SwiftUI


struct BreathCaruselView: View {
    
   
    @EnvironmentObject var breathViewModelShared: BreathViewModel
@State var tapped = 8
    
    var body: some View {
        let colors: Array<Color> = [.gray, .green, .purple, .red]
        let titles = ["Спокойствие", "Концентрация", "Бодроость", "Здоровье легких"]
       
       
        
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0..<4) { index in
                    Text("\(titles[index])")
                        .foregroundColor(.white)
                       // .background(highlight(index: index, target: tapped))
                        .font(.title3)
                        .frame(width: frameSize(index: index, target: tapped).width, height: frameSize(index: index, target: tapped).height)
                        .background(colors[index])
                        .grayscale(2)
                       // .border(highlight(index: index, target: tapped))
                        .cornerRadius (10)
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        .opacity(opac(index: index, target: tapped))
                        
                        
                        
                        .onTapGesture {
                         
                            print("Carusel \(titles[index])")
                            breathViewModelShared.playingSubj = titles[index]
                           // tapped = !tapped
                            tapped = index
                        }
                        
                }
            }
            .padding(25)
        }
    }
    
    
    func highlight(index: Int, target: Int) -> Color {
        if  target == index {
            return .black
        } else {
            return .clear
        }
        
}
    
    func opac (index: Int, target: Int) -> Double {
        if  target == index {
            return 1
        } else {
            return 0.7
        }
        
}
    
    func frameSize  (index: Int, target: Int) -> (width: CGFloat, height: CGFloat)  {
        withAnimation(Animation.linear(duration: 1)) {
        if  target == index {
            return (180, 120)
        } else {
            return (150, 100)
        }
    }
}
}
