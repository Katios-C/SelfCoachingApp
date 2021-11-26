
import SwiftUI

struct Text2: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
        Text("1. Вдох  длинее или равен выдоху")
        Text("2. Задержка после вдоха")
        Text("3. Выдох не длиннее вдоха")
        Text("4. Задержка после выдоха отсутствует")
        Text("Примеры: 4-4-4-0, 6-4-4-0")
        Text("Внимание! Ориентируйтесь на свои ощущения, если кружится голова - остановите тренировку")
        
        }
    }
}

struct Text3: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
        Text("1. Вдох короче выдоха")
                //.foregroundColor(Color.green)
        Text("2. Задержка после вдоха отсутствует")
        Text("3. Выдох длиннее или равен вдоху")
        Text("4. Задержка после выдоха")
        Text("Примеры: 4-0-4-4, 4-0-6-4")
                //.foregroundColor(Color.green)
        Text("Внимание! Ориентируйтесь на свои ощущения, если кружится голова - остановите тренировку")
        }
    }
}


struct Text4: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
        Text("1. Вдох равен выдоху")
               
        Text("2. Задержка после вдоха либо отсутствует либо равна задержке после выдоха")
        Text("3. Выдох равен вдоху")
        Text("4. Задержка после выдоха либо отсутствует либо равна задержке после вдоха")
        Text("Примеры: 4-4-4-4, 4-0-4-0")
        }
    }
}
