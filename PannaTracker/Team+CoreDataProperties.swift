//
//  Team+CoreDataProperties.swift
//  PannaTracker
//
//  Created by Danny Baule on 30.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Team {

    @NSManaged var name: String?
    @NSManaged var kuerzel: String?
    @NSManaged var flagge: NSData?
    @NSManaged var tunnlerHatCount: NSNumber?
    @NSManaged var tunnlerWurdeCount: NSNumber?
    @NSManaged var spieler: NSSet?
    
    convenience init(name: String?, kuerzel: String?, flagge: NSData?, insertIntoManagedObjectContext context: NSManagedObjectContext){
        let entity = NSEntityDescription.entityForName("Team", inManagedObjectContext: context)
        self.init(entity: entity!, insertIntoManagedObjectContext: context)
        self.name = name
        self.kuerzel = kuerzel
        self.flagge = flagge
    }

}
