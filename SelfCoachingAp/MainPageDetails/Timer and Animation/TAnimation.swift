

import SwiftUI

struct TAnimation: View {
    
    @State private var timerOne: Timer?
    @State private var selectedSecs = 10
    
    
    var body: some View {
        TimerButton(label: "Старт", buttonColor: .yellow)
            .onTapGesture {
                self.timerOne = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.selectedSecs -= 1
            }
    }
}
}

struct TAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TAnimation()
    }
}
