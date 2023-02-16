//
//  Bindable.swift
//  Example
//
//  Created by Shai Balassiano on 16/02/2023.
//  Copyright © 2023 Shai Balassiano. All rights reserved.
//

import Foundation

class Bindable<T> {
    
    typealias Observer = (T) -> Void
    
    var observer: Observer?
    
    init(_ value: T) {
        self.value = value
    }
    
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    func bind(_ observer: Observer?) {
        self.observer = observer
        observer?(value)
    }
}

