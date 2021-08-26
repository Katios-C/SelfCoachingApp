//
//  MainEmptyPage.swift
//  SelfCoachingAp
//
//  Created by Екатерина Чернова on 23.08.2021.
//

import SwiftUI

struct MainEmptyPage: View {
    var body: some View {
        VStack(spacing: 20) {
//            HStack {
//                Text("Setting") // onboarding
//                Spacer()
//                Text("Дата")
//            }
//            .foregroundColor(.gray)
//            Divider()
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(.orange)
             SectionView()
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(.orange)
//
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(.orange)
//
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(.orange)
//
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(.orange)
//            Divider()
//            HStack {
//                Text("Что то") //
//                Spacer()
//                Text("И что то")
//            }
//            .foregroundColor(.gray)
                    }
        //.background(Color.pink)
        .padding(20)
        .frame(width: 300, height: 450)
        .cornerRadius(20)
        
       
        
    }
    
    
}

struct MainEmptyPage_Previews: PreviewProvider {
    static var previews: some View {
        MainEmptyPage()
    }
}
