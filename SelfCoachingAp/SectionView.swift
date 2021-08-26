//
//  SectionView.swift
//  SelfCoachingAp
//
//  Created by Екатерина Чернова on 23.08.2021.
//

import SwiftUI

struct SectionView: View {
    var body: some View {
        Form {
            Section(header:  Text("Дыхание").bold(), footer: Text("Сегодня вы дышали 0 минут").bold()) {
//                Button(action: {}) {
//                    Text("Дышать")
//                        .padding(5)
//                        .foregroundColor(.white)
//                        .background(Color.gray)
//                        //.cornerRadius(8)
//                }
//
//                Text("Смотреть статистику")
              
                
                Color.gray
                    .overlay(Text ("Дышать").foregroundColor(Color.yellow))
                    .cornerRadius(8)
                Color.gray
                    .overlay(Text ("Смотреть статистику").foregroundColor(Color.yellow))
                    .cornerRadius(8)
                
                Color.gray
                    .overlay(Text ("ЕЩЕ").foregroundColor(Color.yellow))
                    .cornerRadius(8)
//                Image(systemName: "info.circle")
//                .frame(maxWidth: .infinity, alignment: .trailing)
//
                    
                    //.frame(alignment: .trailing)
            }
            .listRowBackground(Image( "1")
                                .blur(radius: 3))
            
            
        }
        .background(Color.yellow)
        
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
    }
}
