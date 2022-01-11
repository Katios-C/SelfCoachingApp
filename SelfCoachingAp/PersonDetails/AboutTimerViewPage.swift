

import SwiftUI
import iOSDevPackage

struct AboutTimerViewPage: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        ZStack {
            Image(fon_2)
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
            }
            
            VStack{
                Text(aboutTimer)
                    .font(Font.custom(MazzardMFont, size: 30))
                    .foregroundColor(.white)
                    .lineSpacing(5)
                    .padding(20)
                
                VStack{
                    Image(lungs)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 14)
                        .padding()
                    Text(aboutTimerText)
                        .font(Font.custom(MazzardMFont, size: 20))
                        .foregroundColor(Color(UIColor(red: 90 / 255, green: 68 / 255, blue: 130 / 255, alpha: 1)))
                        .multilineTextAlignment(.center)
                        .lineSpacing(5)
                    
                }
                .padding()
                
                
                VStack{
                    Image(oclock)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 14)
                        .padding()
                    
                    Text(textAboutIntervals)
                        .font(Font.custom(MazzardMFont, size: 20))
                        .foregroundColor(Color(UIColor(red: 90 / 255, green: 68 / 255, blue: 130 / 255, alpha: 1)))
                        .multilineTextAlignment(.center)
                        .lineSpacing(5)
                }.padding()
                
                VStack {
                    Image("metro")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 12)
                        .padding()
                    Text(addSoundMetronome)
                        .font(Font.custom(MazzardMFont, size: 20))
                        .foregroundColor(Color(UIColor(red: 90 / 255, green: 68 / 255, blue: 130 / 255, alpha: 1)))
                        .multilineTextAlignment(.center)
                        .lineSpacing(5)
                }
                .padding()
            }
            .padding()
        }
    }
}

