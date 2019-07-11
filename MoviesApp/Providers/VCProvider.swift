//
//  VCProvider.swift
//  App
//
//  Created by Nika on 5/28/19.
//  Copyright © 2019 Nika. All rights reserved.
//

import UIKit

class VCProvider {
    
    static let shared = VCProvider()
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    func getMovieDetailsVC () -> MovieDetailsVC {
        
        let vc:MovieDetailsVC = mainStoryboard.instantiateViewController(withIdentifier: "MovieDetailsVC") as! MovieDetailsVC
        return vc
    }
}
