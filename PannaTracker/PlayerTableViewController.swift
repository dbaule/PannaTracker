//
//  PlayerTableViewController.swift
//  PannaTracker
//
//  Created by Danny Baule on 22.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import UIKit
import CoreData

class PlayerTableViewController: UITableViewController {

    // MARK: Properties
    
    var team : Team?
    var player : Player?
    var tunnler : Tunnler?
    var players = [Player]()
    
    // MARK: Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Player")
        do{
            var fetchArray = try managedContext.executeFetchRequest(fetchRequest)
            fetchArray = fetchArray.filter({
                $0.team == team
            }).sort({($0 as! Player).nummer?.compare(($1 as! Player).nummer!) == NSComparisonResult.OrderedAscending })
            players = fetchArray as! [Player]
            /**for player in fetchArray{
                print(player.valueForKey("name"))
            }*/
        } catch{
            print("Fetch fehlgeschlagen")
        }
        
        
        //players = team?.valueForKey("spieler") as! [Player]        //let teamListe = TeamListe.sharedInstance
        
        /**let ind = teamListe.teamListe!.indexOf({$0._name == team?._name})
        players = teamListe.teamListe![ind!]._spielerListe!
        
        if tunnler != nil{
            
            // Hinzufügen des Tunnlers bei Spieler der Getunnelt hat
            TeamListe.sharedInstance.teamListe![ind!]._spielerListe![players.indexOf({$0._name==tunnler!.hatGetunnelt!._name!})!].tunnlerListe!.append(tunnler!)
            
            // Hinzufügen des Tunnlers bei Spieler der getunnelt wurde
            let anderesTeam = tunnler?.wurdeGetunnelt!.team
            let anderesTeamIndex = teamListe.teamListe!.indexOf({$0._name == anderesTeam?._name})
            let anderesTeamPlayers = teamListe.teamListe![anderesTeamIndex!]._spielerListe
            
            TeamListe.sharedInstance.teamListe![anderesTeamIndex!]._spielerListe![anderesTeamPlayers!.indexOf({$0._name! == tunnler!.wurdeGetunnelt!._name!})!].tunnlerListe!.append(tunnler!)
 
        }*/
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PlayerTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PlayerTableViewCell

        let player = players[indexPath.row]
        //team?.valueForKey("spieler")![indexPath.row] as! Player
        //TeamListe.sharedInstance.teamListe![TeamListe.sharedInstance.teamListe!.indexOf({$0._name == (team?._name)!})!]._spielerListe![indexPath.row]
        
        cell.player = player

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier! == "zeigeSpielerSuche"{
            
            let passedTeam = team!
            var passedPlayer : Player?
            
            if let button = sender as? UIButton {
                let cell = button.superview?.superview?.superview as! PlayerTableViewCell
                passedPlayer = cell.player
            }
                        
            let navigationVC = segue.destinationViewController as! UINavigationController
            let destinationVC = navigationVC.viewControllers[0] as! TeamTableViewController
            
            destinationVC.team = passedTeam
            destinationVC.player = passedPlayer
            
        }
        if segue.identifier! == "zeigeTunnlerliste"{
            var passedPlayer : Player?
            
            if let button = sender as? UIButton {
                let cell = button.superview?.superview?.superview as! PlayerTableViewCell
                passedPlayer = cell.player
            }
            
            //let navigationVC = segue.destinationViewController as! UINavigationController
            let destinationVC = segue.destinationViewController as! TunnlerTableViewController
            //navigationVC.viewControllers[0] as! TunnlerTableViewController
            
            destinationVC.player = passedPlayer

        }
    }
    

}
