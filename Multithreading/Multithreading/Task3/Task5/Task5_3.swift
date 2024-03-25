//
//  Task5_3.swift
//  Multithreading
//
//  Created by Kostya Khvan on 25.03.2024.
//

import UIKit

class ViewController5_3: UIViewController {
    

    override func viewDidLoad() {
            super.viewDidLoad()
        
        print("Task 1 is finished")
       
        Task.detached(priority: .userInitiated) {
            for i in 0..<10 {
                print(i)
            }
            print("Task 2 is finished")
            print(Thread.current)
        }
        
        print("Task 3 is finished")
    }
}

// Разницы между DispatchQueue.global().async и Task.detached практически нет. Оба этих способа работают асинхронно в фоновом потоке и у обоих можно задать приоритет. ЕДинственная разница в том, что Task.detached предоставляет больше контроля при работе с ней, задачу можно отменить (.cancel()) или дождаться и просмотреть результат задачи (await task.value)
