
import SwiftUI
import iOSDevPackage

struct RectangleView: View  {
  //  @EnvironmentObject var UIState: UIStateModel
    var color: Color
    var title: String
    var id: Int
    
    var body: some View {
        ZStack {
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(10)
         //   .frame(width: 250, height: 350)
          //  .padding(30)
           // .scaleEffect(color == .gray ? 1.5 : 1)
            .grayscale(2)
            
            VStack {
                Spacer()
            Text(title)
            }
        
            .font(.title)
            .padding()
            //.frame(width: 250, height: 350)
            .foregroundColor(.white)
            
        }
        
        //.zIndex(10)
       // .rotationEffect(.degrees(10))
        
        
        
        .onAppear{
            withAnimation(Animation.easeInOut(duration: 2)) {
            print("animation")
            }
        }
      
    }
}


