//
//  TestMulticastDelegate.swift
//  Example
//
//  Created by Shai Balassiano on 16/02/2023.
//  Copyright © 2023 Shai Balassiano. All rights reserved.

import UIKit

class TestMulticastDelegateViewController: UIViewController {
    
    private var timer: Timer? {
        didSet {
            oldValue?.invalidate()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { _ in
            LocalDataStore.x.value += 1
        })
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
}


class LocalDataStore {
    static let x = MulticastBindable<Int>(1)
}

class BindTestMulticastDelegateViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocalDataStore.x.bind(observer: self) { value in
            print(value)
        }
    }
}
