//
//  FavouriteMovie+CoreDataProperties.swift
//  
//
//  Created by Nika on 7/10/19.
//
//

import Foundation
import CoreData


extension FavouriteMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavouriteMovie> {
        return NSFetchRequest<FavouriteMovie>(entityName: "FavouriteMovie")
    }

    @NSManaged public var id: String?
    @NSManaged public var originalLanguage: String?
    @NSManaged public var originalTitle: String?
    @NSManaged public var overview: String?
    @NSManaged public var genreIds: NSObject?
    @NSManaged public var adult: Bool
    @NSManaged public var releaseDate: String?
    @NSManaged public var voteCount: Int64
    @NSManaged public var title: String?
    @NSManaged public var voteAverage: Double
    @NSManaged public var video: Bool
    @NSManaged public var backdropPath: String?
    @NSManaged public var popularity: Double
    @NSManaged public var posterPath: URL?
}
