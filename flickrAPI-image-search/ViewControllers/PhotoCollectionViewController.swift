//
//  PhotoCollectionViewController.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UIViewController {
    
    //--------------------------------------------------------------------------
    // MARK: - IBOutlets
    //--------------------------------------------------------------------------
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //--------------------------------------------------------------------------
    // MARK: - Properties
    //--------------------------------------------------------------------------
    
    var viewModel: PhotoCollectionViewModel?
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    //--------------------------------------------------------------------------
    // MARK: - ViewController LifeCycle
    //--------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if NetworkState.isConnected() {
            
            self.viewModel?.requestPhotos { error in
                if let error = error  {
                    self.showAlert(with: error.title, error: error.message)
                }
                self.updateCollectionView()
            }
            
        } else {
            let networkError = AppError.networkError
            
            self.showAlert(with: networkError.title, error: networkError.message)
        }
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Helpers
    //--------------------------------------------------------------------------
    
    private func setupNavigationBar() {
        self.navigationItem.title = viewModel?.navigationTitle
    }
    
    func showAlert(with title: String, error message: String) {
        let alertController = UIAlertController(title: title , message: message , preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        
        alertController.addAction(dismissAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func updateCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}



