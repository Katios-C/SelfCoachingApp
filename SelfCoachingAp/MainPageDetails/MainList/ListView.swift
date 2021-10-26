// delete
import SwiftUI
import iOSDevPackage
import Firebase

struct ListView: View {
    @AppStorage("log_status") var log_Status = false
    @EnvironmentObject var UIState: UIStateModel
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    let colors: [Color] = [.gray, .green, .purple, .yellow, .orange, .pink]
 //   let titles = ["Готовые пранаямы", "Настроить интервалы", "Подробнее о типах дыхания", "Обо мне", "МОК", "МОК" ]
    
    
    
    var body: some View {
        let items = [
            RectangleView(color: .gray, title: "Готовые пранаямы", id: 0),
            RectangleView(color: .gray, title: "Настроить интервалы", id: 1),
            RectangleView(color: .gray, title: "Подробнее о типах дыхания", id: 2),
            RectangleView(color: .gray, title: "Обо мне", id: 3),
            RectangleView(color: .gray, title: "МОК", id: 4),
            RectangleView(color: .gray, title: "МОК", id: 5)
        ]
        
        let spacing: CGFloat = 16
        let widthOfHiddenCards: CGFloat = 32 /// UIScreen.main.bounds.width - 10
        let cardHeight: CGFloat = 350
        
        
        
        
        return Canvas {
            
            Carousel(
                numberOfItems: CGFloat(items.count),
                spacing: spacing,
                widthOfHiddenCards: widthOfHiddenCards
            ) {
                ForEach(items, id: \.self.id) { item in
                    
                    
                    
                    Item(
                        _id: Int(item.id),
                        spacing: spacing,
                        widthOfHiddenCards: widthOfHiddenCards,
                        cardHeight: cardHeight
                    ) {
                        Text("\(item.title)")
                            .padding()
                        
                    }
                    .foregroundColor(Color.white).font(.title)
                    .background(colors[item.id])
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 4, x: 0, y: 4)
                    .transition(AnyTransition.slide)
                    .animation(.spring())
                    .grayscale(2)
                    //   .offset(y: UIScreen.main.bounds.height / 4)
                    .onTapGesture {
                        switch item.id {
                        case 0:
                            navigation.pop(to: .previous)
//                            navigation.push(BreathView(stateObject: )
//                                                .environmentObject(BreathViewModel()))
                        case 1: navigation.push(QuestionOfDayView())
                        case 2: navigation.push(ImportentBusinessView())
                        case 3:
                            navigation.push(ScaleView())
                        case 4:
                            navigation.push(SleepView())
                        case 5:
                            navigation.push(StatisticView())
                            
                            
                        default:
                            print("default")
                        }
                        // print(item.title)
                        //  navigation.push(BreathView())
                        // navigation.push(BreathView())
                        
                        
                        
                    }
                    // .border(Color.red)
                    
                    
                }
                
                
                
            }
            
            
            
            
        }
    }
    
    struct Carousel<Items : View> : View {
        let items: Items
        let numberOfItems: CGFloat //= 8
        let spacing: CGFloat //= 16
        let widthOfHiddenCards: CGFloat //= 32
        let totalSpacing: CGFloat
        let cardWidth: CGFloat
        
        @GestureState var isDetectingLongPress = false
        
        @EnvironmentObject var UIState: UIStateModel
        
        @inlinable public init(
            numberOfItems: CGFloat,
            spacing: CGFloat,
            widthOfHiddenCards: CGFloat,
            @ViewBuilder _ items: () -> Items) {
            
            self.items = items()
            self.numberOfItems = numberOfItems
            self.spacing = spacing
            self.widthOfHiddenCards = widthOfHiddenCards
            self.totalSpacing = (numberOfItems - 1) * spacing
            self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2) //279
            
        }
        
        var body: some View {
            let totalCanvasWidth: CGFloat = (cardWidth * numberOfItems) + totalSpacing
            let xOffsetToShift = (totalCanvasWidth - UIScreen.main.bounds.width) / 2
            let leftPadding = widthOfHiddenCards + spacing
            let totalMovement = cardWidth + spacing
            
            let activeOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard))
            let nextOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard) + 1)
            
            var calcOffset = Float(activeOffset)
            
            if (calcOffset != Float(nextOffset)) {
                calcOffset = Float(activeOffset) + UIState.screenDrag
            }
            
            return HStack(alignment: .center, spacing: spacing) {
                items
            }
            .offset(x: CGFloat(calcOffset), y: 0)
            .gesture(DragGesture().updating($isDetectingLongPress) { currentState, gestureState, transaction in
                self.UIState.screenDrag = Float(currentState.translation.width)
                
            }.onEnded { value in
                self.UIState.screenDrag = 0
                
                if (value.translation.width < -50 && CGFloat(self.UIState.activeCard) < numberOfItems - 1) {
                    self.UIState.activeCard = self.UIState.activeCard + 1
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }
                
                if (value.translation.width > 50  && CGFloat(self.UIState.activeCard) > 0) {
                    self.UIState.activeCard = self.UIState.activeCard - 1
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }
            })
        }
    }
    
    struct Canvas<Content : View> : View {
        let content: Content
        @EnvironmentObject var UIState: UIStateModel
        @EnvironmentObject private var navigation: NavigationControllerViewModel
        
        @inlinable init(@ViewBuilder _ content: () -> Content) {
            self.content = content()
        }
        
        @AppStorage("log_status") var log_Status = false
        
        var body: some View {
            VStack {
                HStack {
                    Button(action: {
                        DispatchQueue.global(qos: .background).async {
                            try? Auth.auth().signOut()
                        }
                        withAnimation(.easeInOut) {
                            log_Status = false
                        }
                    }, label: {
                        Text("Log Out")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .frame(width: UIScreen.main.bounds.width / 4)
                            .background(Color.green)
                            .clipShape(Capsule())
                            .shadow(color: .gray, radius: 4, x: 0, y: 4)
                            .grayscale(2)
                    })
                    .navigationTitle("Home")
                    Spacer()
                    
                    
                    //               Image(systemName: "square.grid.3x3.fill")
                    //   Image(systemName: "line.3.horizontal.circle.fill")
                    Image(systemName: "person.crop.circle.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                        .onTapGesture {
                            navigation.push(PersonDetalsView())
                        }
                    
                    
                }
                // .border(Color.green)
                Divider()
                
                Spacer()
                content
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                // .background(Color.white.edgesIgnoringSafeArea(.all))
                //.border(Color.blue)
                
                
                Spacer()
                Divider()
                HStack {
                    ZStack {
                        
                        Color.gray
                            .clipShape(Capsule())
                            .opacity(0.5)
                            .frame(width: UIScreen.main.bounds.width / 1.8, height: 40, alignment: .center)
                            .shadow(color: .gray, radius: 4, x: 0, y: 4)
                            
                    Text("Три важные цели на год") //
                       // .clipShape(Capsule())
                        .foregroundColor(.white)
                        .fontWeight(.thin)
                       
                
                    }
                }
                .foregroundColor(.gray)
                //.border(Color.red)
                .onTapGesture {
                    navigation.push(GoalsView())
                }
            }
            .padding()
        }
    }
}

struct Item<Content: View>: View {
    @EnvironmentObject var UIState: UIStateModel
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    
    var _id: Int
    var content: Content
    
    @inlinable public init(
        _id: Int,
        spacing: CGFloat,
        widthOfHiddenCards: CGFloat,
        cardHeight: CGFloat,
        @ViewBuilder _ content: () -> Content
    ) {
        self.content = content()
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2) //279
        self.cardHeight = cardHeight
        self._id = _id
    }
    
    var body: some View {
        content
            .frame(width: cardWidth, height: _id == UIState.activeCard ? cardHeight : cardHeight - 60, alignment: .bottom)
        
    }
}

public class UIStateModel: ObservableObject {
    @Published var activeCard: Int = 0
    @Published var screenDrag: Float = 0.0
}
