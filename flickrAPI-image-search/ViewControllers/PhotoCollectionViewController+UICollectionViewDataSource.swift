//
//  PhotoCollectionViewController+UICollectionViewDataSource.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/29/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import UIKit

//--------------------------------------------------------------------------
// MARK: - UICollectionViewDataSource
//--------------------------------------------------------------------------

extension PhotoCollectionViewController: UICollectionViewDataSource {
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        guard let viewModel = viewModel else { return 0 }
//
//        return viewModel.photos.count
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        
        return viewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell,
            let viewModel = viewModel
            else { return UICollectionViewCell() }
        
        let index = indexPath.row + (indexPath.section * viewModel.itemsPerSection)
        let imageURL = viewModel.photos[index].imageURL
        
        cell.configure(with: imageURL)
        
        return cell
    }
    
}
