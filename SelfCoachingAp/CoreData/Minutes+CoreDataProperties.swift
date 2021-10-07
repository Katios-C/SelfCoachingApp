
import Foundation
import CoreData


extension Minutes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Minutes> {
        return NSFetchRequest<Minutes>(entityName: "Minutes")
    }

    @NSManaged public var amount: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: String?

}
