import SwiftUI
import iOSDevPackage

struct AboutTimerView: View {
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    var body: some View {
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
            
          Text(aboutTimer)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .frame(width: UIScreen.main.bounds.width / 3)
                .background(Color.red)
                .clipShape(Capsule())
                .shadow(color: .gray, radius: 4, x: 0, y: 4)
                .grayscale(2)

            VStack(alignment: .leading, spacing: 6) {
          
                HStack {
                    Image(systemName: lungs).resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .shadow(color: .green, radius: 4, x: 0, y: 4)
                 Text(aboutTimerText)
                    .padding(4)
                }
                
                HStack {
                  
                    Image(systemName: circleGridCross ).resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .shadow(color: .green, radius: 4, x: 0, y: 4)
                Text(textAboutIntervals)
                    .padding(4)
                                    }
                HStack {
                    HStack {
                        Image(systemName: metronom).resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                            .shadow(color: .green, radius: 4, x: 0, y: 4)
                Text(addSoundMetronome)
                    .padding(4)
                }
                }
            }
            Spacer()
        }
    }
}

