//
//  Tunnler+CoreDataProperties.swift
//  PannaTracker
//
//  Created by Danny Baule on 26.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Tunnler {

    @NSManaged var zeitpunkt: NSDate?
    @NSManaged var wurdeGetunnelt: Player?
    @NSManaged var hatGetunnelt: Player?
    
    convenience init(wurdeGetunnelt : Player?, hatGetunnelt : Player?, insertIntoManagedObjectContext context : NSManagedObjectContext){
        let entity = NSEntityDescription.entityForName("Tunnler", inManagedObjectContext: context)
        self.init(entity: entity!, insertIntoManagedObjectContext: context)
        self.wurdeGetunnelt = wurdeGetunnelt
        self.hatGetunnelt = hatGetunnelt
        self.zeitpunkt = NSDate()
    }

}
