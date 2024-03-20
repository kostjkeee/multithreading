//
//  Task2_5.swift
//  Multithreading
//
//  Created by Kostya Khvan on 20.03.2024.
//

import UIKit

class ViewControllerTask2_5: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(2)
        DispatchQueue.main.async {
            print(3)
            // во избежание дедлока меняем sync на async
            DispatchQueue.main.async {
                print(5)
            }
            print(4)
        }
        print(6)
    }
}

let vc = ViewControllerTask2_5()
//print(1)
let view = vc.view
//print(7)

// 1 2 6 7 3 4 5
// viewDidLoad вызвался так как вью по умолчанию является lazy var, и при обращении к нему через обьект класса, мы инициализируем его вместе через методы жизненного цикла
