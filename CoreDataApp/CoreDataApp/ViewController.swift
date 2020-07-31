//
//  ViewController.swift
//  CoreDataApp
//
//  Created by Oluwafemi Adenaike on 7/23/20.
//  Copyright © 2020 Oluwafemi Adenaike. All rights reserved.
//

import UIKit
import CoreData
import Firebase

class ViewController: UIViewController, UITableViewDelegate {
  
  @IBOutlet weak var tblView: UITableView!
  //var dataSource = [Person]()
  
  lazy var fetchedResultsController: NSFetchedResultsController<Person> = {
    // Initialize Fetch Request
    //let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    /*Before you can do anything with Core Data, you need a managed object context. */
    //let managedContext = appDelegate.persistentContainer.viewContext
    let managedContext = CoreDataManager.shared.getMaintContext()
    
    /*As the name suggests, NSFetchRequest is the class responsible for fetching from Core Data.
     
     Initializing a fetch request with init(entityName:), fetches all objects of a particular entity. This is what you do here to fetch all Person entities.
     */
    let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
    
    // Add Sort Descriptors
    let sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    // Initialize Fetched Results Controller
    let fetchedResultsController = NSFetchedResultsController<Person>(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
    
    // Configure Fetched Results Controller
    fetchedResultsController.delegate = self
    
    return fetchedResultsController
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //fatalError()
    fetchData()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    Analytics.setScreenName("Home Screen", screenClass: "ViewController")
  }
  
  @IBAction func openDetail(_ sender: UIButton) {
    let st = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
    //vc.delegate = self
    present(vc, animated: true, completion: nil)
  }
  
  //  func didCompleteSavingData() {
  //    fetchData()
  //  }
  
  func fetchData() {
    //    let fetchRequest = NSFetchRequest<Person>.init(entityName: "Person")
    //    do {
    //      let result = try AppDelegate.appD.getViewContext().fetch(fetchRequest)
    //      dataSource = result
    //      tblView.reloadData()
    //    } catch {
    //
    //    }
    
    do {
      try fetchedResultsController.performFetch()
    } catch {
      print(error)
    }
    
  }
  
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let sections = fetchedResultsController.sections else {
      return 0
    }
    
    /*get number of rows count for each section*/
    let sectionInfo = sections[section]
    return sectionInfo.numberOfObjects
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    
    configureCell(cell!, at: indexPath)
    return cell ?? UITableViewCell()
  }
  
  func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
    
    /*get managed object*/
    let person = fetchedResultsController.object(at: indexPath)
    // Configure Cell
    cell.textLabel?.text = person.name
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = CoreDataManager.shared.getMaintContext()
    
    if editingStyle == .delete {
      let person = fetchedResultsController.object(at: indexPath)
      //context.delete(person)
      CoreDataManager.shared.delete(entity: person, moc: context)
      CoreDataManager.shared.saveContext()
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let person = fetchedResultsController.object(at: indexPath)
    let st = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = st.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
    vc.person = person
    present(vc, animated: true, completion: nil)
  }
}

extension ViewController: NSFetchedResultsControllerDelegate {
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    print("A. NSFetchResultController controllerWillChangeContent :)")
    tblView.beginUpdates()
  }
  
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    
    print("B. NSFetchResultController didChange NSFetchedResultsChangeType \(type.rawValue):)")
    
    switch (type) {
    case .insert:
      if let indexPath = newIndexPath {
        tblView.insertRows(at: [indexPath], with: .fade)
      }
      break;
    case .delete:
      if let indexPath = indexPath {
        tblView.deleteRows(at: [indexPath], with: .fade)
      }
      break;
    case .update:
      if let indexPath = indexPath, let cell = tblView.cellForRow(at: indexPath) {
        configureCell(cell, at: indexPath)
      }
      break;
      
    case .move:
      if let indexPath = indexPath {
        tblView.deleteRows(at: [indexPath], with: .fade)
      }
      
      if let newIndexPath = newIndexPath {
        tblView.insertRows(at: [newIndexPath], with: .fade)
      }
      break;
      
    }
  }
  
  /*The last delegate call*/
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    /*finally balance beginUpdates with endupdates*/
    tblView.endUpdates()
  }
}
