//
//  PlayerTableViewCell.swift
//  PannaTracker
//
//  Created by Danny Baule on 22.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import UIKit
import CoreData

class PlayerTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var NummerNameLabel: UILabel!
    @IBOutlet weak var GetunneltLabel: UILabel!
    @IBOutlet weak var WurdeGetunneltLabel: UILabel!
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    let fetchRequest = NSFetchRequest(entityName: "Tunnler")
    
    var player : Player!{
        didSet{
            var hatGetunneltArray : [Tunnler] = []
            var wurdeGetunneltArray : [Tunnler] = []
            
            NummerNameLabel.text = player.nummer! + " " + player.name!
            
            do{
                var fetchArrayHat = try managedContext.executeFetchRequest(fetchRequest)
                fetchArrayHat = fetchArrayHat.filter({
                    ($0 as! Tunnler).hatGetunnelt?.name == player.name
                })
                for tunnler in fetchArrayHat{
                    hatGetunneltArray.append(tunnler as! Tunnler)
                }
                var fetchArrayWurde = try managedContext.executeFetchRequest(fetchRequest)
                fetchArrayWurde = fetchArrayWurde.filter({
                    ($0 as! Tunnler).wurdeGetunnelt?.name == player.name
                })
                for tunnler in fetchArrayWurde{
                    wurdeGetunneltArray.append(tunnler as! Tunnler)
                }

            }catch{
                print("Fetch fehgeschlagen")
            }
            
            let hatGetunneltCount = hatGetunneltArray.count//player.tunnler!.filter({$0.hatGetunnelt!._name! == player._name!}).count
            let wurdeGetunneltCount = wurdeGetunneltArray.count//player.tunnler!.filter({$0.wurdeGetunnelt!._name! == player._name!}).count
            
            GetunneltLabel.text = "\(hatGetunneltCount)"
            WurdeGetunneltLabel.text = "\(wurdeGetunneltCount)"
 
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
