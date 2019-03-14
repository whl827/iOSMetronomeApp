//
//  SongListTableViewCell.swift
//  libPdMetronomeSwift
//
//  Created by Woong Hee Lee on 3/13/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved.
//

import UIKit

class SongListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songBpm: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
