import SwiftUI
import AVKit

struct CaruselView: View {
    
    @State private var scrollText = false
    
    var body: some View {
        
        ZStack {
            
//            VStack {
//                Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
//                    .ignoresSafeArea(.all)
//            }
//
//            VStack {
//
//                VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "wave-1", withExtension: "mp4")!)) {
//                    VStack {
//                        Image("pro-text")
//                            .resizable()
//                            .frame(width: 200, height: .infinity)
//                            .scaledToFit()
//                    }
//                }
//                .ignoresSafeArea(.all)
//                .frame(width: .infinity, height: 300)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    ScrollViewReader { value in
                        
                        HStack(spacing: 5) {
                            
                            ForEach(0 ..< 1) { i in
                                
                                HStack {
                                    Image("1")
                                        .foregroundColor(Color.red)
                                        .font(.subheadline)
                                        .padding(30)
                                    
                                    Image("2")
                                        .foregroundColor(Color.red)
                                        .padding(30)
                                    Image("3")
                                        .foregroundColor(Color.red)
                                        .padding(30)
//                                    Image(systemName: "info.circle")
//                                        .foregroundColor(Color.green)
//                                        .font(.largeTitle)
                             
                                   
                                }
                                .padding()
                        
                                .id(i)
                            }
                            
                        }
                       // .offset(x: scrollText ? -10000 : 20)
                        .animation(Animation.linear(duration: 300))
//                        .onAppear() {
//                            value.scrollTo(50, anchor: .trailing)
//                            scrollText.toggle()
//                        }
                    }
                }
                
                Spacer()
            }
            
        }
    }

