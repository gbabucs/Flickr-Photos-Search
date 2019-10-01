//
//  UIViewControllerExtension.swift
//  flickrAPI-image-search
//
//  Created by ThunderFlash on 30/09/2019.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(with title: String, error message: String) {
        let alertController = UIAlertController(title: title , message: message , preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        
        alertController.addAction(dismissAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
