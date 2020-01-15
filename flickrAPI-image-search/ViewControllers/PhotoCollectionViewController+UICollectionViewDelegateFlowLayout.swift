//
//  PhotoCollectionViewController+UICollectionViewDelegateFlowLayout.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/29/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import UIKit

//--------------------------------------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//--------------------------------------------------------------------------

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout,
//            let viewModel = viewModel else { return CGSize.zero }
//
//        let numberOfItemsPerRow = CGFloat(viewModel.itemsPerRow)
//        let extraPadding = sectionInsets.left * numberOfItemsPerRow
//        let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left
//        let availableWidth = view.frame.width - extraPadding - inset
//        let width = availableWidth / numberOfItemsPerRow
//
//        return CGSize(width: width, height: width)
//    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(#function)
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding

        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.left
//    }
    
}
