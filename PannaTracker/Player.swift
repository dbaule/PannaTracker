//
//  Player.swift
//  PannaTracker
//
//  Created by Danny Baule on 21.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import Foundation
import CoreData


/**
 Ein Spieler
 */
class Player : NSManagedObject {
    
    func addTunnlerWurde(value : Tunnler){
        let items = self.mutableSetValueForKey("tunnlerWurde")
        items.addObject(value)
    }
    
    func deleteTunnlerWurde(value: Tunnler){
        let items = self.mutableSetValueForKey("tunnlerWurde")
        items.removeObject(value)
    }
    
    func addTunnlerHat(value : Tunnler){
        let items = self.mutableSetValueForKey("tunnlerHat")
        items.addObject(value)
    }
    
    func deleteTunnlerHat(value : Tunnler){
        let items = self.mutableSetValueForKey("tunnlerHat")
        items.removeObject(value)
    }
    
    
    
    
    
    
    /**
    // MARK: Properties
    
    // der Name des Spielers
    var _name : String?
    
    // die Rückennummer des Spielers
    var _nummer : String?
    
    // speichert die Tunnler an denen
    var tunnlerListe : [Tunnler]? = []
    
    // das Team zu dem der Spieler gehört
    var _team : Team?
    */
    /**
    // MARK: Initialization
    init(){}
    init?(name: String, nummer: String, team: Team){
        
        self.name = name
        self.nummer = nummer
        self.team = team
        
        //TODO: Team überprüfen
        if name.isEmpty || nummer.isEmpty {
            return nil
        }
    }*/
}