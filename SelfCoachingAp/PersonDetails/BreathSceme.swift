import SwiftUI
import iOSDevPackage

struct BreathSceme: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    let text1 = "Три эффекта дыхательной тренировки:"
    let text2 = "взбодриться"
    let text3 = "расслабиться"
    let text4 = "сбалансироваться"
    @State var isText2 = false
    @State var isText3 = false
    @State var isText4 = false
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    navigation.pop(to: .previous)
                }, label: {
                    Text("Back")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(width: UIScreen.main.bounds.width / 4)
                        .background(Color.green)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        .grayscale(2)
                }).padding(4)
                Spacer()
            }
            ScrollView {
                VStack {
                    Text(text1)
                        .fontWeight(.semibold)
                        .padding(4)
                    
                    
                    Text(text2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(width: UIScreen.main.bounds.width / 1.5)
                        .background(isText2 ? Color.gray : Color.yellow)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        .grayscale(2)
                    
                        .onTapGesture {
                            isText2.toggle()
                        }
                    
                    isText2 ? Text2()
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 2).grayscale(2)) : nil
                    
                    
                    Text(text3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(width: UIScreen.main.bounds.width / 1.5)
                        .background(isText3 ? Color.gray : Color.yellow)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        .grayscale(2)
                        .onTapGesture {
                            isText3.toggle()
                        }
                    isText3 ? Text3() .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 2).grayscale(2)) : nil
                    
                    
                    Text(text4)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .frame(width: UIScreen.main.bounds.width / 1.5)
                        .background(isText4 ? Color.gray : Color.yellow)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        .grayscale(2)
                        .onTapGesture {
                            isText4.toggle()
                        }
                    isText4 ? Text4() .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 2).grayscale(2)) : nil
                }
                .padding()
            }
        }
    }
}


