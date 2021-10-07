import SwiftUI
import CoreData
import Resolver

struct SavedMinutesList: View {
  //  @ObservedObject var viewModel = SavedMinutesViewModel.shared
    @State var fieldText = ""
    
    @InjectedObject var viewModel: SavedMinutesViewModel
    
    var body: some View {
        VStack {
            TopTemplateForDetalView()
            Spacer()
            HStack {
                TextField("New string", text: $fieldText, onCommit:  {
                    UIApplication.shared.endEditing()
                })
                TimerButton(label: "Save", buttonColor: .green)
                    .onTapGesture {
                        viewModel.saveNewData(fieldText: &fieldText)
                    }
                
            }.background(Color.orange.opacity(0.3))
            Text("\(viewModel.fetchMinutes().count)")
            
            List {
                ForEach(viewModel.fetchMinutes(), id: \.self) { min in
                    
                    Text(min.amount ?? "Something")
                        .onTapGesture(count: 1, perform: {viewModel.updateData(min)})
                }
                .onDelete { index in
                    viewModel.deleteData(index: index.first!)
                }
            }
            
            Spacer()
        }
        .onAppear{
            viewModel.fetchMinutes()
        }
    }
}




