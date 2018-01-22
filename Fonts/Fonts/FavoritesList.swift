//
//  FavoritesList.swift
//  Fonts
//
//  Created by oohira on 2018/01/23.
//  Copyright © 2018年 oohira. All rights reserved.
//

import Foundation

class FavoritesList {
    static let sharedFavoritesList = FavoritesList()
    private(set) var favorites: [String]

    init() {
        let defaults = UserDefaults.standard
        let storedFavorites = defaults.object(forKey: "favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites! : []
    }

    func addFavorite(fontName: String) {
        if !favorites.contains(fontName) {
            favorites.append(fontName)
            saveFavorites()
        }
    }

    func removeFavorite(fontName: String) {
        if let index = favorites.index(of: fontName) {
            favorites.remove(at: index)
            saveFavorites()
        }
    }

    func saveFavorites() {
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
}