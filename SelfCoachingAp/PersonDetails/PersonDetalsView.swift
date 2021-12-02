import SwiftUI
import iOSDevPackage

struct PersonDetalsView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        ZStack {
            Image(imageForMainScreen)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        navigation.pop(to: .previous)
                    }, label: {
                        Text(back)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .frame(width: UIScreen.main.bounds.width / 4)
                            .background(Color.green)
                            .clipShape(Capsule())
                            .shadow(color: .gray, radius: 4, x: 0, y: 4)
                            .grayscale(2)
                    }).padding()
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    navigation.push(AboutTimerView())
                }, label: {
                    Text(aboutTimer)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(width: UIScreen.main.bounds.width / 1.3)
                        .background(Color.yellow)
                        .grayscale(2)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    
                }).padding()
                
                
                Button(action: {
                    navigation.push(BreathScemeView())
                }, label: {
                    Text(breathScheme)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(width: UIScreen.main.bounds.width / 1.3)
                        .background(Color.yellow)
                        .grayscale(2)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    
                }).padding()
                
                
                Button(action: {
                    navigation.push(WarningView())
                }, label: {
                    Text(warning)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(width: UIScreen.main.bounds.width / 1.3)
                        .background(Color.yellow)
                        .grayscale(2)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    
                }).padding()
                
                Button(action: {
                    navigation.push(AboutMeView())
                }, label: {
                    Text(aboutDeveloper)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(width: UIScreen.main.bounds.width / 1.3)
                        .background(Color.yellow)
                        .grayscale(2)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    
                }).padding()
                Spacer()
                
            }
        }
    }
}
