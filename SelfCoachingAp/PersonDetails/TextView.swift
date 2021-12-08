
import SwiftUI

struct InhaleTextView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
        Text(inhaleTextOne)
        Text(inhaleTextTwo)
        Text(inhaleTextThree)
        Text(inhaleTextFour)
        Text(inhaleExample)
        Text(warningText)
        }
    }
}

struct ExhaleTextView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
        Text(exhaleTextOne)
        Text(exhaleTextTwo)
        Text(exhaleTextThree)
        Text(exhaleTextFour)
        Text(exhaleExample)
        Text(warningText)
        }
    }
}


struct EqualBreathView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
        Text(equalViewTextOne)
        Text(equalViewTextTwo)
        Text(equalViewTextThree)
        Text(equalViewTextFour)
        Text(equalViewTextExample)
        }
    }
}
