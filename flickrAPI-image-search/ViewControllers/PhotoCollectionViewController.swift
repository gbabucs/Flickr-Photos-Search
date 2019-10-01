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
    let addNewSections = 2
    
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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.collectionView.reloadData()
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Helpers
    //--------------------------------------------------------------------------
    
    private func setupNavigationBar() {
        self.navigationItem.title = viewModel?.navigationTitle
    }
    
    func updateCollectionView() {
        DispatchQueue.main.async {
            if self.collectionView.numberOfSections == 0 {
                self.collectionView.reloadData()
            } else {
                let numberOfSections = self.collectionView.numberOfSections
                let lastIndexOfNewSections = numberOfSections + self.addNewSections
                let indexSet = IndexSet(integersIn: numberOfSections...lastIndexOfNewSections)
                
                self.collectionView.insertSections(indexSet)
            }
        }
    }
    
}



