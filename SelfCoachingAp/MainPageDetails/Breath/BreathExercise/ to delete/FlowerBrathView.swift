
import SwiftUI

struct FlowerBrathView: View {
    @State var scale_i_out = false
    @State var rotate_i_out = false
    var body: some View {
        ZStack {
        Group {
            ZStack {
                Circle()
                    .frame(width: 80, height: 100)
                    .foregroundColor(Color.green)
                    .offset(y: -42)
                
                Circle()
                    .frame(width: 80, height: 100)
                    .foregroundColor(Color.green)
                    .offset(y: 42)
            }
        }
        .opacity(1/3)
        
        Group {
            ZStack{
                Circle()
                    .frame(width: 80, height: 100)
                    .foregroundColor(Color.green)
                    .offset(y: -42)
                
                Circle()
                    .frame(width: 80, height: 100)
                    .foregroundColor(Color.green)
                    .offset(y: 42)
            }
        }.rotationEffect(.degrees(60))
        .opacity(1/4)
        
        Group {
            ZStack{
                Circle()
                    .frame(width: 80, height: 100)
                    .foregroundColor(Color.green)
                    .offset(y: -42)
                
                Circle()
                    .frame(width: 80, height: 100)
                    .foregroundColor(Color.green)
                    .offset(y: 42)
            }
        }.rotationEffect(.degrees(120))
        .opacity(1/2)
        }.rotationEffect(.degrees((rotate_i_out ? 90 : 0)))
        .scaleEffect(scale_i_out ? 1 : 1/8)
        .animation(Animation.easeInOut.repeatCount(5).speed(1/12))
                    //.repeatForever(autoreverses: true).speed(1/12))
        .onAppear() {
            self.rotate_i_out.toggle()
            self.scale_i_out.toggle()
        }
}
}
struct FlowerBrathView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerBrathView()
    }
}
