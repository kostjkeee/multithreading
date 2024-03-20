//
//  Task1.swift
//  Multithreading
//
//  Created by Kostya Khvan on 20.03.2024.
//

import UIKit

class ViewControllerTask2_1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем и запускаем поток
        let infinityThread = InfinityLoop()
        infinityThread.start()
        print("is executing \(infinityThread.isExecuting)")

        // Подождем некоторое время, а затем отменяем выполнение потока
        sleep(4)
        print("is executing \(infinityThread.isExecuting)")
        sleep(1)

        
        // Отменяем тут
        print("is executing \(infinityThread.isExecuting)")
        infinityThread.cancel()
        print("is cancelled \(infinityThread.isCancelled)")
        print("is finished \(infinityThread.isFinished)")
        sleep(1)
        print("1 sec later is finished \(infinityThread.isFinished)")
    }
    
    class InfinityLoop: Thread {
        var counter = 0
        
        override func main() {
            while counter < 30 && !isCancelled {
                counter += 1
                print(counter)
                InfinityLoop.sleep(forTimeInterval: 1)
            }
        }
    }
}
