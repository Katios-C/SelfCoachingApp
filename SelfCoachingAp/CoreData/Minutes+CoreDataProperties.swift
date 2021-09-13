//
//  Minutes+CoreDataProperties.swift
//  
//
//  Created by Екатерина Чернова on 10.09.2021.
//
//

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
