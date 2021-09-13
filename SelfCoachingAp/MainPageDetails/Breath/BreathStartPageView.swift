//
//  BreathStartPageView.swift
//  SelfCoachingAp
//
//  Created by Екатерина Чернова on 27.08.2021.
//

import SwiftUI

struct BreathStartPageView: View {
    
    
    let textA = "Дыхание - мощный иснтрумент работы с сознанием, эмоциями и здоровьем. В зависимости от цели, можно выбрать дыхательную тренировку, которая успокоит, взбодрит, стабилизирует эмоциональное равновесие или улучшит работу легких. Листайте карусель, читайте, дышите на здоровье! Будьте внимательны, при головокружении остановите тренировку!"
    
    let textB = "Будьте внимательны, при головокружении остановите тренировку!"
    
    
    var body: some View {
        
//        ZStack {
//        Color.gray
//            .clipShape(Capsule())
//            .opacity(0.5)
//            .frame(width: UIScreen.main.bounds.width / 1.8, height: 40, alignment: .center)
//            .shadow(color: .gray, radius: 4, x: 0, y: 4)
           // HStack {
              //  Image(systemName: "shift")
                Text ("Выберите цель")
    .foregroundColor(.black)
    .fontWeight(.thin)
   // .frame(width: 150, height: 50)
 //   .background(Color.gray)
    .padding(5)
              //  Image(systemName: "shift")
           // }
//        }
        VStack {
           
                
//                Image("m2")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
              //  Color.white.opacity(0.2)
        Text (textA)
            .fontWeight(.thin)
            .padding()
//            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.pink, lineWidth: 1).shadow(color: .gray, radius: 4, x: 0, y: 4))
            .padding()
//
//        Text (textB)
////
//            .fontWeight(.thin)
//            .foregroundColor(Color.pink)
//            .opacity(0.8)
           // .padding()
            
            
        }
    }
}

struct BreathStartPageView_Previews: PreviewProvider {
    static var previews: some View {
        BreathStartPageView()
    }
}
