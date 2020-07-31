//
//  Person+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by Oluwafemi Adenaike on 7/24/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var hobby: String?
    @NSManaged public var name: String?
    @NSManaged public var address: Address?

}
