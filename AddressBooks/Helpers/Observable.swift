//
//  Observable.swift
//  AddressBooks
//
//  Created by Saadet Şimşek on 13/11/2024.
//

import Foundation

class Observable<T> {
    var value: T? {
        didSet{
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value: T? = nil) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
}
