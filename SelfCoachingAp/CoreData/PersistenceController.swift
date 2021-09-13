import CoreData
import SwiftUI


class PersistenceController: ObservableObject {
    
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CoreDataModelBreath")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
    func saveContext() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
            }
        }
    }
    
    func updateData(_ data: FetchedResults<Minutes>.Element) {
        data.amount = "Updated"
        saveContext()
    }
    
    
    func deleteData(index:Int, currentMinutes: [Minutes]) {
        container.viewContext.delete(currentMinutes[index])
        saveContext()
    }
    
    func saveNewData( fieldText: inout String) {
        let min = Minutes(context: container.viewContext)
        min.amount = fieldText
        min.date = Date()
        min.id = UUID().uuidString
        
        do {
            try self.container.viewContext.save()
            
        } catch {
            print(error)
        }
        fieldText = ""
    }
    
    func fetchMinutes(currentMinutes: inout [Minutes], minutesFetch: NSFetchRequest<NSFetchRequestResult> ) -> [Minutes] {
        let context = container.viewContext
        var minutes: [Minutes] = []
        do {
            minutes = try
                context.fetch(minutesFetch) as! [Minutes]
            currentMinutes = minutes
            
        } catch {
            print("Error : \(error)")
        }
        return minutes
    }
}

