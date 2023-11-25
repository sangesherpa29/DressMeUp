//
//  Models.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 19/08/2023.
//

import Foundation
import Realm
import RealmSwift

class Closet : Object {
    @Persisted(primaryKey: true) var name: String
    @Persisted var items = List<Item>()
    @Persisted var outfits = List<Outfit>()
}

class Item : Object {
    @Persisted var name: String
    @Persisted var imageData: Data?
    
    // Reverse link to the closet
    var closet = LinkingObjects(fromType: Closet.self, property: "items")
    // Reverse link to the outfits it belongs to
    var outfit = LinkingObjects(fromType: Outfit.self, property: "outfitItems")
}

class Outfit : Object {
    @Persisted var name: String
    var outfitItems = List<Item>()
    
    // Reverse link to the closet
    var closet = LinkingObjects(fromType: Closet.self, property: "outfits")
}
