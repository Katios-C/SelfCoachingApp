

import SwiftUI
import  iOSDevPackage

struct TopTemplateForDetalView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    var body: some View {
        VStack {
            HStack {
                //                ZStack {
                //
                //                    Color.gray
                //                        .clipShape(Capsule())
                //                        .opacity(0.5)
                //                        .frame(width: UIScreen.main.bounds.width / 1.8, height: 40, alignment: .center)
                //                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                //
                //                Text("Дыхание") //
                //                   // .clipShape(Capsule())
                //                    .foregroundColor(.white)
                //                    .fontWeight(.thin)
                //
                //
                //                }
                //            Button(action: {navigation.pop(to: .previous)}, label: {Text("Back")
                //                .fontWeight(.semibold)
                //                .foregroundColor(.white)
                //                .padding(.vertical, 12)
                //                .frame(width: UIScreen.main.bounds.width / 4)
                //                .background(Color.green)
                //                .clipShape(Capsule())
                //                .shadow(color: .gray, radius: 4, x: 0, y: 4)
                //                .grayscale(2)
                //            })
                //                Spacer()
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
            // .padding(10)
            Divider()
        }
        .padding()
    }
}

struct TemplateForDetalView_Previews: PreviewProvider {
    static var previews: some View {
        TopTemplateForDetalView()
    }
}
