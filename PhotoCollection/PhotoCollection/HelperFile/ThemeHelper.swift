//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Enayatullah Naseri on 5/30/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import Foundation

class ThemeHelper {
//    let themePreferenceKey = "themePreferenceKey"
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Blue", forKey: .themePreferenceKey)
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: .themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}
