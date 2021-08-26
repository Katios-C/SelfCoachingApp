//
//  RectangleGreenView.swift
//  SelfCoachingAp
//
//  Created by Екатерина Чернова on 24.08.2021.
//

import SwiftUI

import SwiftUI

struct RectangleGreenView: View {
   
        var body: some View {
            ZStack {
            Rectangle()
                .foregroundColor(.green)
                .cornerRadius(10)
                .frame(width: 250, height: 400)
                .padding(30)
                VStack {
                    Spacer()
                Text("Шкала состояния")
                }
                .font(.title)
                .padding()
                .frame(width: 250, height: 400)
                
            }
          
        }
}
