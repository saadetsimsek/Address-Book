//
//  NetworkDataFetch.swift
//  AddressBooks
//
//  Created by Saadet Şimşek on 08/11/2024.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    private init(){
        
    }
    
    func fetchUsers(response: @escaping ([Users]?, NetworkError?) -> Void){
        NetworkRequest.shared.getData { result in
            switch result {
            case .success(let data):
                do{
                    let users = try JSONDecoder().decode([Users].self, from: data)
                    response(users, nil)
                }catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(_):
                response(nil, .canNotParseData)
            }
        }
    }
}
