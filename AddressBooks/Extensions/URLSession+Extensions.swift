//
//  URLSession+Extensions.swift
//  AddressBooks
//
//  Created by Saadet Şimşek on 08/11/2024.
//

import Foundation

extension URLSession {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    func request(_ endpoint: Endpoint, handler: @escaping Handler) -> URLSessionDataTask {
        let task = dataTask(with: endpoint.url, completionHandler: handler)
        task.resume()
        return task
    }
}
