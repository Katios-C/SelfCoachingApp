import Foundation
import CoreData
import SwiftUI

class SavedMinutesViewModel: ObservableObject {
    
    
    static let shared = SavedMinutesViewModel()
    var persisitenceController = PersistenceController()
    var currentMinutes:[Minutes] = []
    let minutesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Minutes")
    
    
  //  let container: NSPersistentContainer
    
//    init(inMemory: Bool = false) {
//        container = NSPersistentContainer(name: "CoreDataModelBreath")
//        
//        if inMemory {
//            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
//        }
//        
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                fatalError("Error: \(error.localizedDescription)")
//            }
//        }
//    }
    
    func saveContext() {
        persisitenceController.saveContext()
    }
    
    func updateData(_ data:FetchedResults<Minutes>.Element) {
        persisitenceController.updateData(data)
        self.objectWillChange.send()
    }
    
    func deleteData(index:Int) {
        persisitenceController.deleteData(index: index, currentMinutes: currentMinutes)
        self.objectWillChange.send()
    }
    
    func saveNewData( fieldText: inout String) {
        persisitenceController.saveNewData(fieldText: &fieldText)
        self.objectWillChange.send()
    }
    
    func fetchMinutes() -> [Minutes] {
        persisitenceController.fetchMinutes(currentMinutes: &currentMinutes, minutesFetch: minutesFetch)
    }
    
}
