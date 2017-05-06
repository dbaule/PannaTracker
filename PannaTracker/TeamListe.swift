//
//  TeamListe.swift
//  PannaTracker
//
//  Created by Danny Baule on 25.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TeamListe : NSManagedObject{

    func addTeamToList(value: Team){
        let items = self.mutableSetValueForKey("team")
        items.addObject(value)
    }
    
    
    
    
    
    /**
    var teamListe : [Team]?
    
    static let sharedInstance = TeamListe()
    */
    /**
    init(){
        let helper = KaderCreateHelper()
        self.teamListe = helper.loadTeams()
    }*/
    
}