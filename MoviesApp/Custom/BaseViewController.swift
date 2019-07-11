//
//  ParentViewController.swift
//  App
//
//  Created by Nika on 5/27/19.
//  Copyright © 2019 Nika. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setNavBarTitle(title: String) {
        navigationItem.title = title
    }
    
    func addLogo() {
        
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        
        let imageView           = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        imageView.contentMode   = .scaleAspectFit
        let image               = UIImage(named: "video_icon.png")
        imageView.image         = image
        
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
    }

    func addBackButton() {
        
        let backButton: UIButton            = UIButton(type: UIButton.ButtonType.custom)
        backButton.frame                    = CGRect(x: 0, y: 0, width: 53, height: 31)
        backButton.imageView?.contentMode   = UIView.ContentMode.scaleAspectFit
        
        backButton.setImage(UIImage(named: "back_icon"), for: UIControl.State.normal)
        backButton.addTarget(self, action: #selector(pop), for: UIControl.Event.touchUpInside)
        
        let barButton = UIBarButtonItem(customView: backButton)
        
        navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func pop () {
        _ = navigationController?.popViewController(animated: true)
    }
}
