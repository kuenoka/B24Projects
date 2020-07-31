//
//  CoreDataManager.swift
//  CoreDataApp
//
//  Created by Oluwafemi Adenaike on 7/27/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import CoreData

//singleton

class CoreDataManager {
  
  static let shared = CoreDataManager.init()
  
  private init() {
    setUptPersistentContainer()
  }
  
  var persistentContainer: NSPersistentContainer?
  
  func setUptPersistentContainer(name: String = "CoreDataApp") {
    persistentContainer = NSPersistentContainer(name: name)
    persistentContainer?.loadPersistentStores { (desc, error) in
      if error != nil {
        assertionFailure("\(error.debugDescription)")
      }
    }
  }
  
  //  lazy var persistentContainer: NSPersistentContainer = {
  //    let container = NSPersistentContainer(name: "CoreDataApp")
  //
  //    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
  //      if let error = error as NSError? {
  //        fatalError("Unresolved error \(error), \(error.userInfo)")
  //      }
  //    })
  //    return container
  //  }()
  
  func getMaintContext() -> NSManagedObjectContext {
    return persistentContainer!.viewContext
  }
  
//  func getBackgroundContext()-> NSManagedObjectContext? {
//    return persistentContainer?.newBackgroundContext()
//  }
  
  func insert(entity: NSManagedObject, moc: NSManagedObjectContext) {
    moc.insert(entity)
  }
  
  func delete(entity: NSManagedObject, moc: NSManagedObjectContext) {
    moc.delete(entity)
  }
  
  func update(entity: NSManagedObject, moc: NSManagedObjectContext) {
    
  }
  
  func getFetchRequest(entityName:String) -> NSFetchRequest<NSManagedObject> {
      return NSFetchRequest<NSManagedObject>(entityName: entityName)
  }
  
  func fetch(fetchRequest: NSFetchRequest<NSManagedObject>) -> [NSManagedObject]? {
    do {
      let arrEntities = try getMaintContext().fetch(fetchRequest)
      return arrEntities
    } catch {
      return [NSManagedObject]()
    }
  }
  
  func saveContext () {
    let context = persistentContainer?.viewContext
    
    if let context = context {
      if context.hasChanges {
          do {
              try context.save()
          } catch {
              // Replace this implementation with code to handle the error appropriately.
              // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
              let nserror = error as NSError
              fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
      }
    } else { fatalError("Unresolved error") }
  }
}


// not reusable and not dependency injectable*
//sum() {
//  a = 9
//  b = 0
//  c = a + 9
//}
