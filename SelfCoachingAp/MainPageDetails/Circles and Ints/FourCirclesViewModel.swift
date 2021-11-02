
import Foundation
import SwiftUI
import Combine

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
    
    @Published var totaltime = 0
    @Published var stop = false
    @Published var start = 0
//    @Published var inhaleProgress: CGFloat = 0
//    @Published var hold1Progress: CGFloat = 0
//    @Published var exhaleProgress: CGFloat = 0
//    @Published var hold2Progress: CGFloat = 0
    
    func progressResult(whatBreath: Int) -> CGFloat {
//       let a = Double(whatBreath / 10)
//        print("\(a)")
        return CGFloat(((1 / Double(whatBreath) * 10) / 10))
    }
    
    func countDown ( typeOfBreath: Int) -> String {
        var result = 0
        if start <= typeOfBreath {
        result = start
        }
        return "\(result)"
    }
    
    func test () -> Int {
        
        
        return start
        
    }
    
    
    @Published private(set) var first = 0
    @Published private(set) var second = 0
    private var subscriptions: Set<AnyCancellable> = []
    func starT() {
      Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
        .scan(0) { accumulated, _ in accumulated + 1 }
        .assign(to: \.first, on: self)
        .store(in: &subscriptions)
        
      Timer.publish(every: 2, on: .main, in: .common)
            .autoconnect()
        .scan(0) { accumulated, _ in accumulated + 1 }
        .assign(to: \.second, on: self)
        .store(in: &subscriptions)
        
    }
    func stoP() {
      subscriptions.removeAll()
    }
  }



