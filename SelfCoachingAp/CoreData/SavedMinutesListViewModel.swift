import Foundation
import CoreData
import SwiftUI
import Combine

class SavedMinutesViewModel: ObservableObject {
    let minutesList: PassthroughSubject<Array<Minutes>, Never> = PassthroughSubject<Array<Minutes>, Never>()
    
    static let shared = SavedMinutesViewModel()
    var persisitenceController = PersistenceController()
    var currentMinutes:[Minutes] = []
    let minutesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Minutes")
    
 
    
    func saveContext() {
        persisitenceController.saveContext()
    }
    
    func updateData(_ data:FetchedResults<Minutes>.Element) {
        persisitenceController.updateData(data)
        let lists = persisitenceController.fetchMinutes(currentMinutes: &currentMinutes, minutesFetch: minutesFetch)
        minutesList.send(lists)

        self.objectWillChange.send()
    }
    
    func deleteData(index:Int) {
        persisitenceController.deleteData(index: index, currentMinutes: currentMinutes)
        let lists = persisitenceController.fetchMinutes(currentMinutes: &currentMinutes, minutesFetch: minutesFetch)
        minutesList.send(lists)

        self.objectWillChange.send()
    }
    
    func saveNewData( fieldText: inout String) {
        persisitenceController.saveNewData(fieldText: &fieldText)
        let lists = persisitenceController.fetchMinutes(currentMinutes: &currentMinutes, minutesFetch: minutesFetch)
        minutesList.send(lists)

        
        self.objectWillChange.send()
    }
    
    func fetchMinutes() -> [Minutes] {
        let lists = persisitenceController.fetchMinutes(currentMinutes: &currentMinutes, minutesFetch: minutesFetch)
        minutesList.send(lists)
        return lists
    }
    
}
