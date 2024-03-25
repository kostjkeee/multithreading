//
//  Task3_4.swift
//  Multithreading
//
//  Created by Kostya Khvan on 21.03.2024.
//

import UIKit

class ViewControllerTask3_4: UIViewController {

    override func viewDidLoad() {
           super.viewDidLoad()
           
           var sharedResource = 0
           let lock = NSLock()
        
           DispatchQueue.global(qos: .background).async {
               for _ in 1...100 {
                   lock.lock()
                   sharedResource += 1
                   lock.unlock()
               }
           }

           DispatchQueue.global(qos: .background).async {
               for _ in 1...100 {
                   lock.unlock()
                   sharedResource += 1
                   lock.unlock()
               }
           }
    }
    
// Race COndition

}
