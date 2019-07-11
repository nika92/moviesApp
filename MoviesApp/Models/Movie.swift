//
//  Movie.swift
//  MoviesApp
//
//  Created by Nika on 7/9/19.
//  Copyright © 2019 Nika. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie {
    
    let POSTER_BASE_URL = "https://image.tmdb.org/t/p/original"
    
    var id:String = ""
    var originalLanguage:String = ""
    var originalTitle:String = ""
    var overview:String = ""
    var genreIds:Array<Int> = Array<Int>()
    var adult:Bool = false
    var releaseDate:String = ""
    var voteCount:Int = 0
    var title:String = ""
    var voteAverage:Double = 0
    var video:Bool = false
    var backdropPath:String = ""
    var popularity:Double = 0.0
    var posterPath:URL? = URL(string: "")
    var posterImg:UIImage = UIImage()
    
    init() {
        
    }
    
    init(json:JSON) {
        parse(json: json)
    }
    
    func parse(json: JSON) {
        
        id                  = json["id"].stringValue
        originalLanguage    = json["original_language"].stringValue
        originalTitle       = json["original_title"].stringValue
        overview            = json["overview"].stringValue
        
        for genre_id in json["genre_ids"].arrayValue {
            genreIds.append(genre_id.intValue)
        }
        
        adult               = json["adult"].boolValue
        releaseDate         = json["release_date"].stringValue
        voteCount           = json["vote_count"].intValue
        title               = json["title"].stringValue
        voteAverage         = json["vote_average"].doubleValue
        video               = json["vide"].boolValue
        backdropPath        = json["backdrop_path"].stringValue
        popularity          = json["popularity"].doubleValue
        posterPath          = URL(string: POSTER_BASE_URL + json["poster_path"].stringValue)
    }
    
    init(movie: FavouriteMovie) {
        
        id                  = movie.id ?? ""
        originalLanguage    = movie.originalLanguage ?? ""
        originalTitle       = movie.originalTitle ?? ""
        overview            = movie.overview ?? ""
        genreIds            = movie.genreIds as? Array<Int> ?? Array<Int>()
        adult               = movie.adult
        releaseDate         = movie.releaseDate ?? ""
        voteCount           = Int(Int64(movie.voteCount))
        title               = movie.title ?? ""
        voteAverage         = movie.voteAverage
        video               = movie.video
        backdropPath        = movie.backdropPath ?? ""
        popularity          = movie.popularity
        posterPath          = movie.posterPath
    }
}
