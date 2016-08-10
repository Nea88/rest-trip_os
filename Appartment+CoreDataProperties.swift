//
//  Appartment+CoreDataProperties.swift
//  rest-trip
//
//  Created by Sorochinskiy Dmitriy on 01.08.16.
//  Copyright © 2016 nelex. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Appartment {

    @NSManaged var adress: String?
    @NSManaged var thumb: String?
    @NSManaged var price: Int16
    @NSManaged var city: Cities?

}
