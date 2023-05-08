//
//  DataController.swift
//  becky
//
//  Created by Paraptughessa Premaswari on 06/05/23.
//

import Foundation
import CoreData

//class DataController: ObservableObject {
//    let container = NSPersistentContainer(name: "Becky")
//
//    init() {
//        container.loadPersistentStores{
//            description, error in if let error = error {
//                print("Core Data failed to load: \(error.localizedDescription)")
//            }
//        }
//    }
//}

struct DataController {
    static let shared = DataController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Becky")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Error loading persistent stores: \(error.localizedDescription)")
            }
        }
        
        print("cek")
    }
    
//    func save() {
//        let context = container.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//                print("saved")
//            } catch {
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}
