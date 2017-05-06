//
//  DataFormatter.swift
//  PannaTracker
//
//  Created by Danny Baule on 22.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import Foundation

class DataFormatter{
    
    // Der File Name
    let file = "Kader.txt"
    
    // Der Pfad zu dem in XCode hinterlegten File
    let bundlePath = NSBundle.mainBundle().pathForResource("Kader", ofType: ".txt")
    
    // Holt den DocumentDirectoryPfad in den geschrieben werden soll
    func getDocumentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func getData() -> NSString?{
        
        // der FileManager
        let fileManager = NSFileManager.defaultManager()
        
        // der DocumentDirectoryPfad
        let dir = getDocumentsDirectory()
        
        // der Pfad des Files aus dem DocumentDirectory mit der file Benamung
        let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(file)
        
        // path als String
        let pathString = path.path
        
        /**do{
            try fileManager.removeItemAtPath(pathString!)
        } catch {
            print("Löschen fehlgeschlagen")
        }*/
        
        // Kopiert aus dem FileManager den File vom Pfad bundlePath zu pathString in das DocumentDirectory, insofern die Datei nicht schon vorhanden ist
        if fileManager.fileExistsAtPath(bundlePath!) {
            do{
                try fileManager.copyItemAtPath(bundlePath!, toPath: pathString!)
            } catch{
                print(error)
            }
        }
        
        // der Inhalt
        let contents: NSString?
        
        do {
            // Read an entire text file into an NSString.
            contents = try NSString(contentsOfFile: path.path!,
                                        encoding: NSUTF8StringEncoding)
            
             //Print all lines.
            contents!.enumerateLinesUsingBlock({ (line, stop) -> () in
                print("Line = \(line)")
            })
        } catch _ {
            contents = nil
        }
        
        return contents
    }
    
}