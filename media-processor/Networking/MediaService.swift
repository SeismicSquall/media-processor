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
    let media:[Image]
}

class MediaService : NetworkService {
    
    func get(request:Request, service:FetchingService = NetworkService(), completion: @escaping (Result<[Image]>) -> ()) {
        let _ = service.get(request: request) { (result:Result<Data>) in
            DispatchQueue.main.async {
                switch result {
                case .error(let error):
                    completion(.error(error))
                case .success(let mediaJSON):
                    do {
                        let media = try JSONDecoder().decode(MediaCollection.self, from: mediaJSON)
                        completion(.success(media.media))
                    }
                    catch {
                        completion(.error(NetworkServiceError.invalidData))
                        print("json error")
                        //completion
                    }
                    
                }
            }
            
        }
    }
}


