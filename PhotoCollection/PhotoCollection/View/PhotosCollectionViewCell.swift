//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Enayatullah Naseri on 5/30/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    
    private func updateViews() {
        
        guard let photo = photo else {return}
        
        // update photo and label
        let imageV = UIImage(data: photo.imageData)
        imageView.image = imageV
        photoTitleLabel.text = photo.title
        
    }
    
    
}
