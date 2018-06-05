//
//  CoreDataManager.swift
//  JBBApp
//
//  Created by Александр Филимонов on 05.06.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataProtocol {
    func save(context: NSManagedObjectContext) throws
}

class CoreDataManager: CoreDataProtocol {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                assertionFailure("Unresolved error \(error.userInfo)")
            }
        })
        return container
    }()
    
    func save(context: NSManagedObjectContext) throws {
        if context.hasChanges {
            try context.save()
        }
    }
    
}
