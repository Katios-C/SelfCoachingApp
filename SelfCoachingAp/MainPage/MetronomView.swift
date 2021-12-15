import SwiftUI

struct MetronomView: View {
    @StateObject var stateObject: FourCirclesViewModel
    @State var isPlay = false
    
    var body: some View {
        HStack {
            !isPlay  ?
            Button(action: {
              
                
                    stateObject.audioPlayer.play()
                isPlay = true
            }) {
                Image(systemName: metronomImageName).resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.gray)
            }
            :
            Button(action: {
                stateObject.audioPlayer.pause()
                isPlay = false
            }) {
                Image(systemName: metronom).resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.yellow)
            }
        }
        .onAppear {
            stateObject.playTikTak()
        }
    }
}

