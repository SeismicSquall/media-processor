//
//  Image.swift
//  SampleCode
//
//  Created by Alex Maslov on 2018-08-13.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation

protocol Fetchable {
    var url: String {get set}
}

struct Image : Codable, Fetchable {
    var url: String
    var title: String
}
