//
//  Task2_3.swift
//  Multithreading
//
//  Created by Kostya Khvan on 20.03.2024.
//

import UIKit

class ViewControllerTask2_3: UIViewController {
    
    private let lockQueue = DispatchQueue(label: "name.lock.queue")
    private var name = "Введите имя"
       
       override func viewDidLoad() {
           super.viewDidLoad()

           updateName()
       }
       
       func updateName() {
           lockQueue.async {
               self.name = "I love RM" // Перезаписываем имя в другом потоке
               print(Thread.current)
               print(self.name)
           }
           
           lockQueue.async {
               print("OUT OF GLOBAL QUEUE - \(self.name)") // Считываем имя из main
           }
       }
}

// Здесь мы сталкиваемся с Race Condition. Для решения этой проблемы нужно синхронизировать доступ к желаемому обьекту. В данном случае мы воспользовались серийной(последовательной) очередью, таким образом теперь доступ к обьекту будет производиться по очереди.
