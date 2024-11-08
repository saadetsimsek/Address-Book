//
//  Endpoint.swift
//  AddressBooks
//
//  Created by Saadet Şimşek on 08/11/2024.
//

import Foundation

struct Endpoint {
    var path: String
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = "/" + path
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
}

extension Endpoint {
    static var users: Self {
        Endpoint(path: "users")
    }
}
