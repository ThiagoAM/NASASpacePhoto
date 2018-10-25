//
//  URL+Helpers.swift
//  SpacePhoto
//
//  Created by Thiago Martins on 23/10/18.
//  Copyright © 2018 Thiago Martins. All rights reserved.
//

import UIKit

extension URL {
    func withHTTPS() -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.scheme = "https"
        return components?.url
    }
    
    func withQueries(_ queries : [String : String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap({ URLQueryItem(name: $0.0, value: $0.1) })
        return components?.url
    }
}
