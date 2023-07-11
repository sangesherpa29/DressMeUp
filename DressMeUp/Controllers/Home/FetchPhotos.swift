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
    var title: String
    var cover_photo: Cover
}

struct Cover: Codable {
    let urls: Url
}

struct Url: Codable {
    let full: String
    let regular: String
    let small: String
}

extension HomeViewController {
    func fetchPhotos() {
        
        guard let url = URL(string: urlString) else {
            print("Could not parse url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("Could not get data")
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(APIResponse.self, from: data)
                
                for res in jsonData.results {
                    self?.results.append(res)
                }                
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
        
    } // end of function
}
