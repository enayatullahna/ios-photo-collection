//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Enayatullah Naseri on 5/30/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func selectDarkTheme(_ sender: Any) {
        
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func selectBlueTheme(_ sender: Any) {
        
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    

}
