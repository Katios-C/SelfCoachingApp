//
//  PhotoView.swift
//  SelfCoachingAp
//
//  Created by Екатерина Чернова on 23.08.2021.
//

import SwiftUI

struct PhotoView: View {
    var img = ""
    var body: some View {
       
        VStack {
            Image(img)
        }.frame(width: 250, height: 400)
        .cornerRadius(20)
        .shadow(radius: 20)
            
    }
    
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
