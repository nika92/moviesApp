//
//  CustomNavC.swift
//  App
//
//  Created by Nika on 5/27/19.
//  Copyright © 2019 Nika. All rights reserved.
//

import UIKit

class CustomNavC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavBar()
    }
    
    func setNavBar () {
        
        navigationBar.barTintColor          = StyleUtils.appMainColor()
        navigationBar.titleTextAttributes   = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationBar.shadowImage           = UIImage()
    }

}
