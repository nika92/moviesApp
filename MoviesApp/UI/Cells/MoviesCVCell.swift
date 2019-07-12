//
//  MoviesCVCell.swift
//  MoviesApp
//
//  Created by Nika on 7/10/19.
//  Copyright © 2019 Nika. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesCVCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupWithMovie(movie: Movie) {
        posterImgView?.sd_setImage(with: movie.posterPath, placeholderImage: UIImage(named: "placeholder_image"), completed: { (image, error, cacheType, imageURL) in
            
            movie.posterImg = image ?? UIImage()
        })
    }
}
