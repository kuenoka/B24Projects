//
//  CoreDataManager.swift
//  CustomContact
//
//  Created by Oluwafemi Adenaike on 7/28/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
  
  static let shared = CoreDataManager()
  
  private init() { }
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Contact")
    container.loadPersistentStores(completionHandler: {(storeDescriptions, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  func saveContext() {
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  
  func addNewContact(firstName: String, number: String, email: String, company: String, lastName: String) {
    let person = Person(context: context)
    person.firstName = firstName
    person.number = number
    person.lastName = lastName
    person.company = company
    person.email = email
    context.insert(person)
    saveContext()
  }
  
  func deleteContact(person: Person) {
    context.delete(person)
    saveContext()
  }
  
  func getContact() -> [Person] {
    var contacts: [Person] = []
    do {
      let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
      let sortDescriptor = NSSortDescriptor(key: "firstName", ascending: true)
      fetchRequest.sortDescriptors = [sortDescriptor]
      contacts = try context.fetch(fetchRequest)
    } catch {
      print("error")
    }
    return contacts
  }
}
