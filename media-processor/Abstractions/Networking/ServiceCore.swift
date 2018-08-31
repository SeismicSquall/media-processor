//
//  Service.swift
//  media-processor
//
//  Created by Alex Maslov on 2018-08-16.
//  Copyright © 2018 Alex Maslov. All rights reserved.
//

import Foundation



public enum Result<T> {
    case success(T)
    case error(Error)
}

enum NetworkServiceError : Error {
    case invalidData
}

protocol FetchingService {
    func get(request:Request, completion: @escaping (Result<Data>) -> Void) -> URLSessionDataTask?
}

public class NetworkService : FetchingService {
    public init() {}
    
    public func get(request:Request, completion: @escaping (Result<Data>) -> Void) -> URLSessionDataTask? {
        guard let url = request.url else {return nil}
        let task = URLSession.shared.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
            if let error = error {
                completion(.error(error))
            }
            guard let data = data else {
                completion(.error(NetworkServiceError.invalidData))
                return
            }
            completion(.success(data))
        }
        task.resume()
        return task
    }
}



public protocol Request  {
    var url:URL? {get}
}

