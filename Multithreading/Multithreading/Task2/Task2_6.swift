//
//  Task2_6.swift
//  Multithreading
//
//  Created by Kostya Khvan on 20.03.2024.
//

import UIKit

class Task2_6: UIViewController {

    var lock = NSLock()
    
    private lazy var name = "I love RM"
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           updateName()
       }
       
       func updateName() {
           DispatchQueue.global().async {
               self.lock.lock()
               print(self.name) // Считываем имя из global
               print(Thread.current)
               self.lock.unlock()
           }
           lock.lock()
           print(self.name) // Считываем имя из main
           lock.unlock()
       }


}
