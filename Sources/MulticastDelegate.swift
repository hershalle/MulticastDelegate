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

    public func invoke(_ invocation: @escaping (T) -> ()) {
        for delegate in self.delegates.allObjects {
            invocation(delegate as! T)
        }
    }

    public func dispatch(on queue: DispatchQueue, invocation: @escaping (T) -> ()) {
        queue.async {
            for delegate in self.delegates.allObjects {
                invocation(delegate as! T)
            }
        }
    }}

