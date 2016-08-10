//
//  CoreDataHelper.swift
//  rest-trip
//
//  Created by Sorochinskiy Dmitriy on 01.08.16.
//  Copyright © 2016 nelex. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper:NSObject {
        //singleton
    class var instance: CoreDataHelper {
        struct Singleton {
            static let instance = CoreDataHelper()
        }
        return Singleton.instance
    }
    
    let coordinator: NSPersistentStoreCoordinator
    let model: NSManagedObjectModel
    let context: NSManagedObjectContext
    
    
    private override init() {
        let modelURL = NSBundle.mainBundle().URLForResource("Model", withExtension: "momd")!
        model = NSManagedObjectModel(contentsOfURL: modelURL)!
        
        let fileManager = NSFileManager.defaultManager()
        let docsURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).last! as NSURL
        let storeURL = docsURL.URLByAppendingPathComponent("base.sqlite")
        
        coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        if let _ = try? coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil) { print("something wrong while adding persistent store")}
    
          context = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
        super.init()
    }
    
    func save() {
        if let _ = try? context.save() {print("something wrong")}
    }
}
