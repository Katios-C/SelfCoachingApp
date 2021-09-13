////
////  ProgressCircle.swift
////  SelfCoachingAp
////
////  Created by Екатерина Чернова on 30.08.2021.
////
//
//import SwiftUI
//
//let timer = Timer
//    .publish(every: 1, on: .main, in: .common)
//    .autoconnect()
//
//struct ProgressCircle: View {
//
//   @State var counter: Int = 0
//    var countTo: Int = 5
//
//    var body: some View {
//        VStack {
//            ZStack {
//                Circle()
//                    .fill(Color.clear)
//                    .frame(width: 100, height: 100)
//                    .overlay( Circle().stroke(Color.gray, lineWidth: 25)
//                    )
//
//                Circle()
//                    .fill(Color.clear)
//                    .frame(width: 100, height: 100)
//                    .overlay( Circle().trim(from: 0, to: progress())
//                                .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
//                                .foregroundColor(completed() ? Color.green : Color.orange)
//                    ).animation(.easeOut(duration: 1.1))
//
//                ClockCircle(counter: counter, countTo: countTo)
//                  //  .frame(width: 100, height: 100)
//            }
//            .onReceive(timer) {time in
//                if (self.counter < self.countTo) {
//                    self.counter += 1
//                }
//
//            }
//        }
//    }
//
//    func completed() -> Bool {
//        return progress() == 1
//    }
//
//    func progress() -> CGFloat {
//        return(CGFloat(counter) / CGFloat(countTo))
//    }
//
//}
//
////struct ClockCircle: View {
////    var counter: Int
////    var countTo: Int
////
////
////    var body: some View {
////        VStack{
////            Text("\(counterToMinutes())")
////                .font(.system(size: 20))
////                .fontWeight(.black)
////        }
////    }
////
////    func counterToMinutes() -> String {
////        let currentTime = countTo - counter
////        let seconds = currentTime % 60
////        let minutes = Int(currentTime / 60)
////
////        return "\( minutes):\(seconds < 10 ? "0" : "")\(seconds)"
////    }
////}
