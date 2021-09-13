
import Foundation
import CoreData


public class Minutes: NSManagedObject {

}


extension Minutes {
    static func getAllOrders() -> NSFetchRequest<Minutes> {
        let request: NSFetchRequest<Minutes> = Minutes.fetchRequest()
            
            //as! NSFetchRequest<Minutes>
        
        let sortDescriptor = NSSortDescriptor(key: "amount", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
