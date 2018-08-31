//
//  Configurable.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-30.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation

public protocol Configurable {
    associatedtype ModelType
    static var Identifier:String {get}
    
    func configure(model:ModelType)
}

public extension Configurable {
    static var Identifier:String {
        return String(describing: self)
    }
}
