//
//  Requests.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-16.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation

enum Request : String {
    case mediaList = "https://raw.githubusercontent.com/SeismicSquall/media/master/content.json"
    
    var url:URL? {
        return URL(string: rawValue)
    }
}
