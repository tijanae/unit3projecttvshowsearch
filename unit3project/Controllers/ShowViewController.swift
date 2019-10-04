//
//  ShowViewController.swift
//  unit3project
//
//  Created by Tia Lendor on 10/3/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
   var tvShowId: Int!
    
    var episodeArr = [Episode](){
        didSet{
            showEpisodeTableView.reloadData()
        }
    }
    
    @IBOutlet weak var showImage: UIImageView!
    
    @IBOutlet weak var showName: UILabel!
    
    @IBOutlet weak var showSummary: UITextView!
    
    @IBOutlet weak var showEpisodeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showEpisodeTableView.delegate = self
        self.showEpisodeTableView.dataSource = self
        self.showEpisodeTableView.estimatedRowHeight = 250
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    private func loadData(){
        EpisodeAPIManager.shared.getEpisodes(showId: tvShowId) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let episodeArrFromOnline):
                    self.episodeArr = episodeArrFromOnline
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else{
            fatalError("Unexpected Error: No Identifier in segue")
        }
        switch segueIdentifier {
        case "ShowDetailToEpisodeDetail":
            guard let episodeDetailsVC = segue.destination as? EpisodeViewController else{
                fatalError("Unexpected Error: No View Controller")
            }
            guard let selectedIndexPath = self.showEpisodeTableView.indexPathForSelectedRow else {
                fatalError("Unexpected Error: No row selected")
            }
            episodeDetailsVC.episodeDetails = episodeArr[selectedIndexPath.row]
                
            
        default:
            fatalError("Unexpected Identifier")
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // #warning Incomplete implementation, return the number of rows

       return episodeArr.count
   }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let thisShow = episodeArr[indexPath.row]
       let showCell = showEpisodeTableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath) as! ShowDetailTableViewCell
       showCell.episodeName.text = thisShow.name
       showCell.episodeDetails.text = " Season: \(thisShow.season) & Episode: \(thisShow.number) "

        
        ImageHelper.shared.getImage(urlStr: thisShow.image.medium!) {(result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let imageFromOnline):
                    showCell.episodeImage.image = imageFromOnline
                }
            }
        }
       return showCell
   }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

}
