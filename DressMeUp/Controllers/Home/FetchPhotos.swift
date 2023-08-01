//
//  FetchPhotos.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 11/07/2023.
//

import Foundation
import UIKit
import Alamofire

struct APIResponse: Codable {
    var results: [Result]
}

struct Result: Codable {
    let coverPhoto: ResultCoverPhoto
    
    enum CodingKeys: String, CodingKey {
        case coverPhoto = "cover_photo"
    }
}

struct ResultCoverPhoto: Codable {
    let urls: Url
}

struct Url: Codable {
    let full: String
    let regular: String
    let small: String
    let small_s3: String
}

// All the Inspiration page images are fetched from here
// and displayed from HomeViewController
extension HomeViewController {
    func fetchPhotos( _ completion: @escaping (APIResponse)-> Void) {
        
        guard let url = URL(string: .unsplashApiUrl) else {
            print(String.parseError)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {
                print(String.dataError)
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(jsonData)
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
        
    } // end of function
}
