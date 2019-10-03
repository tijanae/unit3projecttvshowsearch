//
//  episodeModel.swift
//  unit3project
//
//  Created by Tia Lendor on 9/11/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation


struct ShowDetails: Codable {
    let id: Int
    let name: String
    //    let genres: [GenreType]
    let status: String
    let officialSite: String?
    let episodeList: EpisodeList
    
    private enum CodingKeys: String, CodingKey {
        case id, name, status, officialSite
        case episodeList = "_embedded"
    }
}

struct EpisodeList: Codable {
    let episodes: [Episode]
}

struct Episode: Codable {
    let episodeId: Int
    let name: String
    let season: Int?
    let number: Int?
    let airdate: String?
    let summary: String?
    let image: EpisodeImage
    
    private enum CodingKeys: String, CodingKey {
        case episodeId = "id"
        case name, season, number, airdate, summary
        case image
        
    }
}

struct EpisodeImage: Codable {
    let medium: String?
    let original: String?
}



/*
"_embedded": {
"episodes": [
    {
        "id": 10820,
        "url": "http://www.tvmaze.com/episodes/10820/girls-1x01-pilot",
        "name": "Pilot",
        "season": 1,
        "number": 1,
        "airdate": "2012-04-15",
        "airtime": "22:30",
        "airstamp": "2012-04-16T02:30:00+00:00",
        "runtime": 30,
        "image": {
            "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/15/38639.jpg",
            "original": "http://static.tvmaze.com/uploads/images/original_untouched/15/38639.jpg"
        },
        "summary": "<p>In the premiere of this comedy about twentysomething women navigating their way through life in New York, Hannah swings and misses at two curves when her parents rescind their financial support and she loses her unpaid internship. Meanwhile, Hannah's roommate, Marnie, throws a dinner party for their nomadic friend Jessa, who's returned from yet another journey.</p>",
        "_links": {
            "self": {
                "href": "http://api.tvmaze.com/episodes/10820"
            }
        }
    }

*/



/*
"http://api.tvmaze.com/shows/139?embed=episodes"

{
"id": 139,
"url": "http://www.tvmaze.com/shows/139/girls",
"name": "Girls",
"type": "Scripted",
"language": "English",
"genres": [
    "Drama",
    "Romance"
],
"status": "Ended",
"runtime": 30,
"premiered": "2012-04-15",
"officialSite": "http://www.hbo.com/girls",
"schedule": {
    "time": "22:00",
    "days": [
        "Sunday"
    ]
},
"rating": {
    "average": 6.9
},
"weight": 90,
"network": {
    "id": 8,
    "name": "HBO",
    "country": {
        "name": "United States",
        "code": "US",
        "timezone": "America/New_York"
    }
},
"webChannel": null,
"externals": {
    "tvrage": 30124,
    "thetvdb": 220411,
    "imdb": "tt1723816"
},
"image": {
    "medium": "http://static.tvmaze.com/uploads/images/medium_portrait/31/78286.jpg",
    "original": "http://static.tvmaze.com/uploads/images/original_untouched/31/78286.jpg"
},
"summary": "<p>This Emmy winning series is a comic look at the assorted humiliations and rare triumphs of a group of girls in their 20s.</p>",
"updated": 1543140952,
"_links": {
    "self": {
        "href": "http://api.tvmaze.com/shows/139"
    },
    "previousepisode": {
        "href": "http://api.tvmaze.com/episodes/1079686"
    }
},
"_embedded": {
    "episodes": [
        {
            "id": 10820,
            "url": "http://www.tvmaze.com/episodes/10820/girls-1x01-pilot",
            "name": "Pilot",
            "season": 1,
            "number": 1,
            "airdate": "2012-04-15",
            "airtime": "22:30",
            "airstamp": "2012-04-16T02:30:00+00:00",
            "runtime": 30,
            "image": {
                "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/15/38639.jpg",
                "original": "http://static.tvmaze.com/uploads/images/original_untouched/15/38639.jpg"
            },
            "summary": "<p>In the premiere of this comedy about twentysomething women navigating their way through life in New York, Hannah swings and misses at two curves when her parents rescind their financial support and she loses her unpaid internship. Meanwhile, Hannah's roommate, Marnie, throws a dinner party for their nomadic friend Jessa, who's returned from yet another journey.</p>",
            "_links": {
                "self": {
                    "href": "http://api.tvmaze.com/episodes/10820"
                }
            }
        }
*/
 
 
 

