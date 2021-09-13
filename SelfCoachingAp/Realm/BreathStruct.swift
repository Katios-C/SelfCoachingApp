struct BreathStruct: Identifiable {
    let id: Int
    let amount: Int
  //  let date: Int
}


// MARK: Convenience init
extension BreathStruct {
    init(breathDB: BreathDB) {
        id = breathDB.id
        amount = breathDB.amount
      //  date = Int(breathDB.date)
       
  }
}
