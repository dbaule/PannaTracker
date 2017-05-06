//
//  Team.swift
//  PannaTracker
//
//  Created by Danny Baule on 21.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import Foundation
import UIKit
import CoreData

/**
 Ein Team
 */
class Team : NSManagedObject {
    
    func addPlayerToTeam(value : Player){
        let items = self.mutableSetValueForKey("spieler")
        items.addObject(value)
    }
    
    func setTunnlerCount(){
        let spielerListe = self.spieler
        var tunnlerCountHat : Int = 0
        var tunnlerCountWurde : Int = 0
        
        for spieler in spielerListe!{
            
            tunnlerCountHat += ((spieler as! Player).tunnlerHat?.count)!
            tunnlerCountWurde += ((spieler as! Player).tunnlerWurde?.count)!
        }
        self.tunnlerHatCount = tunnlerCountHat
        self.tunnlerWurdeCount = tunnlerCountWurde
    }
    
    
    
    
    
    
    
    /**
    // MARK: Properties
    
    // der Name des Teams
    var _name : String?
    
    // das Kürzel des Teams
    var _kuerzel : String?
    
    // die Flagge des Teams
    var _flagge : UIImage?
    
    // die Spieler, die dem Team angehören
    var _spielerListe : [Player]?
    */
    /**
    // MARK: Initialization
    init(){}
    init?(name: String, kuerzel: String, flagge: UIImage){
        
        self.name = name
        self.kuerzel = kuerzel
        self.flagge = flagge
        self.spielerListe = []
        
        if name.isEmpty || kuerzel.isEmpty{
            return nil
        }
    }*/
}