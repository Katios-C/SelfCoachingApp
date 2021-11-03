
import Foundation
import SwiftUI
import AVKit

class fourCirclesViewModel: ObservableObject {
    @Published var inhale = 0
    @Published var hold1 = 0
    @Published var exhale = 0
    @Published var hold2 = 0
 
    
    @Published var inhaleEnds = false
    @Published var hold1Ends = false
    @Published var exhaleEnds = false
    @Published var hold2Ends = false

    
    @Published var totaltime = 0
  
    
     var audioPlayer: AVAudioPlayer!

    
    func progressResult(whatBreath: Int) -> CGFloat {
        return CGFloat(((1 / Double(whatBreath) * 10) / 10))
    }

  }



