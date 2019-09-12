//
//  EpisodeDetailTableViewCell.swift
//  unit3project
//
//  Created by Tia Lendor on 9/11/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class ShowDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var showEpisodeImage: UIImageView!
    
    @IBOutlet weak var showEpisodeName: UILabel!
    
    @IBOutlet weak var episodeNumberAndSeason: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
