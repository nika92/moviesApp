//
//  AlertController.swift
//  MoviesApp
//
//  Created by Nika on 7/10/19.
//  Copyright © 2019 Nika. All rights reserved.
//

import Foundation
import UIKit

class AlertController {
    
    static func showAlertWithTitleAndMessageInViewController(title: String, message: String, vc: UIViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            
        }))
        
        vc.present(alert, animated: true, completion: nil)
    }
}
