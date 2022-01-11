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
                Image(metronomImage).resizable()
                    .frame(width: 20, height: 25)
                    .aspectRatio(contentMode: .fit)
            }
            :
            Button(action: {
                stateObject.audioPlayer.pause()
                isPlay = false
            }) {
                Image(metronomeImage_2).resizable()
                    .frame(width: 20, height: 25)
                    .aspectRatio(contentMode: .fit)
            }
        }
        .onAppear {
            stateObject.playTikTak()
        }
    }
}

