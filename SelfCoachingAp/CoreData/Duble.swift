//import CoreData
//import SwiftUI
//
//
//class PersistenceController: ObservableObject {
//    
//    @Published var someVar: Int = 1
//    
//    @FetchRequest(fetchRequest: Minutes.getAllOrders()) var minutes: FetchedResults<Minutes>
////    @Environment(\.managedObjectContext) private var managedObjectContext
//    
//    private var currentMinutes:[Minutes] = []
//    
//    let minutesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Minutes")
//    
//    static let shared = PersistenceController()
//    let container: NSPersistentContainer
//
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
//    
//    
//    
//   
//    func getMins() {
//        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Minutes")
//        try! container.viewContext.fetch(req)
//    }
//    
//    func saveContext() {
//        let context = container.viewContext
//
//        if context.hasChanges {
//            do {
//                try context.save()
//                someVar += 1
//            } catch {
//                // Show some error here
//            }
//        }
//    }
//    
//    func updateData(_ data: FetchedResults<Minutes>.Element) {
//        data.amount = "Updated"
//        saveContext()
//    }
//    
//    
//    func deleteData(index:Int) {
//        container.viewContext.delete(currentMinutes[index])
//        saveContext()
//    }
//    
////    func deleteData_(offset: IndexSet) {
////        offset.map{minutesFetch[$0].
////
////        }
//    //}
//    
//    
//    func saveNewData( fieldText: inout String) {
//        let min = Minutes(context: container.viewContext)
//        min.amount = fieldText
//        min.date = Date()
//        min.id = UUID().uuidString
//
//        do {
//            try self.container.viewContext.save()
//        } catch {
//            print(error)
//        }
//
//        fieldText = ""
//    }
//    
//    func fetchMinutes() -> [Minutes] {
//        let context = container.viewContext
//        var minutes: [Minutes] = []
//        do {
//            minutes = try
//                context.fetch(minutesFetch) as! [Minutes]
//            currentMinutes = minutes
//            
//        } catch {
//            //fatalError("Failed to fetch employees: \(error)")
//            print("Error : \(error)")
//        }
//        return minutes
//    }
//    
//}
//
