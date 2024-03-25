//
//  Task3_3.swift
//  Multithreading
//
//  Created by Kostya Khvan on 21.03.2024.
//

import UIKit

class ViewControllerTask3_3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let serialQueue = DispatchQueue(label: "com.example.myQueue")

         serialQueue.async {
            serialQueue.async {
                print("This will never be printed.")
            }
         }
    }
    

    // DeadLock

}
