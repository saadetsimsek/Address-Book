//
//  DetailViewModel.swift
//  AddressBooks
//
//  Created by Saadet Şimşek on 19/11/2024.
//

import Foundation

class DetailViewModel {
    
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    
    let street: String
    let suite: String
    let city: String

    init(user: Users) {
        self.name = user.name
        self.username = user.username
        self.email = user.email
        self.address = user.address
        self.phone = user.phone
        self.street = user.address.street
        self.suite = user.address.suite
        self.city = user.address.city
    }
}
