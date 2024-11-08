//
//  NetworkRequest.swift
//  AddressBooks
//
//  Created by Saadet Şimşek on 08/11/2024.
//

import Foundation

class NetworkRequest {
    static let shared = NetworkRequest()
    
    private init(){
        
    }
    
    func getData(completionHandle: @escaping (Result<Data, NetworkError>) -> Void){
        URLSession.shared.request(.users) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    completionHandle(.failure(.urlError))
                } else{
                    guard let data else { return}
                    completionHandle(.success(data))
                }
            }
        }
    }
}
