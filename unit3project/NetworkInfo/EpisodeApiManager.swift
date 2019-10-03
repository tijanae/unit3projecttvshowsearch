//
//  EpisodeApiManager.swift
//  unit3project
//
//  Created by Tia Lendor on 9/12/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

class EpisodeAPIManager{
    
    private init () {}
    
    static let shared = EpisodeAPIManager()
    
    
    
    func getEpisodes(showId: Int, completionHandler: @escaping (Result<[Episode], Error>) -> Void) {
        let urlStr = "http://api.tvmaze.com/shows/\(showId)?embed=episodes"
        
        guard let url = URL(string: urlStr) else{
            completionHandler(.failure(ErrorHandling.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else{
                completionHandler(.failure(ErrorHandling.noData))
                return
            }
            guard let data = data else {
                completionHandler(.failure(ErrorHandling.noData))
                return
            }
            do{
            let episodeData = try JSONDecoder().decode(ShowDetails.self, from: data)
                completionHandler(.success(episodeData.episodeList.episodes))
            }catch let error {
                completionHandler(.failure(ErrorHandling.decodingError))
                print(error)
            }
        }.resume()
    }
    
}
