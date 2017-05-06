//
//  SpielerRanglisteViewController.swift
//  PannaTracker
//
//  Created by Danny Baule on 30.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import UIKit
import CoreData

class SpielerRanglisteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    var fetchedArrayPlayer : [AnyObject]?
    var playersToShow : [Player]?
    
    var fetchedArrayTeam : [AnyObject]?
    var teamsToShow : [Team]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequestPlayer = NSFetchRequest(entityName: "Player")
        do{
            let fetchArrayPlayer = try managedContext.executeFetchRequest(fetchRequestPlayer)
            fetchedArrayPlayer = fetchArrayPlayer
            segmentControl.selectedSegmentIndex = 0
            playersToShow = fetchedArrayPlayer!.filter({
                ($0 as! Player).tunnlerHat!.count > 0
            }).map({$0 as! Player})
            playersToShow?.sortInPlace({$0.tunnlerHat?.count > $1.tunnlerHat?.count})
        } catch{
            print("Fetch der Spieler fehlgeschlagen")
        }
        
        let fetchRequestTeams = NSFetchRequest(entityName: "Team")
        do{
            let fetchArrayTeam = try managedContext.executeFetchRequest(fetchRequestTeams)
            fetchedArrayTeam = fetchArrayTeam
        } catch {
            print("Fetch der Teams fehlgeschlagen")
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentControlAction(sender: AnyObject) {
        // Spieler Hat
        if(segmentControl.selectedSegmentIndex == 0){
            playersToShow = fetchedArrayPlayer!.filter({
                ($0 as! Player).tunnlerHat!.count > 0
            }).map({
                $0 as! Player
            })
            playersToShow?.sortInPlace({$0.tunnlerHat?.count > $1.tunnlerHat?.count})
            tableView.reloadData()
        }
        // Spieler Wurde
        else if(segmentControl.selectedSegmentIndex == 1){
            playersToShow = fetchedArrayPlayer!.filter({
                ($0 as! Player).tunnlerWurde!.count > 0
            }).map({
                $0 as! Player
            })
            playersToShow?.sortInPlace({$0.tunnlerWurde?.count > $1.tunnlerWurde?.count})
            tableView.reloadData()
        }
        // Team Hat
        else if(segmentControl.selectedSegmentIndex == 2){
            var teamArray : [Team]?
            teamArray = fetchedArrayTeam?.filter({($0 as! Team).spieler!.count > 0}).map({$0 as! Team})
            
            for team in teamArray!{
                team.setTunnlerCount()
            }
            teamsToShow = fetchedArrayTeam!.filter({
                ($0 as! Team).spieler!.count > 0
            }).map({
                $0 as! Team
            })
            teamsToShow?.sortInPlace({$0.tunnlerHatCount?.integerValue > $1.tunnlerHatCount?.integerValue})
            tableView.reloadData()
        }
        //Team Wurde
        else if(segmentControl.selectedSegmentIndex == 3){
            var teamArray : [Team]?
            teamArray = fetchedArrayTeam?.filter({($0 as! Team).spieler!.count > 0}).map({$0 as! Team})
            
            for team in teamArray!{
                team.setTunnlerCount()
            }
            teamsToShow = fetchedArrayTeam!.filter({
                ($0 as! Team).spieler!.count > 0
            }).map({
                $0 as! Team
            })
            teamsToShow?.sortInPlace({$0.tunnlerWurdeCount!.integerValue > $1.tunnlerWurdeCount!.integerValue})
            tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(segmentControl.selectedSegmentIndex <= 1){
            return (playersToShow?.count)!
        }
        else{
            return 24
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "spielerHatRanglistenTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SpielerRanglisteTableViewCell
        
        cell.selectedIndex = segmentControl.selectedSegmentIndex
        
        if(segmentControl.selectedSegmentIndex <= 1){
            let player = playersToShow![indexPath.row]
            
            cell.player = player
        }
        else if(segmentControl.selectedSegmentIndex > 1){
            let team = teamsToShow![indexPath.row]
            
            cell.team = team
        }
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
