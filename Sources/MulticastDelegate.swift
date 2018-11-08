//
//  MulticastDelegate.swift
//  MulticastDelegate
//
//  Created by Shai Balassiano on 07/11/2018.
//  Copyright © 2018 Shai Balassiano. All rights reserved.
//

import Foundation

public struct MulticastDelegate<T> {
    private var delegates = NSHashTable<AnyObject>.weakObjects()

    public init() {}

    public var isEmpty: Bool {
        return delegates.count == 0
    }

    public func add(delegate: T) {
        delegates.add(delegate as AnyObject)
    }

    public func remove(delegate: T) {
        delegates.remove(delegate as AnyObject)
    }

    public func invoke(_ invocation: (T) -> ()) {
        for delegate in delegates.allObjects {
            invocation(delegate as! T)
        }
    }
}

