//
//  UIImage.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-19.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation
import UIKit

enum ImageError : Error {
    case invalidImageData
}

struct GenericRequest : Request {
    var url:URL?
}

extension UIImage {
    static func get(url:URL, service:NetworkService = NetworkService(), completion: @escaping (Result<UIImage>) -> Void) {
        service.get(request: GenericRequest(url: url)) { (result:Result<Data>) in
            DispatchQueue.main.async {
                switch result {
                case .error(let error):
                    completion(.error(error))
                case .success(let data):
                    guard let image = UIImage(data: data) else {
                        completion(.error(ImageError.invalidImageData))
                        return
                    }
                    completion(.success(image))
                }
            }
            
        }
    }
}
