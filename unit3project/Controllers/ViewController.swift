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
            self.loadData()
        }
    }
    
    var userRequestedSearch: [TvShows] {
        guard let searchedString = tvSearchString else{
            return tvShows
        }
        guard searchedString != "" else{
            return tvShows
        }
        return tvShows.filter{$0.show.name.lowercased().contains(searchedString.lowercased())}
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tvShowTableView.delegate = self
        tvShowTableView.dataSource = self
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

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return userRequestedSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tvInfo = userRequestedSearch[indexPath.row]
        let tvCell = tvShowTableView.dequeueReusableCell(withIdentifier: "tvShowCell", for: indexPath) as! ShowTableViewCell
        tvCell.tvShowName.text = tvInfo.show.name.capitalized
        tvCell.tvShowRating.text = "Rating: \(tvInfo.show.rating)"
        return tvCell
    }

}

