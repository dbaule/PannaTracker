//
//  TeamTableViewController.swift
//  PannaTracker
//
//  Created by Danny Baule on 21.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import UIKit
import CoreData

class TeamTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var teams = [NSManagedObject]()
    var team = Team?()
    var player = Player?()
    var source : TeamListe?
    
    // MARK: Actions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Team")
        
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            teams = (results as! [NSManagedObject]).sort({
                ($0 as! Team).name?.compare(($1 as! Team).name!) == NSComparisonResult.OrderedAscending
            })
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        /**if self.parentViewController?.parentViewController?.parentViewController as? UITabBarController != nil{
            let tabbarController = self.parentViewController?.parentViewController?.parentViewController as! UITabBarController
            tabbarController.selectedIndex = 0
        }*/
        
        //let teamListe = TeamListe.sharedInstance
        
        //teams = teamListe.teamListe!
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
        
        tableView.rowHeight = 100
        
        return teams.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "TeamTableViewCell"
            
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
            as! TeamTableViewCell
            
        let team = teams[indexPath.row]//TeamListe.sharedInstance.teamListe![indexPath.row]
    
        cell.team = team as! Team
            
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
        if segue.identifier! == "zeigeKaderSegue"{
            
            let passedTeam = (sender as! TeamTableViewCell).team as Team
            
            let destinationVC = segue.destinationViewController as! PlayerTableViewController
            
            destinationVC.team = passedTeam
        }
        
        if segue.identifier! == "zeigeTunnelKaderSegue"{
            
            let passedTeam = (sender as! TeamTableViewCell).team as Team
            
            let destinationVC = segue.destinationViewController as! GetunnelterSpielerTableViewController
            
            destinationVC.team = passedTeam
            destinationVC.gespeicherterSpieler = player
            destinationVC.gespeichertesTeam = team
        
        }
        
    }
    

}
