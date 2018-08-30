//
//  Fetchable.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-19.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation

protocol Fetcher {
    associatedtype DataType:Codable
    func get(url:URL, service:FetchingService, completion: @escaping (Result<[DataType]>) -> Void)
}


