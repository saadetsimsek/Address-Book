//
//  TableViewCellViewModel.swift
//  AddressBooks
//
//  Created by Saadet Şimşek on 13/11/2024.
//

import Foundation

class TableViewCellViewModel {
    var name: String
    var email: String
    
    init( _ users: Users) {
        self.name = users.name
        self.email = users.email
    }
}
