//
//  EpisodeViewController.swift
//  unit3project
//
//  Created by Tia Lendor on 9/11/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    
    var episodeDetails: Episode!
    
    @IBOutlet weak var episodeImage: UIImageView!
    
    @IBOutlet weak var episodeName: UILabel!
    
    @IBOutlet weak var episodeSeason: UILabel!
    
    @IBOutlet weak var episodeNumber: UILabel!
    
    @IBOutlet weak var episodeSummary: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        episodeName.text = episodeDetails.name.capitalized
        episodeSeason.text = "Season: \(episodeDetails.season)"
        episodeNumber.text = "Number: \(episodeDetails.number)"
        episodeSummary.text = episodeDetails.summary
//        need to return uiImage
        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
