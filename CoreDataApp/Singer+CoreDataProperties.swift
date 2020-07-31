//
//  Singer+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by Oluwafemi Adenaike on 7/24/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var singer: String?

}
