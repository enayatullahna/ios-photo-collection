//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Enayatullah Naseri on 5/30/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        
        setTheme()
        
        guard let photo = photo else {return}
        
        detailImageView.image = UIImage(data: photo.imageData)
        detailTextField.text = photo.title
        print("Update function")
    }
    
    // add button
    @IBAction func addPhoto(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        imagePicker.delegate = self
        
    }
    
    // save button
    @IBAction func savePhoto(_ sender: Any) {
        
        guard let photo = photo else {
            guard let label = detailTextField.text,
                let image = detailImageView.image else {return}
            
            guard let imageData = image.pngData() else { return }
            
            photoController?.createPhoto(for: imageData, title: label)
            navigationController?.popViewController(animated: true)
            return
        }
        
        guard let label = detailTextField.text,
            let image = detailImageView.image else { return}
        
        guard let imageData = image.pngData() else { return }
        
        photoController?.updatePhoto(photo: photo, for: imageData, title: label)
    }
    
    
    func setTheme() {
        
        guard let themePreference = themeHelper?.themePreference else {return}
        
        if themePreference == "Dark" {
            view.backgroundColor = .darkGray
        }else {
            view.backgroundColor = .yellow // changed color
        }
        
    }
    

    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let imagePicked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        
        detailImageView.image = imagePicked
        
        dismiss(animated: true, completion: nil)
    }

    
    
}
