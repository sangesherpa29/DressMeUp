//
//  Strings.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 27/07/2023.
//

import Foundation

extension String {
    
    static var randomInt = Int.random(in: 0...5)
    
    static var unsplashApiUrl = "https://api.unsplash.com/search/collections?page=\(randomInt)&per_page=30&query=fashion&client_id=qzPoaDGNkM9dmkfKUhwHXal4rfVBBfITIEJZwMvpISg"
    
    static var parseError = "Could not parse data"
    static var dataError = "Could not get data"
    
}
