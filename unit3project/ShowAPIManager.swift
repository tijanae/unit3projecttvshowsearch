//
//  ShowAPIManager.swift
//  unit3project
//
//  Created by Tia Lendor on 9/11/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

enum ErrorHandling: Error {
    case badURL
    case decodingError
    case noData
}

class ShowAPIManager {
    
    private init () {}
    
    static let shared = ShowAPIManager()
    
    func getTvShows(userSearchString: String?, completionHandler: @escaping (Result<[TvShows], Error>) -> Void) {
        var tvUrlStr = ""
        if let word = userSearchString {
            let searchString = word.replacingOccurrences(of: " ", with: "")
        tvUrlStr = "https://api.tvmaze.com/search/shows?q=\(searchString)"
        }
        guard let url = URL(string: tvUrlStr) else{
            completionHandler(.failure(ErrorHandling.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                completionHandler(.failure(ErrorHandling.noData))
                return
            }
            guard let data = data else{
                completionHandler(.failure(ErrorHandling.noData))
                return
            }
            do{
                let tvData = try JSONDecoder().decode([TvShows].self, from: data)
                completionHandler(.success(tvData))
            }catch{
                completionHandler(.failure(ErrorHandling.decodingError))
            }
            
            
        } .resume()
    }
    
}

/*
func getTvShows(userSearchString: String, completionHandler: @escaping (Result<[TvShows], Error>) -> Void) {
    let tvUrlStr = "https://api.tvmaze.com/search/shows?q=\(userSearchString)"
    
    guard let url = URL(string: tvUrlStr) else{
        completionHandler(.failure(ErrorHandling.badURL))
        return
    }
    
    URLSession.shared.dataTask(with: url) { (data, _, error) in
        guard error == nil else {
            completionHandler(.failure(ErrorHandling.noData))
            return
        }
        guard let data = data else{
            completionHandler(.failure(ErrorHandling.noData))
            return
        }
        do{
            let tvData = try JSONDecoder().decode([TvShows].self, from: data)
            completionHandler(.success(tvData))
        }catch{
            completionHandler(.failure(ErrorHandling.decodingError))
        }
        
        
}
*/
