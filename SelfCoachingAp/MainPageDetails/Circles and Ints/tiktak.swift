import SwiftUI
import AVKit
struct TikTak: View {
    @StateObject var stateObject:  fourCirclesViewModel
    
    
    @State var isPlay = false
    var body: some View {
            
               
                HStack {
                    !isPlay ?
                    Button(action: {
                        stateObject.audioPlayer.play()
                        isPlay = true
                    }) {
                        Image(systemName: "metronome.fill").resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                    }
                    :
                    Button(action: {
                        stateObject.audioPlayer.pause()
                        isPlay = false
                        
                    }) {
                        Image(systemName: "metronome").resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.yellow)
                    }
                
                }
            
        .onAppear {
         
            let sound = Bundle.main.path(forResource: "tiktak", ofType: "mp3")
            stateObject.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            }
        }
    }

