//
//  ViewController.swift
//  unit3project
//
//  Created by Tia Lendor on 9/11/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tvShowSearchBar: UISearchBar!
    
    @IBOutlet weak var tvShowTableView: UITableView!
    
    
// MARK -- Data Source
    var tvShows = [TvShows]() {
        didSet{
            tvShowTableView.reloadData()
        }
    }
    
    var tvSearchString: String? = nil {
        didSet{
            tvShowTableView.reloadData()
        }
    }
    
    var userRequestedSearch: [TvShows] {
        guard let searchedString = tvSearchString else{
            return tvShows
        }
        guard searchedString != "" else{
            return tvShows
        }
        return tvShows
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tvShowTableView.delegate = self
        tvShowTableView.dataSource = self
        tvShowSearchBar.delegate = self
        print(tvShows)
        loadData()
        // Do any additional setup after loading the view.
    }
    
    
    private func loadData() {
        ShowAPIManager.shared.getTvShows(userSearchString: tvSearchString ?? "") { (result) in
                DispatchQueue.main.async {
                    switch result{
                    case .failure(let error):
                        print(error)
                    case .success(let tvArrFromOnline):
                        self.tvShows = tvArrFromOnline
                    }
                }
            }
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else{
            fatalError("Unexpected Error: No Identifier in segue")
        }
        switch segueIdentifier {
        case "showMainToShowEpisodeSegue":
            guard let tvDetailsVC = segue.destination as? ShowDetailTableViewController else{
                fatalError("Unexpected Error: No View Controller")
            }
            guard let selectedIndexPath = self.tvShowTableView.indexPathForSelectedRow else {
                fatalError("Unexpected Error: No row selected")
            }
            tvDetailsVC.tvShowDetails = userRequestedSearch[selectedIndexPath.row]
            
        default:
            fatalError("Unexpected Identifier")
        }
    }
    
    
    
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return userRequestedSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tvInfo = userRequestedSearch[indexPath.row]
        let tvCell = tvShowTableView.dequeueReusableCell(withIdentifier: "tvShowCell", for: indexPath) as! ShowTableViewCell
        tvCell.tvShowName.text = tvInfo.show.name.capitalized
        if let rating = tvInfo.show.rating?.average {
            tvCell.tvShowRating.text = "Rating: \(rating)"
        } else {
           tvCell.tvShowRating.text = "Rating Pending"
        }
        
        ImageHelper.shared.getImage(urlStr: tvInfo.show.image.medium) {(result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let imageFromOnline):
                    tvCell.tvShowImage.image = imageFromOnline
                }
            }
        }
        return tvCell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tvSearchString = searchBar.text
        loadData()
    }

}

