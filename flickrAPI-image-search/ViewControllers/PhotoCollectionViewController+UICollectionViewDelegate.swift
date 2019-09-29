//
//  PhotoCollectionViewController+UICollectionViewDelegate.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/29/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import UIKit

//--------------------------------------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//--------------------------------------------------------------------------

extension PhotoCollectionViewController: UICollectionViewDelegate {
    
    //--------------------------------------------------------------------------
    // MARK: - Lazy Loading
    //--------------------------------------------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let viewModel = viewModel else { return }
        
        let itemsPerPage = viewModel.itemsPerPage
        let itemsLimit = viewModel.itemsLimit
        
        let currentItem = indexPath.row + indexPath.section
        let limit = (viewModel.currentPage * itemsPerPage) - itemsLimit
        let isLoadMore = (currentItem > limit) && (viewModel.currentPage < viewModel.totalPages)
        
        
        if NetworkState.isConnected() {
            if isLoadMore {
                viewModel.requestPhotos { error in
                    self.updateCollectionView()
                }
            }
        } else {
            let networkError = AppError.networkError
            
            self.showAlert(with: networkError.title, error: networkError.message)
        }
    }
    
}
