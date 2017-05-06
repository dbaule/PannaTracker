//
//  KaderCreateHelper.swift
//  PannaTracker
//
//  Created by Danny Baule on 25.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class KaderCreateHelper{
    
    /**
     Erstellt die Teamliste
     */
    func loadTeams() -> [Team]{
        
        var teams : [Team] = []
        
        let df : DataFormatter = DataFormatter()
        let players: NSString? = df.getData()
        
        let playersArray = players!.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        //print(playersArray)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //let entity = NSEntityDescription.entityForName("Team", inManagedObjectContext: managedContext)
        
        let albanienPhoto = UIImage(named: "Albanien")!
        let team1 = Team(name: "Albanien", kuerzel: "ALB", flagge: UIImagePNGRepresentation(albanienPhoto), insertIntoManagedObjectContext: managedContext)
        //team1.name = "Albanien"
        //team1.kuerzel = "ALB"
        //team1.flagge = UIImagePNGRepresentation(albanienPhoto)            //Team(name: "Albanien", kuerzel: "ALB", flagge: albanienPhoto)!
        //addPlayersToTeam(addPlayersToTeam(team1, von: 746, bis: 778, spielerListe: playersArray)!, team: team1)
        
        let belgienPhoto = UIImage(named: "Belgien")!
        let team2 = Team(name: "Belgien", kuerzel: "BEL", flagge: UIImagePNGRepresentation(belgienPhoto), insertIntoManagedObjectContext: managedContext)
        //team2.name = "Belgien"
        //team2.kuerzel = "BEL"
        //team2.flagge = UIImagePNGRepresentation(belgienPhoto)               //(name: "Belgien", kuerzel: "BEL", flagge: belgienPhoto)!
        //addPlayersToTeam(addPlayersToTeam(team2, von: 109, bis: 137, spielerListe: playersArray)!, team: team2)
        
        let deutschlandPhoto = UIImage(named: "Deutschland")!
        let team3 = Team(name: "Deutschland", kuerzel: "DEU", flagge: UIImagePNGRepresentation(deutschlandPhoto), insertIntoManagedObjectContext: managedContext)
        //team3.name = "Deutschland"
        //team3.kuerzel = "DEU"
        //team3.flagge = UIImagePNGRepresentation(deutschlandPhoto)
        //addPlayersToTeam(addPlayersToTeam(team3, von: 2, bis: 31, spielerListe: playersArray)!, team: team3)
        
        let englandPhoto = UIImage(named: "England")!
        let team4 = Team(name: "England", kuerzel: "ENG", flagge: UIImagePNGRepresentation(englandPhoto), insertIntoManagedObjectContext: managedContext)
        //team4.name = "England"
        //team4.kuerzel = "ENG"
        //team4.flagge = UIImagePNGRepresentation(englandPhoto)
        //addPlayersToTeam(addPlayersToTeam(team4, von: 72, bis: 103, spielerListe: playersArray)!, team: team4)
        
        let frankreichPhoto = UIImage(named: "Frankreich")!
        let team5 = Team(name: "Frankreich", kuerzel: "FRA", flagge: UIImagePNGRepresentation(frankreichPhoto), insertIntoManagedObjectContext: managedContext)
        //team5.name = "Frankreich"
        //team5.kuerzel = "FRA"
        //team5.flagge = UIImagePNGRepresentation(frankreichPhoto)
        //addPlayersToTeam(addPlayersToTeam(team5, von: 143, bis: 171, spielerListe: playersArray)!, team: team5)
        
        let irlandPhoto = UIImage(named: "Irland")!
        let team6 = Team(name: "Irland", kuerzel: "IRL", flagge: UIImagePNGRepresentation(irlandPhoto), insertIntoManagedObjectContext: managedContext)
        //team6.name = "Irland"
       // team6.kuerzel = "IRL"
        //team6.flagge = UIImagePNGRepresentation(irlandPhoto)
        //addPlayersToTeam(addPlayersToTeam(team6, von: 510, bis: 550, spielerListe: playersArray)!, team: team6)
        
        let islandPhoto = UIImage(named: "Island")!
        let team7 = Team(name: "Island", kuerzel: "ISL", flagge: UIImagePNGRepresentation(islandPhoto), insertIntoManagedObjectContext: managedContext)
        //team7.name = "Island"
        //team7.kuerzel = "ISL"
        //team7.flagge = UIImagePNGRepresentation(islandPhoto)
        //addPlayersToTeam(addPlayersToTeam(team7, von: 784, bis: 812, spielerListe: playersArray)!, team: team7)
        
        let italienPhoto = UIImage(named: "Italien")!
        let team8 = Team(name: "Italien", kuerzel: "ITA", flagge: UIImagePNGRepresentation(italienPhoto), insertIntoManagedObjectContext: managedContext)
        //team8.name = "Italien"
        //team8.kuerzel = "ITA"
        //team8.flagge = UIImagePNGRepresentation(italienPhoto)
        //addPlayersToTeam(addPlayersToTeam(team8, von: 211, bis: 242, spielerListe: playersArray)!, team: team8)
        
        let kroatienPhoto = UIImage(named: "Kroatien")!
        let team9 = Team(name: "Kroatien", kuerzel: "HRV", flagge: UIImagePNGRepresentation(kroatienPhoto), insertIntoManagedObjectContext: managedContext)
        //team9.name = "Kroatien"
        //team9.kuerzel = "HRV"
       // team9.flagge = UIImagePNGRepresentation(kroatienPhoto)
        //addPlayersToTeam(addPlayersToTeam(team9, von: 248, bis: 280, spielerListe: playersArray)!, team: team9)
        
        let nordirlandPhoto = UIImage(named: "Nordirland")!
        let team10 = Team(name: "Nordirland", kuerzel: "NIR", flagge: UIImagePNGRepresentation(nordirlandPhoto), insertIntoManagedObjectContext: managedContext)
        //team10.name = "Nordirland"
       // team10.kuerzel = "NIR"
       // team10.flagge = UIImagePNGRepresentation(nordirlandPhoto)
        //addPlayersToTeam(addPlayersToTeam(team10, von: 818, bis: 851, spielerListe: playersArray)!, team: team10)
        
        let oesterreichPhoto = UIImage(named: "Oesterreich")!
        let team11 = Team(name: "Österreich", kuerzel: "AUT", flagge: UIImagePNGRepresentation(oesterreichPhoto), insertIntoManagedObjectContext: managedContext)
        //team11.name = "Österreich"
        //team11.kuerzel = "AUT"
        //team11.flagge = UIImagePNGRepresentation(oesterreichPhoto)
        //addPlayersToTeam(addPlayersToTeam(team11, von: 438, bis: 467, spielerListe: playersArray)!, team: team11)
        
        let polenPhoto = UIImage(named: "Polen")!
        let team12 = Team(name: "Polen", kuerzel: "POL", flagge: UIImagePNGRepresentation(polenPhoto), insertIntoManagedObjectContext: managedContext)
        //team12.name = "Polen"
        //team12.kuerzel = "POL"
        //team12.flagge = UIImagePNGRepresentation(polenPhoto)
        //addPlayersToTeam(addPlayersToTeam(team12, von: 367, bis: 399, spielerListe: playersArray)!, team: team12)
        
        let portugalPhoto = UIImage(named: "Portugal")!
        let team13 = Team(name: "Portugal", kuerzel: "POR", flagge: UIImagePNGRepresentation(portugalPhoto), insertIntoManagedObjectContext: managedContext)
        //team13.name = "Portugal"
        //team13.kuerzel = "POR"
        //team13.flagge = UIImagePNGRepresentation(portugalPhoto)
        //addPlayersToTeam(addPlayersToTeam(team13, von: 177, bis: 205, spielerListe: playersArray)!, team: team13)
        
        let rumaenienPhoto = UIImage(named: "Rumaenien")!
        let team14 = Team(name: "Rumänien", kuerzel: "ROU", flagge: UIImagePNGRepresentation(rumaenienPhoto), insertIntoManagedObjectContext: managedContext)
        //team14.name = "Rumänien"
        //team14.kuerzel = "ROU"
        //team14.flagge = UIImagePNGRepresentation(rumaenienPhoto)
        //addPlayersToTeam(addPlayersToTeam(team14, von: 707, bis: 740, spielerListe: playersArray)!, team: team14)
        
        let russlandPhoto = UIImage(named: "Russland")!
        let team15 = Team(name: "Russland", kuerzel: "RUS", flagge: UIImagePNGRepresentation(russlandPhoto), insertIntoManagedObjectContext: managedContext)
        //team15.name = "Russland"
        //team15.kuerzel = "RUS"
        //team15.flagge = UIImagePNGRepresentation(russlandPhoto)
        //addPlayersToTeam(addPlayersToTeam(team15, von: 405, bis: 432, spielerListe: playersArray)!, team: team15)
        
        let schwedenPhoto = UIImage(named: "Schweden")!
        let team16 = Team(name: "Schweden", kuerzel: "SWE", flagge: UIImagePNGRepresentation(schwedenPhoto), insertIntoManagedObjectContext: managedContext)
        //team16.name = "Schweden"
        //team16.kuerzel = "SWE"
        //team16.flagge = UIImagePNGRepresentation(schwedenPhoto)
        //addPlayersToTeam(addPlayersToTeam(team16, von: 634, bis: 662, spielerListe: playersArray)!, team: team16)
        
        let schweizPhoto = UIImage(named: "Schweiz")!
        let team17 = Team(name: "Schweiz", kuerzel: "CHE", flagge: UIImagePNGRepresentation(schweizPhoto), insertIntoManagedObjectContext: managedContext)
        //team17.name = "Schweiz"
        //team17.kuerzel = "CHE"
        //team17.flagge = UIImagePNGRepresentation(schweizPhoto)
        //addPlayersToTeam(addPlayersToTeam(team17, von: 328, bis: 361, spielerListe: playersArray)!, team: team17)
        
        let slowakeiPhoto = UIImage(named: "Slowakei")!
        let team18 = Team(name: "Slowakei", kuerzel: "SVK", flagge: UIImagePNGRepresentation(slowakeiPhoto), insertIntoManagedObjectContext: managedContext)
        //team18.name = "Slowakei"
        //team18.kuerzel = "SVK"
        //team18.flagge = UIImagePNGRepresentation(slowakeiPhoto)
        //addPlayersToTeam(addPlayersToTeam(team18, von: 596, bis: 628, spielerListe: playersArray)!, team: team18)
        
        let spanienPhoto = UIImage(named: "Spanien")!
        let team19 = Team(name: "Spanien", kuerzel: "ESP", flagge: UIImagePNGRepresentation(spanienPhoto), insertIntoManagedObjectContext: managedContext)
        //team19.name = "Spanien"
        //team19.kuerzel = "ESP"
        //team19.flagge = UIImagePNGRepresentation(spanienPhoto)
        //addPlayersToTeam(addPlayersToTeam(team19, von: 36, bis: 66, spielerListe: playersArray)!, team: team19)
        
        let tschechienPhoto = UIImage(named: "Tschechien")!
        let team20 = Team(name: "Tschechien", kuerzel: "CZE", flagge: UIImagePNGRepresentation(tschechienPhoto), insertIntoManagedObjectContext: managedContext)
        //team20.name = "Tschechien"
        //team20.kuerzel = "CZE"
        //team20.flagge = UIImagePNGRepresentation(tschechienPhoto)
        //addPlayersToTeam(addPlayersToTeam(team20, von: 668, bis: 701, spielerListe: playersArray)!, team: team20)
        
        let tuerkeiPhoto = UIImage(named: "Tuerkei")!
        let team21 = Team(name: "Türkei", kuerzel: "TUR", flagge: UIImagePNGRepresentation(tuerkeiPhoto), insertIntoManagedObjectContext: managedContext)
        //team21.name = "Türkei"
        //team21.kuerzel = "TUR"
        //team21.flagge = UIImagePNGRepresentation(tuerkeiPhoto)
        //addPlayersToTeam(addPlayersToTeam(team21, von: 286, bis: 322, spielerListe: playersArray)!, team: team21)
        
        let ukrainePhoto = UIImage(named: "Ukraine")!
        let team22 = Team(name: "Ukraine", kuerzel: "UKR", flagge: UIImagePNGRepresentation(ukrainePhoto), insertIntoManagedObjectContext: managedContext)
        //team22.name = "Ukraine"
        //team22.kuerzel = "UKR"
        //team22.flagge = UIImagePNGRepresentation(ukrainePhoto)
        //addPlayersToTeam(addPlayersToTeam(team22, von: 473, bis: 504, spielerListe: playersArray)!, team: team22)
        
        let ungarnPhoto = UIImage(named: "Ungarn")!
        let team23 = Team(name: "Ungarn", kuerzel: "HUN", flagge: UIImagePNGRepresentation(ungarnPhoto), insertIntoManagedObjectContext: managedContext)
        //team23.name = "Ungarn"
        //team23.kuerzel = "HUN"
        //team23.flagge = UIImagePNGRepresentation(ungarnPhoto)
        //addPlayersToTeam(addPlayersToTeam(team23, von: 857, bis: 892, spielerListe: playersArray)!, team: team23)
        
        let walesPhoto = UIImage(named: "Wales")!
        let team24 = Team(name: "Wales", kuerzel: "WAL", flagge: UIImagePNGRepresentation(walesPhoto), insertIntoManagedObjectContext: managedContext)
        //team24.name = "Wales"
        //team24.kuerzel = "WAL"
        //team24.flagge = UIImagePNGRepresentation(walesPhoto)
        //addPlayersToTeam(addPlayersToTeam(team24, von: 556, bis: 590, spielerListe: playersArray)!, team: team24)
        
        addPlayersToTeams(playersArray)
        
        teams += [
            team1
            , team2
            , team3
            , team4
            , team5
            , team6
            , team7
            , team8
            , team9
            , team10
            , team11
            , team12
            , team13
            , team14
            , team15
            , team16
            , team17
            , team18
            , team19
            , team20
            , team21
            , team22
            , team23
            , team24]
        
        return teams
    }
    
    func addPlayersToTeams(spielerListe: [NSString]){
        
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        
        let chars = NSCharacterSet.letterCharacterSet()
        
        var teams : [Team] = []
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Team")
        
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            teams = results.filter({$0.name != "" }).map({$0 as! Team})
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        var team : Team = teams.filter({$0.name == "Deutschland"}).first!
        
        
        for spieler in spielerListe{
            
            var nummer : String
            
            var name : String
            
            
            if spieler as String != ""{
                if chars.characterIsMember(spieler.characterAtIndex(0)){
                    let a = teams.filter({($0 as Team).name == spieler as String})
                    team = a.first!
                }
                    
                else if spieler as String != "" && !(chars.characterIsMember(spieler.characterAtIndex(0))){
                    
                    
                    if digits.characterIsMember(spieler.characterAtIndex(1)) {
                        
                        var str : String = spieler as String
                        
                        let nummerindex = str.startIndex.advancedBy(1)
                        var einzelnummer = str.substringToIndex(nummerindex)
                        einzelnummer = "\(str.removeAtIndex(nummerindex))"
                        str = spieler as String
                        
                        let index = str.startIndex.advancedBy(4)
                        
                        name = str.substringFromIndex(index)
                        nummer = einzelnummer
                        
                        if digits.characterIsMember(spieler.characterAtIndex(2)){
                            
                            let nummerindex = str.startIndex.advancedBy(2)
                            let zweitenummer = "\(str.removeAtIndex(nummerindex))"
                            str = spieler as String
                            
                            let index = str.startIndex.advancedBy(5)
                            
                            name = str.substringFromIndex(index)
                            nummer += zweitenummer
                        }
                        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                        let managedContext = appDelegate.managedObjectContext
                        
                        let player : Player = Player(name: name, nummer: nummer, team: team, insertIntoManagedObjectContext: managedContext)
                        team.addPlayerToTeam(player)
                        
                    }
                }
            }
        }
    }
}
    
    /**
     Erstellt eine Spielerliste auf Grund der angegebenen Zeilen und schreibt das angegebene team zu den Spielern
     */
    /**func addPlayersToTeam(team: Team, von: Int, bis: Int, spielerListe: [NSString]) -> [NSManagedObject]?{
        
        var playerlist : [NSManagedObject] = []
        
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        
        for spieler in spielerListe[von...bis]{
            
            var nummer : String
            
            var name : String
            
            if spieler as String != ""{
                
                if digits.characterIsMember(spieler.characterAtIndex(1)) {
                    
                    var str : String = spieler as String
                    
                    let nummerindex = str.startIndex.advancedBy(1)
                    var einzelnummer = str.substringToIndex(nummerindex)
                    einzelnummer = "\(str.removeAtIndex(nummerindex))"
                    str = spieler as String
                    
                    let index = str.startIndex.advancedBy(4)
                    
                    name = str.substringFromIndex(index)
                    nummer = einzelnummer
                    
                    if digits.characterIsMember(spieler.characterAtIndex(2)){
                        
                        let nummerindex = str.startIndex.advancedBy(2)
                        let zweitenummer = "\(str.removeAtIndex(nummerindex))"
                        str = spieler as String
                        
                        let index = str.startIndex.advancedBy(5)
                        
                        name = str.substringFromIndex(index)
                        nummer += zweitenummer
                    }
                    
                } else {
                    nummer = "99"
                    name = spieler as String
                }
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                let managedContext = appDelegate.managedObjectContext
                
                let player : Player = Player(name: name, nummer: nummer, team: team, insertIntoManagedObjectContext: managedContext)
                //player.name = name
                //player.nummer = nummer
                //player.team = team
                //player.tunnler = NSSet()//Player(name: name, nummer: nummer, team: team)!
                
                playerlist.append(player)
            }
        }
        return playerlist
    }
    
    // Fügt die Spieler in die NSManagedObject Team hinzu
    func addPlayersToTeam(players : [NSManagedObject], team : Team){
        
        for player in players{
            
            team.addPlayerToTeam(player as! Player)
        }
    }*/
    
    /**
     Erstellt eine Spielerliste auf Grund der angegebenen Zeilen und schreibt das angegebene team zu den Spielern
     */
