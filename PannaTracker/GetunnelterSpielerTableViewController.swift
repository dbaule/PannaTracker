//
//  GetunnelterSpielerTableViewController.swift
//  PannaTracker
//
//  Created by Danny Baule on 25.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import UIKit
import CoreData

class GetunnelterSpielerTableViewController: UITableViewController {

    // MARK: Properties
    
    var team : Team?
    var gespeichertesTeam : Team?
    var gespeicherterSpieler : Player?
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
            }).sort({($0 as! Player).nummer < ($1 as! Player).nummer})
            players = fetchArray as! [Player]
            /**for player in fetchArray{
                print(player.valueForKey("name"))
            }*/
        } catch{
            print("Fetch fehlgeschlagen")
        }
        
        //let teamListe = TeamListe()
        
        //let ind = teamListe.teamListe!.indexOf({$0._name == team?._name})
        //players = teamListe.teamListe![ind!]._spielerListe!
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
        
        let cellIdentifier = "GetunnelterSpielerTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GetunnelterSpielerTableViewCell
        
        let player = players[indexPath.row]
        
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
        
        if segue.identifier! == "zeigeSpielerAuswahl"{
            
            let selectedPlayer = (sender as! GetunnelterSpielerTableViewCell).player as Player
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            
            let tunnler = Tunnler(wurdeGetunnelt: selectedPlayer, hatGetunnelt: gespeicherterSpieler, insertIntoManagedObjectContext: managedContext)
            selectedPlayer.addTunnlerWurde(tunnler)
            gespeicherterSpieler?.addTunnlerHat(tunnler)
            do{
                try managedContext.save()
            } catch{
                print("Speichern des neuen Tunnlers fehlgeschlagen")
            }
            //Tunnler(wurdeGetunnelt: selectedPlayer, hatGetunnelt: gespeicherterSpieler!)
            
            let tabBarVC = segue.destinationViewController as! UITabBarController
            
            tabBarVC.selectedIndex = 0
            
            let navigationVC = tabBarVC.selectedViewController as! UINavigationController//segue.destinationViewController as! UINavigationController
            
            let secondVC = self.storyboard?.instantiateViewControllerWithIdentifier("spielerViewController") as! PlayerTableViewController
            
            navigationVC.pushViewController(secondVC, animated: false)
            
            let destinationVC = navigationVC.viewControllers[1] as! PlayerTableViewController
            
            destinationVC.team = gespeichertesTeam
            destinationVC.tunnler = tunnler
            
        }
     }
     

}
