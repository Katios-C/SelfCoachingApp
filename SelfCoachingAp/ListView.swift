
import SwiftUI
import iOSDevPackage
import Firebase

struct ListView: View {
@AppStorage("log_status") var log_Status = false
    @EnvironmentObject var UIState: UIStateModel
    
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    
    let colors: [Color] = [.gray, .green, .purple, .yellow, .orange, .pink]
    let titles = ["Дыхание", "Вопрос дня", "Важное дело", "Шкала состояния", "Сон", "Статистика" ]
   
   
    
    var body: some View {
        let items = [
            RectangleView(color: .gray, title: "Дыхание", id: 0),
            RectangleView(color: .gray, title: "Вопрос дня", id: 1),
            RectangleView(color: .gray, title: "Важное дело", id: 2),
            RectangleView(color: .gray, title: "Шкала состояния", id: 3),
            RectangleView(color: .gray, title: "Сон", id: 4),
            RectangleView(color: .gray, title: "Статистика", id: 5)
                ]
        
        let spacing: CGFloat = 16
                let widthOfHiddenCards: CGFloat = 32 /// UIScreen.main.bounds.width - 10
                let cardHeight: CGFloat = 350
        
        

            
        return Canvas {
            
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
                        .background(Color.pink)
                        .clipShape(Capsule())
                })
                .navigationTitle("Home")
                          Spacer()
          
          
          //               Image(systemName: "square.grid.3x3.fill")
                      //   Image(systemName: "line.3.horizontal.circle.fill")
                          Image(systemName: "person.crop.circle.fill")
                          //.background(Color.blue)
                          .font(.title)
          
          
                      }
                      .foregroundColor(.gray)
                      Divider()
            
            Spacer()
            /// TODO: find a way to avoid passing same arguments to Carousel and Item
         
            
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
                    .onTapGesture {
                        print(item.title)
                       // navigation.push(BreathView())
                    }
                    
                    
                }
               
              
            
            }
            Spacer()
            Divider()
                       HStack {
           
                           Text("Цель на год в два слова") //
           
                       }
                       .foregroundColor(.gray)
        }
        .padding()
       

   
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
    
    @inlinable init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.white.edgesIgnoringSafeArea(.all))
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
