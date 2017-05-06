//
//  Player+CoreDataProperties.swift
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

extension Player {

    @NSManaged var name: String?
    @NSManaged var nummer: String?
    @NSManaged var team: Team?
    @NSManaged var tunnlerWurde: NSSet?
    @NSManaged var tunnlerHat: NSSet?
    
    convenience init(name : String?, nummer: String?, team: Team?, insertIntoManagedObjectContext context: NSManagedObjectContext){
        let entity = NSEntityDescription.entityForName("Player", inManagedObjectContext: context)
        self.init(entity: entity!, insertIntoManagedObjectContext: context)
        self.name = name
        self.nummer = nummer
        self.team = team
    }

}
