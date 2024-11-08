//
//  AddresViewModel.swift
//  AddressBooks
//
//  Created by Saadet Şimşek on 07/11/2024.
//

import Foundation

class AddresViewModel {
    
    func getUsers(){
        NetworkDataFetch.shared.fetchUsers { users, error in
            if error != nil {
                print("Notify user")
            }
            else if let users {
                print(users.count)
            }
        }
    }
}
