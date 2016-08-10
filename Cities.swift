//
//  Cities.swift
//  rest-trip
//
//  Created by Sorochinskiy Dmitriy on 01.08.16.
//  Copyright © 2016 nelex. All rights reserved.
//

import Foundation
import CoreData

@objc(Cities)
class Cities: NSManagedObject {

    class var entity: NSEntityDescription {
        return NSEntityDescription.entityForName("Cities", inManagedObjectContext: CoreDataHelper.instance.context)!
    }
    
    convenience init() {
        self.init(entity: Cities.entity, insertIntoManagedObjectContext: CoreDataHelper.instance.context)
    }
    
    class func allAppartments() -> [Cities] {
        let request = NSFetchRequest(entityName: "Cities")
        let results = try? CoreDataHelper.instance.context.executeFetchRequest(request)
        
        return results as! [Cities]
    }
}
