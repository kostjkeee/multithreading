//
//  Task5_4.swift
//  Multithreading
//
//  Created by Kostya Khvan on 25.03.2024.
//

import UIKit

class ViewController5_4: UIViewController {
        
        override func viewDidLoad() {
                super.viewDidLoad()
            

            func randomD6() async -> Int {
                Int.random(in: 1...6)
            }

            Task {
                let result = await randomD6()
                print(result)
            }
        }
    }


