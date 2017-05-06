//
//  SpielerRanglisteTableViewCell.swift
//  PannaTracker
//
//  Created by Danny Baule on 29.05.16.
//  Copyright © 2016 Danny Baule. All rights reserved.
//

import UIKit

class SpielerRanglisteTableViewCell: UITableViewCell {

    @IBOutlet weak var spielerFlagge: UIImageView!
    @IBOutlet weak var spielerNameLabel: UILabel!
    @IBOutlet weak var spielerHatGetunneltCountLabel: UILabel!
    
    var selectedIndex : Int! = 0
    
    var player : Player!{
        didSet{
            if(selectedIndex <= 1){
                spielerFlagge.image = UIImage(data: player.team!.flagge!)
                spielerNameLabel.text = player.name
                if(selectedIndex == 0){
                    spielerHatGetunneltCountLabel.text = "\(player.tunnlerHat!.count)"
                }
                else if(selectedIndex == 1){
                    spielerHatGetunneltCountLabel.text = "\(player.tunnlerWurde!.count)"
                }
            }
        }
    }
    
    var team : Team!{
        didSet{
            if(selectedIndex > 1){
                spielerFlagge.image = UIImage(data: team.flagge!)
                spielerNameLabel.text = team.name!
                if(selectedIndex == 2){
                    spielerHatGetunneltCountLabel.text = team.tunnlerHatCount?.stringValue
                }
                else if(selectedIndex == 3){
                    spielerHatGetunneltCountLabel.text = team.tunnlerWurdeCount?.stringValue
                }
            }
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
