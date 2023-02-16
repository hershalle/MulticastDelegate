//
//  MulticastBindable.swift
//  Example
//
//  Created by Shai Balassiano on 16/02/2023.
//  Copyright © 2023 Shai Balassiano. All rights reserved.
//

import MulticastDelegate

class MulticastBindable<T> {
    
    typealias Observer = (T) -> Void
    
    private let multicastDelegateClosure = MulticastDelegateClosure<T>()
    
    init(_ value: T) {
        self.value = value
    }
    
    var value: T {
        didSet {
            multicastDelegateClosure.invoke { action in
                action(value)
            }
        }
    }
    
    func bind(observer: AnyObject, action: @escaping (T) -> Void) {
        multicastDelegateClosure.add(on: observer, action: action)
    }
}
