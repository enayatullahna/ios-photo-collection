//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Enayatullah Naseri on 5/30/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count // in photocontroller count number of photos added
    }
    
    
    //MARK: - cellForItem
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
        
        let photo = photoController.photos[indexPath.row]
        
        cell.photo = photo
    
        return cell
    }
    
    func setTheme() {
        
        guard let themePreference = themeHelper.themePreference else { return }
        
        if themePreference == "Dark" {
            collectionView.backgroundColor = .darkGray // set color to dark gray
        } else if themePreference == "Blue" {
            collectionView.backgroundColor = .blue // set color to blue
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toAddPhoto" { // add photo
            
            guard let detailVC = segue.destination as? PhotoDetailViewController else {return}
            
            detailVC.photoController = photoController
            detailVC.themeHelper = themeHelper
            
        } else if segue.identifier == "toPhotoDetail" { // detail view
            
            guard let toDetailVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first else {return}
            
            let photo = photoController.photos[indexPath.row]
            
            toDetailVC.photoController = photoController
            toDetailVC.themeHelper = themeHelper
            toDetailVC.photo = photo
            
        } else if segue.identifier == "toThemeSelection" { // theme view
            
            guard let themeVC = segue.destination as? ThemeSelectionViewController else {return}
            
            themeVC.themeHelper = themeHelper
        }
    }

}
