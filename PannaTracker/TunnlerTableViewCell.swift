//
//  TunnlerTableViewCell.swift
//  PannaTracker
//
//  Created by Danny Baule on 29.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import UIKit

class TunnlerTableViewCell: UITableViewCell {

    @IBOutlet weak var tunnlerLabel: UILabel!
    
    var tunnler : Tunnler! {
        didSet{
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss "
            
            let player = tunnler.wurdeGetunnelt?.name
            let playerTeam = tunnler.wurdeGetunnelt?.team?.name
            
            tunnlerLabel.text = player! + " " + playerTeam! + " " + dateFormatter.stringFromDate(tunnler.zeitpunkt!)
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
