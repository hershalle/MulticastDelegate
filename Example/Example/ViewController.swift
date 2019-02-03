//
//  ViewController.swift
//  Example
//
//  Created by Shai Balassiano on 07/11/2018.
//  Copyright © 2018 Shai Balassiano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let exampleService = ExampleService()

    var consumer1: ServiceConsumer? = ServiceConsumer(name: "consumer1")
    var consumer2: ServiceConsumer? = ServiceConsumer(name: "consumer2")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Start running the service - get delegate call every 0.5 seconds
        exampleService.run()

        // Add two delegates
        exampleService.multicastDelegate.add(delegate: consumer1!)
        exampleService.multicastDelegate.add(delegate: consumer2!)


        // Dealloc consumer2 to test that MulticastDelegate doesn't retain it.
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            self.consumer2 = nil
            print("consumer2 is nil")
        }
    }
}

class ServiceConsumer: ExampleServiceDelegate {
    let name: String

    init(name: String) {
        self.name = name
    }

    func exampleService(_ service: ExampleService, outputMessage message: String) {
        print("\(name): \(message)")
    }
}
