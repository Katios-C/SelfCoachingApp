import SwiftUI
import iOSDevPackage

struct PersonDetalsView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        ZStack {
            Image(fon_1)
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
                
                Image(rectangle_1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 1.2)
                    .overlay(
                        Image(breathScheme)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 1.9)
                    ).onTapGesture {
                        navigation.push(BreathScemeView())
                    }
                
                Image(rectangle_2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 1.2)
                    .overlay(
                        Image(about)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 3)
                    ).onTapGesture {
                        navigation.push(AboutTimerViewPage())
                    }
                
                
                Image(rectangle_2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 1.2)
                    .overlay(
                        Image(warning)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 2.2)
                    ).onTapGesture {
                        navigation.push(WarningView())
                    }
                
                
                Image(rectangle_2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 1.2)
                    .overlay(
                        Image(aboutDeveloper)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 3)
                    ).onTapGesture {
                        navigation.push(AboutMeView())
                    }
                Spacer()
                
            }
        }
    }
}
