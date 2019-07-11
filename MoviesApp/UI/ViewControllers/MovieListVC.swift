//
//  MovieListVC.swift
//  MoviesApp
//
//  Created by Nika on 7/9/19.
//  Copyright © 2019 Nika. All rights reserved.
//

import UIKit

class MovieListVC: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let CV_CELL_ID = "MoviesCVCell"
    
    var items:Array<Movie> = Array<Movie>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavBarTitle(title: "Movies")
        
        setUpCollectionView()
        fetchPopularMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if segmentedControl.selectedSegmentIndex == 2 {
            fetchFavourites()
        }
    }
    
    func setUpCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = .clear
        collectionView.register(UINib (nibName: CV_CELL_ID, bundle: Bundle.main), forCellWithReuseIdentifier: CV_CELL_ID)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CV_CELL_ID, for: indexPath) as? MoviesCVCell else {
            preconditionFailure("Invalid cell type")
        }
        
        cell.setupWithMovie(movie: items[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 110, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let destVC:MovieDetailsVC = VCProvider.shared.getMovieDetailsVC()
        destVC.movie = items[indexPath.row]
        
        self.navigationController?.pushViewController(destVC, animated: true)
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        
        loader.startAnimating()
        segmentedControl.isUserInteractionEnabled = false
        
        if sender.selectedSegmentIndex == 0 {
            fetchPopularMovies()
        } else if sender.selectedSegmentIndex == 1 {
            fetchTopRatedMovies()
        } else {
            fetchFavourites()
        }
    }
    
    func fetchPopularMovies() {
        
        MoviesProvider.shared.getPopularMovies(completionHandler: {[weak self](response) -> (Void) in
            
            self?.loader.stopAnimating()
            self?.reloadCollectionViewWithArray(array: response as! Array<Movie>)
            
        }, errorHandler: { (error) -> (Void) in
            
            self.loader.stopAnimating()
            AlertController.showAlertWithTitleAndMessageInViewController(title: "Error", message: "Connection Problem", vc: self)
        })
        
        segmentedControl.isUserInteractionEnabled = true
    }
    
    func fetchTopRatedMovies() {
        
        MoviesProvider.shared.getTopRatedMovies(completionHandler: {[weak self](response) -> (Void) in
            
            self?.loader.stopAnimating()
            self?.reloadCollectionViewWithArray(array: response as! Array<Movie>)
            
        }, errorHandler: { (error) -> (Void) in
            
            self.loader.stopAnimating()
            AlertController.showAlertWithTitleAndMessageInViewController(title: "Error", message: "Connection Problem", vc: self)
        })
        
        segmentedControl.isUserInteractionEnabled = true
    }
    
    func fetchFavourites() {
        
        reloadCollectionViewWithArray(array: FavouriteMoviesProvider.shared.getFavouriteMovies())
        self.loader.stopAnimating()
        segmentedControl.isUserInteractionEnabled = true
    }
    
    func reloadCollectionViewWithArray(array: Array<Movie>) {
        
        self.items.removeAll()
        self.items = array
        self.collectionView.reloadData()
    }
}
