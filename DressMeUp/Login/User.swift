//
//  User.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 19/11/2023.
//

import Foundation

struct User : Codable {
    var id: String
    var name: String
    var email: String
    var joined: TimeInterval
}
