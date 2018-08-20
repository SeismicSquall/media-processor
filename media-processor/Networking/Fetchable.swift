//
//  Fetchable.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-19.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation

protocol Fetchable {
    associatedtype DataType
    static func get(request:Request, service:FetchingService, completion: @escaping (Result<DataType>) -> Void)
}
