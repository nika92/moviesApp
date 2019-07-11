//
//  FavouriteMoviesProvider.swift
//  MoviesApp
//
//  Created by Nika on 7/11/19.
//  Copyright © 2019 Nika. All rights reserved.
//

import Foundation
import CoreData

class FavouriteMoviesProvider {
    
    static let shared = FavouriteMoviesProvider()
    var favouriteMoviesArray:Array<Movie>!
    
    func save(movie: Movie) {
        
        let favMovie = FavouriteMovie(context: PersistenceManager.context)
        
        favMovie.id                  = movie.id
        favMovie.originalLanguage    = movie.originalLanguage
        favMovie.originalTitle       = movie.originalTitle
        favMovie.overview            = movie.overview
        favMovie.genreIds            = movie.genreIds as NSObject
        favMovie.adult               = movie.adult
        favMovie.releaseDate         = movie.releaseDate
        favMovie.voteCount           = Int64(movie.voteCount)
        favMovie.title               = movie.title
        favMovie.voteAverage         = movie.voteAverage
        favMovie.video               = movie.video
        favMovie.backdropPath        = movie.backdropPath
        favMovie.popularity          = movie.popularity
        favMovie.posterPath          = movie.posterPath
        
        PersistenceManager.saveContext()
    }
    
    func delete(id: String) {
        
        let request: NSFetchRequest<FavouriteMovie> = FavouriteMovie.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", id)
        request.returnsObjectsAsFaults = false
        do {
            
            let result = try PersistenceManager.context.fetch(request)
            for data in result as [NSManagedObject] {
                PersistenceManager.context.delete(data)
            }
            
        } catch {
            
            print("Failed")
        }
    }
    
    func getFavouriteMovies() -> Array<Movie> {
        
        favouriteMoviesArray = Array<Movie>()
        
        let fetchRequest: NSFetchRequest<FavouriteMovie> = FavouriteMovie.fetchRequest()
        do {
            let favMovies = try PersistenceManager.context.fetch(fetchRequest)
            
            for mv in favMovies {
                
                let movie:Movie = Movie.init(movie: mv)
                favouriteMoviesArray.append(movie)
            }
            return favouriteMoviesArray
            
        } catch {
            return favouriteMoviesArray
        }
    }
    
    func isMovieFavourite(movie: Movie) -> Bool {
        
        if favouriteMoviesArray == nil {
            favouriteMoviesArray = getFavouriteMovies()
        }
        
        for mv in favouriteMoviesArray {
            
            if mv.id == movie.id {
                return true
            }
        }
        
        return false
    }
}
