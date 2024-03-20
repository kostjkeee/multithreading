//
//  Task2_4.swift
//  Multithreading
//
//  Created by Kostya Khvan on 20.03.2024.
//

import UIKit

class ViewControllerTask2_4: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

            print("A")
            
            DispatchQueue.main.async {
                print("B")
            }
        
            print("C")
        
    }
}

// в консоли выведет A C B
// Сначала принтуется А, затем В добавляется в очередь выполнения и ждет пока main освободится, и так как у нас еще остается С мы сначала принтуем ее, а затем уже В
