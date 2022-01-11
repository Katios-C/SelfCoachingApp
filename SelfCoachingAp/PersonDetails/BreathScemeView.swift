import SwiftUI
import iOSDevPackage

struct BreathScemeView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
        ZStack {
            
            Image(fon_4)
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
                
                VStack {
                    ZStack {
                        Image(flowerRectangle_1)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 1.2)
                            .overlay(
                                Image(relaxTitle)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width / 1.9)
                            )
                            .onTapGesture {
                                navigation.push(RelaxBreathView())
                            }
                    }
                    
                    Image(flowerRectangle_2)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 1.2)
                        .overlay(
                            Image(balanceTitleText)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width / 3.5)
                        )
                        .onTapGesture {
                            navigation.push(BalanceBreathView())
                        }
                    
                    Image(flowerRectangle_3)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 1.2)
                        .overlay(
                            Image(energyTitle)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width / 2.8)
                        )
                        .onTapGesture {
                            navigation.push(EnergyBreathView())
                        }
                }
                .padding()
                Spacer()
            }
        }
    }
}


