import Foundation
import RealmSwift

final class DBViewModel: ObservableObject {
    private var savedBreathResults: Results<BreathDB>
    
    init(realm: Realm) {
        savedBreathResults = realm.objects(BreathDB.self).filter("saved = false")
    }
    
    var breath: [BreathStruct] {
        savedBreathResults.map(BreathStruct.init)
    }
}

extension DBViewModel {
    func create(amount: Int){
        objectWillChange.send()
        do {
            let realm = try Realm()
            let breathDB = BreathDB()
            breathDB.id = UUID().hashValue
            breathDB.amount = amount
            
            try realm.write {
                realm.add(breathDB)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func toggleBought(breathStruct: BreathStruct) {
        objectWillChange.send()
        
        do{
            let realm = try Realm()
            try realm.write {
                realm.create(BreathDB.self, value: ["id": breathStruct.id, "amount": breathStruct.amount], update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func update(id: Int, breathAmount: Int) {
        objectWillChange.send()
        do {
            let realm = try Realm()
            try realm.write{
                realm.create(
                    BreathDB.self, value: [
                        "id": id,
                        "amount": breathAmount], update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
  
}
