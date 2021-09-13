
import Foundation
import SwiftUI
import CoreData
import  iOSDevPackage

struct TimerView: View {
    @EnvironmentObject private var navigation: NavigationControllerViewModel
 
    @Environment(\.managedObjectContext) private var managedObjectContext
    
  //  @FetchRequest(fetchRequest: Minutes.getAllOrders()) var minutes: FetchedResults<Minutes>
    
    @ObservedObject var timerViewModelShared = TimerViewModel()
    @ObservedObject var persistenceShared =  PersistenceController()
    
    @State var text = "Вдох"
    @State var timeText = "0:00"
   
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
       
        VStack {
            HStack {
            Text(timeText)
                .foregroundColor(.green)
                .fontWeight(.heavy)
                .padding(10)
               // .background(Color.green)
                .cornerRadius(10)
               // .frame(width: 150, height: 50)
                .fixedSize()
                
                .onAppear() {
                    self.timerViewModelShared.start()
                  
                }
                .onReceive(timer) { _ in
                    timeText = timerViewModelShared.counterToMinute()
                }
            
                ZStack {
                    
                    Color.gray
                        .clipShape(RoundedRectangle(cornerSize: .zero))
                       // .opacity(0.9)
                        .frame(width: UIScreen.main.bounds.width / 1.8, height: 40, alignment: .center)
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        
                Text(text)
                    .foregroundColor(.white)
                    .fontWeight(.thin)
                .padding()
                .fixedSize()
                .onReceive(timerViewModelShared.timerForText) {_ in
                    if timerViewModelShared.secondsElapsed > 0 {
                    text = timerViewModelShared.changeText()
                }
                    else {
                        timerViewModelShared.stoptimerForText()
                    }
                
            }
                }
            
            }
                ZStack {
            if timerViewModelShared.mode == .stopped {
                           Button(action: {self.timerViewModelShared.start()}) {
                               TimerButton(label: "Start", buttonColor: .blue)
                           }
                       }
            
            if timerViewModelShared.mode == .running && timerViewModelShared.secondsElapsed > 0  {
                
                Button(action: {self.timerViewModelShared.pause()}) {
                                TimerButton(label: "Pause", buttonColor: .blue)
                   
                }
                
                        }
            
            
            if timerViewModelShared.mode == .paused {
                            Button(action: {self.timerViewModelShared.start()}) {
                                TimerButton(label: "Start", buttonColor: .blue)
                            }
                 
                        }
            if timerViewModelShared.secondsElapsed == 0 {
                Button(action: {self.timerViewModelShared.restart()
                    
                }) {
                    TimerButton(label: "Restart", buttonColor: .yellow)
                }.onReceive(timerViewModelShared.timerForText) {_ in
                    timerViewModelShared.startTextChange()
                   
                }
                
            }
                }
            VStack {
//            HStack {
//                TextField("New time", text: $fieldText) {
//
//                    UIApplication.shared.endEditing()
//                }
//                TimerButton(label: "Save", buttonColor: .green)
//                    .onTapGesture {
//                      saveNewData()
//                      //  persistenceController.saveNewData(fieldText: &fieldText)
//                    }
//
//            }
                TimerButton(label: "Переход к списку CoreDate", buttonColor: .blue)
                    .onTapGesture {
               
                        navigation.push(SavedMinutesList().environment(\.managedObjectContext, self.managedObjectContext)
                        )
                    }
//                List {
//                    ForEach(minutes, id: \.self) {
//                        min in
//                        Text(min.amount ?? "Nothing")
//                            .onTapGesture(count: 1, perform: {persistenceController.updateData(min)})
//                    }
                   
                 //  .onDelete(perform: deleteData)
                  //  .onDelete(perform: persistenceController.deleteData(offset:))
                }

                    }
                }
            }
    

    

     //   }
       
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
