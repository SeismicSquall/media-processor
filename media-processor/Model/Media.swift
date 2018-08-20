//
//  Image.swift
//  SampleCode
//
//  Created by Alex Maslov on 2018-08-13.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation

struct Media : Codable {
    var title: String
    var url:String
}

struct Image : Codable {
    
}

extension Media : Fetchable {
    static func get(url: URL, service: FetchingService, completion: @escaping (Result<Media>) -> Void) {
        
    }
    
    typealias DataType = Media
    
}
