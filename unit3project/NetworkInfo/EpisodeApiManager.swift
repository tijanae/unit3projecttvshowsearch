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
    
    
    
    func getEpisodes(showId: Int, completionHandler: @escaping (Result<[EpisodeInfo], Error>) -> Void) {
        let urlStr = "http://api.tvmaze.com/shows/\()?embed=episodes"
        
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
            let episodeData = try JSONDecoder().decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: data)
                completionHandler(.success(<#T##Success#>))
            }catch {
                completionHandler(.failure(ErrorHandling.decodingError))
            }
        }.resume()
    }
    
}
