//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Enayatullah Naseri on 5/30/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import Foundation

class PhotoController {
    
    
    //MARK: - Properties
    var photos: [Photo] = []
    
    
    func createPhoto (for imageData: Data, title: String){
        
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto (photo: Photo, for imageData: Data, title: String) {
        guard let indexPath = photos.firstIndex(of: photo) else {return}
        
        photos[indexPath].imageData = imageData
        photos[indexPath].title = title
    }
}
