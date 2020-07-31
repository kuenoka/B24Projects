//
//  Address+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by Oluwafemi Adenaike on 7/24/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var street: String?
    @NSManaged public var person: Person?

}
