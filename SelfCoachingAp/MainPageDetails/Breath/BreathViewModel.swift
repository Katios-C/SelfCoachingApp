
import SwiftUI
import Combine

class BreathViewModel: ObservableObject {
    private var container: Set<AnyCancellable> = []
    var breathCaruselViewShared = BreathCaruselView()
    @Published var playingSubj = ""
    
}
