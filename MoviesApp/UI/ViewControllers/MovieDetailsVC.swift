//
//  MovieDetailsVC.swift
//  MoviesApp
//
//  Created by Nika on 7/10/19.
//  Copyright © 2019 Nika. All rights reserved.
//

import UIKit
import CoreData

class MovieDetailsVC: BaseViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var originalTitleLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var overviewTxtView: UITextView!
    
    var movie:Movie = Movie()
    var isFavourite:Bool!
    var favouritesBtn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavBarTitle(title: "Details")
        addBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if FavouriteMoviesProvider.shared.isMovieFavourite(movie: movie) {
            isFavourite = true
        } else {
            isFavourite = false
        }
        
        setupVC()
        setUpFavouritesBtn()
    }
    
    func setupVC() {
        
        titleLbl.text           = movie.title
        posterImgView.image     = movie.posterImg
        originalTitleLbl.text   = movie.originalTitle
        releaseDateLbl.text     = movie.releaseDate
        ratingLbl.text          = String(movie.voteAverage)
        overviewTxtView.text    = movie.overview
    }
    
    func setUpFavouritesBtn() {
        
        favouritesBtn                          = UIButton(type: UIButton.ButtonType.custom)
        favouritesBtn.frame                    = CGRect(x: 0, y: 0, width: 50, height: 50)
        favouritesBtn.imageView?.contentMode   = UIView.ContentMode.scaleAspectFit
        
        setSelector()
        let barButton = UIBarButtonItem(customView: favouritesBtn)

        navigationItem.rightBarButtonItem = barButton
    }
    
    func setSelector() {
        
        if isFavourite {
            favouritesBtn.setImage(UIImage(named: "favourites_icon"), for: UIControl.State.normal)
            favouritesBtn.addTarget(self, action: #selector(removeFromFavourites), for: UIControl.Event.touchUpInside)
        } else {
            favouritesBtn.setImage(UIImage(named: "addToFavourites_icon"), for: UIControl.State.normal)
            favouritesBtn.addTarget(self, action: #selector(addToFavouritesAction), for: UIControl.Event.touchUpInside)
        }
    }
    
    @objc func addToFavouritesAction() {
        
        FavouriteMoviesProvider.shared.save(movie: self.movie)
        
        isFavourite = true
        setSelector()
    }
    
    @objc func removeFromFavourites() {
        
        FavouriteMoviesProvider.shared.delete(id: movie.id)
        
        isFavourite = false
        setSelector()
    }
}
