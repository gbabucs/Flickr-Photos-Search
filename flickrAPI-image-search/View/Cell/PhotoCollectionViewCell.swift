//
//  PhotoCollectionViewCell.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoCollectionViewCell: UICollectionViewCell {
    
    //--------------------------------------------------------------------------
    // MARK: - IBOutlets
    //--------------------------------------------------------------------------

    @IBOutlet weak var imageView: UIImageView!
    
    //--------------------------------------------------------------------------
    // MARK: - Init Nib
    //--------------------------------------------------------------------------
    
    override func awakeFromNib() {
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.translatesAutoresizingMaskIntoConstraints = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
}

//--------------------------------------------------------------------------
// MARK: - Cell
//--------------------------------------------------------------------------

extension PhotoCollectionViewCell: Cell {
    
    typealias T = String
    
    func configure(with imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        
        let placeholderImage = UIImage(named: "placeholder")
        
        imageView.af_setImage(
            withURL: url,
            placeholderImage: placeholderImage
        )
    }
}


