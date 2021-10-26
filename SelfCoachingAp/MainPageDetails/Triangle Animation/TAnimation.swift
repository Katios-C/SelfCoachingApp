

import SwiftUI

let defaultTimerRemaining: CGFloat = 15
let lineWidth: CGFloat = 30
let radius: CGFloat = 70


struct TAnimation: View {
    @State private var isSpinning: Bool = true
    @State private var progress: CGFloat = 0
    @State private var isActive = false
    @State private var timeRemaining: CGFloat = defaultTimerRemaining
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
 
    private let animation = Animation.linear(duration: 1)
    
    
    var viewModel = TimerViewModel()
    
    var body: some View {
       // TimerButton(label: "Старт", buttonColor: .yellow)
       
        
       
            
           // .trim(from: 0, to: 0.5)
        
        Spacer()
        
        ZStack {
            TriangleSpokoyst()
                .fill(Color.gray.opacity(0.2))
                .rotationEffect(.degrees(-180))
                .frame(width: 300, height: 300)
        TriangleSpokoyst()
            .trim(from: 0, to:  1 - ((defaultTimerRemaining - timeRemaining) / defaultTimerRemaining))
            .stroke(Color.green, style: StrokeStyle(lineWidth: 5, lineCap: .butt))
            //.fill(Color.red)
            .frame(width: 300, height: 300)
            .rotationEffect(.degrees(-180))
            .animation(animation)
     
           
        }
        
        Spacer()
        ZStack {
        Circle()
            .stroke(Color.green, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
          
        Circle()
                .trim(from: 0, to: 1 - ((defaultTimerRemaining - timeRemaining) / defaultTimerRemaining))
                .stroke(timeRemaining > 10 ? Color.gray : timeRemaining > 5 ? Color.gray : Color.gray, style: StrokeStyle(lineWidth: lineWidth, lineCap: .butt))
            .rotationEffect(.degrees(-90))
            .animation(animation)
            
         
            VStack {
            Text("\(Int(timeRemaining))").font(.largeTitle)
            Text(breathWord())
            }
}
        .frame(width: radius * 3, height: radius * 3)
        
        Spacer()
       
                   Text("\(progress)")
                   Slider(value: $progress)
        Spacer()
        HStack(spacing: 25) {
            
            Label("\(isActive ? "Pause" : "Play")", systemImage: "\(isActive ? "pause.fill" : "play.fill")")
                .foregroundColor(isActive ? .red : .yellow)
                .font(.title)
                .onTapGesture(perform: {
                    isActive.toggle()
                    self.isSpinning.toggle()
            })
            Label("Resume", systemImage: "backward.fill")
                .foregroundColor(.black).font(.title)
                .onTapGesture(perform: {
                isActive = false
                    timeRemaining = defaultTimerRemaining
            })
            // https://www.youtube.com/watch?v=-Xy1jBgGn7E
        }.onReceive(timer, perform: { _ in
           
           // withAnimation(animation) {
            guard isActive else {return}
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
               // isActive = false
                timeRemaining = defaultTimerRemaining
            
          //  }
            }
        })

    }
    
    func breathWord() -> String {
        var returnWord = ""
        if timeRemaining >= 10 {
            returnWord = "Вдох"
        }
        else if timeRemaining <= 9 && timeRemaining > 5 {
            returnWord = "Задержка"
        }
        else {
            returnWord = "Выдох"
        }
        return returnWord
    }
}

struct TAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TAnimation()
    }
}

struct TriangleSpokoyst: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
       
        
        return path
    }
}
