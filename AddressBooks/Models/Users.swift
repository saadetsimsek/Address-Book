//
//  Users.swift
//  AddressBooks
//
//  Created by Saadet Şimşek on 08/11/2024.
//

import Foundation

struct Users: Codable {
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
}
