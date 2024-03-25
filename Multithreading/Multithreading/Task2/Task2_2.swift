//
//  Task2_2.swift
//  Multithreading
//
//  Created by Kostya Khvan on 20.03.2024.
//

import UIKit

class ViewControllerTask2_2: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

           // Создаем и запускаем поток
            let thread1 = ThreadPrintOne()
        let thread2 = ThreadPrintTwo()
        
        // Меняем приоритеты
        // Сначала 1, потом 2
        thread1.qualityOfService = .userInitiated
        thread2.qualityOfService = .utility
        // Сначала 2, потом 1
        thread1.qualityOfService = .utility
        thread2.qualityOfService = .userInitiated
        // Вперемешку
        thread1.qualityOfService = .utility
        thread2.qualityOfService = .utility
        
        thread1.start()
        thread2.start()
        
    }
    
    class ThreadPrintOne: Thread {
        override func main() {
            for _ in (0..<100) {
                print("1")
            }
        }
    }
    class ThreadPrintTwo: Thread {
        override func main() {
            for _ in (0..<100) {
                print("2")
            }
        }
    }

}
