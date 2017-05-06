//
//  TeamTableViewCell.swift
//  PannaTracker
//
//  Created by Danny Baule on 21.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var flaggeImageView: UIImageView!
    
    var team: Team!{
        didSet{
            nameLabel.text = team.kuerzel! + " " + team.name!
            flaggeImageView.image = UIImage(data: team.flagge!)
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
