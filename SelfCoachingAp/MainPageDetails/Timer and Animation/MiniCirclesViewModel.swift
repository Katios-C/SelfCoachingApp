
import Foundation
import Combine
class MiniCirclesViewModel: ObservableObject {
    @Published var totalTime = 0.0
    @Published var inhale = 0
    @Published var hold1 = 0
    @Published var exhale = 0
    @Published var hold2 = 0
    
    func returnTotalTime() -> Double {
        var resultTime = Double(inhale + hold1 + exhale + hold2)
        
        print("returnTotalTime - \((4 * resultTime) / 20)")
        return (4 * resultTime) / 20
    }
    
    func timeForCircles(breathTime: Double, phase: String) -> (part: Double, delay: Double) {
        var part = 1.0 / breathTime
        var delay = 0.0
        var delay2 = 0.0
        switch phase {
        case "inhale":
            delay = 0
        case "hold1" :
            delay = breathTime
        case "exhale" :
            delay = breathTime * 2
        default:
            delay = breathTime * 3
        }
        print("part - \(part)")
        print("delay - \(delay)")
        return(part,delay)
    }
    
    func hold1Calculate() -> (Double) {
        print("INHALE \(inhale)")
        return Double(inhale)
    }
}
