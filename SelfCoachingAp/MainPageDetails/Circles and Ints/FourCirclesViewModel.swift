
import Foundation
import SwiftUI

class fourCirclesViewModel: ObservableObject {
    @Published var inhale = 0
    @Published var hold1 = 0
    @Published var exhale = 0
    @Published var hold2 = 0
    
    @Published var inhaleEnds = false
    @Published var hold1Ends = false
    @Published var exhaleEnds = false
    @Published var hold2Ends = false
  //  @Published var restart = false
    
    @Published var totaltime = 10
    
//    @Published var inhaleProgress: CGFloat = 0
//    @Published var hold1Progress: CGFloat = 0
//    @Published var exhaleProgress: CGFloat = 0
//    @Published var hold2Progress: CGFloat = 0
    
    func progressResult(whatBreath: Int) -> CGFloat {
//       let a = Double(whatBreath / 10)
//        print("\(a)")
        return CGFloat(((1 / Double(whatBreath) * 10) / 10))
    }
    
    
}
