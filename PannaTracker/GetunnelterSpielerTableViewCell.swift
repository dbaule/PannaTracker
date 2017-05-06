//
//  GetunnelterSpielerTableViewCell.swift
//  PannaTracker
//
//  Created by Danny Baule on 25.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import UIKit

class GetunnelterSpielerTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    // das Namen Label
    
    var player : Player!{
        didSet{
            nameLabel.text = player.nummer! + " " + player.name!
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
