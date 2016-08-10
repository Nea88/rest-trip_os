//
//  Appartment.swift
//  rest-trip
//
//  Created by Sorochinskiy Dmitriy on 01.08.16.
//  Copyright © 2016 nelex. All rights reserved.
//

import Foundation
import CoreData

@objc(Appartment)
class Appartment: NSManagedObject {
    
    class var entity: NSEntityDescription {
        return NSEntityDescription.entityForName("Appartment", inManagedObjectContext: CoreDataHelper.instance.context)!
    }

    convenience init() {
        self.init(entity: Appartment.entity, insertIntoManagedObjectContext: CoreDataHelper.instance.context)
    }
    
    class func allAppartments() -> [Appartment] {
        let request = NSFetchRequest(entityName: "Appartment")
        let results = try? CoreDataHelper.instance.context.executeFetchRequest(request)
        
        return results as! [Appartment]
    }
}
