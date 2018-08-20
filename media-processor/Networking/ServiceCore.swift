//
//  Service.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-16.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation



enum Result<T> {
    case success(T)
    case error(Error)
}
typealias DefaultResult = Result<Data>

enum NetworkServiceError : Error {
    case invalidData
}

protocol FetchingService {
    func get(request:Request, completion: @escaping (Result<Data>) -> Void)
}

class NetworkService : FetchingService {
    func get(request:Request, completion: @escaping (Result<Data>) -> Void) {
        guard let url = request.url else {return}
        URLSession.shared.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
            if let error = error {
                completion(.error(error))
            }
            guard let data = data else {
                completion(.error(NetworkServiceError.invalidData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}

protocol Request  {
    var url:URL? {get}
}

