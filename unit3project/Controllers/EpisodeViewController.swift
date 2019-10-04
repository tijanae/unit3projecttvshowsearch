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
        loadData()
        
//        need to return uiImage
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        episodeName.text = episodeDetails.name.capitalized
        episodeSeason.text = "Season: \(episodeDetails.season!)"
        episodeNumber.text = "Number: \(episodeDetails.number!)"
        episodeSummary.text = episodeDetails.updatedSummary
        
        if let url = episodeDetails.image?.original {
            ImageHelper.shared.getImage(urlStr: url) {(result) in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let imageFromOnline):
                        self.episodeImage.image = imageFromOnline
                    }
                }
            }
        }
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
