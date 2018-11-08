//
//  ExampleService.swift
//  Example
//
//  Created by Shai Balassiano on 07/11/2018.
//  Copyright © 2018 Shai Balassiano. All rights reserved.
//

import Foundation
import MulticastDelegate

protocol ExampleServiceDelegate: class {
    func exampleService(_ service: ExampleService, outputMessage message: String)
}

class ExampleService {
    var multicastDelegate = MulticastDelegate<ExampleServiceDelegate>()

    func run() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
            self.multicastDelegate.invoke { delegate in
                delegate.exampleService(self, outputMessage: "\(timer.fireDate.timeIntervalSince1970)")
            }
        }
    }

}
