//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by Thiago Martins on 23/10/18.
//  Copyright © 2018 Thiago Martins. All rights reserved.
//

import UIKit

struct PhotoInfo : Codable {
    
    // Properties:
    var title : String
    var description : String
    var url : URL
    var copyright : String?
    
    enum Keys : String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    init(from decoder : Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: Keys.self)
        self.title = try valueContainer.decode(String.self, forKey: .title)
        self.description = try valueContainer.decode(String.self, forKey: .description)
        self.url = try valueContainer.decode(URL.self, forKey: .url)
        self.copyright = try valueContainer.decode(String.self, forKey: .copyright)
    }
    
}
