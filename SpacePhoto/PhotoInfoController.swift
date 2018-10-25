//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by Thiago Martins on 23/10/18.
//  Copyright © 2018 Thiago Martins. All rights reserved.
//

import UIKit

class PhotoInfoController {
    
    // Public Methods:
    public func fetchImage(from url : URL, completion : @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let image = UIImage(data: data) {
                    completion(image)
                } else { print("Data was not serialized."); completion(nil) }
            } else { print("No data was returned."); completion(nil) }
        }
        task.resume()
    }
    
    public func fetchPhotoInfo(completion : @escaping (PhotoInfo?) -> Void) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query : [String : String] = [
            "api_key" : "DEMO_KEY",
        ]
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfo)
            } else {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
            }
        }
        task.resume()
    }
    
}
