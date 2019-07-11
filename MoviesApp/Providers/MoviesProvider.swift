//
//  MoviesProvider.swift
//  MoviesApp
//
//  Created by Nika on 7/9/19.
//  Copyright © 2019 Nika. All rights reserved.
//

import Foundation

class MoviesProvider {
    
    static let shared = MoviesProvider()
    
    var popularMovies:Array<Any>!
    var topRatedMovies:Array<Any>!
    
    func getPopularMovies(completionHandler: @escaping (Array<Any>) -> (Void), errorHandler: @escaping (String) -> (Void)) {
        
        if popularMovies != nil {
            completionHandler(popularMovies)
        }
        
        popularMovies = Array<Any>()
        MovieServices.getPopularMovies(completionHandler: {(response) -> (Void) in
            
            for json in response["results"].arrayValue {
                
                let movie:Movie = Movie.init(json: json)
                self.popularMovies.append(movie)
            }
            
            completionHandler(self.popularMovies)
            
        }, errorHandler: { (error) -> (Void) in
            errorHandler("Request Error")
        })
    }
    
    func getTopRatedMovies(completionHandler: @escaping (Array<Any>) -> (Void), errorHandler: @escaping (String) -> (Void)) {
        
        if topRatedMovies != nil {
            completionHandler(topRatedMovies)
        }
        
        topRatedMovies = Array<Any>()
        MovieServices.getTopRatedMovies(completionHandler: {(response) -> (Void) in
            
            for json in response["results"].arrayValue {
                
                let movie:Movie = Movie.init(json: json)
                self.topRatedMovies.append(movie)
            }
            
            completionHandler(self.topRatedMovies)
            
        }, errorHandler: { (error) -> (Void) in
            errorHandler("Request Error")
        })
    }
}
