//
//  MovieServices.swift
//  MoviesApp
//
//  Created by Nika on 7/9/19.
//  Copyright © 2019 Nika. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MovieServices {

    static let BASE_URL = "https://api.themoviedb.org/3"
    static let API_KEY  = "API_KEY"
    
    static func getPopularMovies(completionHandler: @escaping (JSON) -> (Void), errorHandler: @escaping (String) -> (Void)) {
        
        let urlString = BASE_URL + "/movie/popular?api_key=" + API_KEY + "&language=en-US&page=1"
        
        Alamofire.request(urlString).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                
                let swiftyJsonVar = JSON(responseData.result.value!)
                completionHandler(swiftyJsonVar)
                //                print(swiftyJsonVar)
                
            } else {
                
                errorHandler("Request Error")
            }
        }
    }
    
    static func getTopRatedMovies(completionHandler: @escaping (JSON) -> (Void), errorHandler: @escaping (String) -> (Void)) {
        
        let urlString = BASE_URL + "/movie/top_rated?api_key=" + API_KEY + "&language=en-US&page=1"
        
        Alamofire.request(urlString).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                
                let swiftyJsonVar = JSON(responseData.result.value!)
                completionHandler(swiftyJsonVar)
//                                print(swiftyJsonVar)
                
            } else {
                
                errorHandler("Request Error")
            }
        }
    }
}
