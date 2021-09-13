import RealmSwift
import Foundation

class BreathDB: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var amount = 0
   // @objc dynamic var date = Date()
    
    override static func primaryKey() -> String? {
        "id"
      }
}
