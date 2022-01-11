import SwiftUI
import iOSDevPackage

struct EnergyBreathView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        
        ZStack {
            Image(fon_5)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                
                HStack {
                    Button(action: {
                        navigation.pop(to: .previous)
                    }, label: {
                        Image(back)
                            .font(.title2)
                        
                    })
                        .padding()
                    Spacer()
                }
                .padding(.top, 20)
                
                Spacer()
                
                ZStack{
                    Rectangle()
                        .foregroundColor(Color.white)
                        .opacity(0.6)
                        .cornerRadius(18)
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 1.9)
                    
                    VStack {
                        Text(energyTitleText)
                            .font(Font.custom(MazzardMFont, size: 30))
                            .foregroundColor(Color(UIColor(red: 90 / 255, green: 68 / 255, blue: 130 / 255, alpha: 1)))
                            .lineSpacing(5)
                            .padding()
                        Text(energyText)
                            .font(Font.custom(MazzardMFont, size: 20))
                            .foregroundColor(Color(UIColor(red: 90 / 255, green: 68 / 255, blue: 130 / 255, alpha: 1)))
                            .lineSpacing(5)
                        
                            .padding()
                    }
                }
                .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 1.7)
                
                Spacer()
                HStack {
                    ZStack {
                        Image(button)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(
                                Image(startBreathText)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width / 3.5)
                            )
                        
                    }.onTapGesture {
                        navigation.push(StartPageView())
                    }
                }
                .frame(width: UIScreen.main.bounds.width / 1.6)
                .padding(.bottom, 20)
                Spacer()
            }
        }
    }
}

