//
//  Stock+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by Oluwafemi Adenaike on 7/24/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//
//

import Foundation
import CoreData


extension Stock {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stock> {
        return NSFetchRequest<Stock>(entityName: "Stock")
    }

    @NSManaged public var price: Float
    @NSManaged public var symbol: String?

}
