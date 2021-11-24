

import SwiftUI
import  iOSDevPackage

struct TopTemplateForDetalView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    var body: some View {
        VStack {
            HStack {
                
                Image(systemName: "xmark.circle")
                    .font(.title)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        navigation.pop(to: .previous)
                    }
                Spacer()
                
                Image(systemName: "person.crop.circle.fill")
                    .font(.title)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        navigation.push(PersonDetalsView())
                    }
                
            }
        
            Divider()
        }
        .padding()
    }
}

