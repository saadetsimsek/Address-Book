//
//  AddresViewModel.swift
//  AddressBooks
//
//  Created by Saadet Şimşek on 07/11/2024.
//

import Foundation

class AddresViewModel {
    
    var isLoading: Observable<Bool> =  Observable(false)
    var cellDataSource: Observable<[Users]> = Observable(nil)
    var dataSource: [Users]?
    
    func getUsers(){
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchUsers {[weak self] users, error in
            guard let self else {return}
            self.isLoading.value = false
            if let users {
                self.dataSource = users
                mapCellData()
            }
        }
    }
    
    func mapCellData(){
        cellDataSource.value = dataSource
    }
}
