//
//  TunnlerTableViewController.swift
//  PannaTracker
//
//  Created by Danny Baule on 29.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import UIKit
import CoreData

class TunnlerTableViewController: UITableViewController {

    var tunnlerListe : [Tunnler]?
    var player : Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Tunnler")
        do{
            var fetchArray = try managedContext.executeFetchRequest(fetchRequest)
            fetchArray = fetchArray.filter({
                ($0 as! Tunnler).hatGetunnelt == player
            }).sort({($0 as! Tunnler).zeitpunkt?.compare(($1 as! Tunnler).zeitpunkt!) == NSComparisonResult.OrderedDescending})
            tunnlerListe = fetchArray as? [Tunnler]
            /**for tunnler in fetchArray{
                print(tunnler.valueForKey("wurdeGetunnelt"))
            }*/
        } catch{
            print("Fetch fehlgeschlagen")
        }
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
        return (tunnlerListe?.count)!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TunnlerTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TunnlerTableViewCell
        
        let tunnler = tunnlerListe![indexPath.row]
        //team?.valueForKey("spieler")![indexPath.row] as! Player
        //TeamListe.sharedInstance.teamListe![TeamListe.sharedInstance.teamListe!.indexOf({$0._name == (team?._name)!})!]._spielerListe![indexPath.row]
        
        cell.tunnler = tunnler
        
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
        
        if segue.identifier! == "tunnlerGeloescht"{
            
            let selectedTunnler = (sender as! TunnlerTableViewCell).tunnler as Tunnler
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
        
            let playerHat = selectedTunnler.hatGetunnelt
            let playerWurde = selectedTunnler.wurdeGetunnelt
            managedContext.deleteObject(selectedTunnler)
            
            do{
                try managedContext.save()
                playerHat?.deleteTunnlerHat(selectedTunnler)
                playerWurde?.deleteTunnlerWurde(selectedTunnler)
            } catch{
                print("Speichern des neuen Tunnlers fehlgeschlagen")
            }
            
            //let destinationVC = segue.destinationViewController as! PlayerTableViewController
            //    destinationVC.team = player?.team
            //Tunnler(wurdeGetunnelt: selectedPlayer, hatGetunnelt: gespeicherterSpieler!)
            let tabBarVC = segue.destinationViewController as! UITabBarController
            
            tabBarVC.selectedIndex = 0
        
            let navigationVC = tabBarVC.selectedViewController as! UINavigationController//segue.destinationViewController as! UINavigationController
        
            let secondVC = self.storyboard?.instantiateViewControllerWithIdentifier("spielerViewController") as! PlayerTableViewController
        
            navigationVC.pushViewController(secondVC, animated: false)
        
            let destinationVC = navigationVC.viewControllers[1] as! PlayerTableViewController
        
            destinationVC.team = player!.team
            //destinationVC.tunnler = tunnler
        
        }
    }
    

}
