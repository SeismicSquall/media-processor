//
//  MediaService.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-17.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation
import UIKit

fileprivate struct MediaCollection : Codable {
    let media:[Media]
}

class MediaService : NetworkService {
    
    func get(request:Request, service:FetchingService = NetworkService(), completion: @escaping (Result<[Media]>) -> ()) {
        service.get(request: request) { (result:Result<Data>) in
            switch result {
            case .error(let error):
                completion(.error(error))
            case .success(let mediaJSON):
                do {
                    let media = try JSONDecoder().decode(MediaCollection.self, from: mediaJSON)
                    completion(.success(media.media))
                }
                catch {
                    //completion
                }
                
            }
        }
    }
}

enum AppRequests : String {
    case mediaList = "https://raw.githubusercontent.com/SeismicSquall/media/master/content.json"
    
    var url:URL? {
        return URL(string: rawValue)
    }
}


