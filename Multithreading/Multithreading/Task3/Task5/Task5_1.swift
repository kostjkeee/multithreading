//
//  Task5_1.swift
//  Multithreading
//
//  Created by Kostya Khvan on 25.03.2024.
//

import UIKit

class ViewController5_1: UIViewController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        print(1)
        Task {
            print(2)
        }
        print(3)
    }
}


// Принт 1 и 3 являются обязательными задачами на главном потоке которые выполняются в методе viewDidLoad синхронно. Принт 2 мы добавляем в конец очереди выполнения главной очереди, таким образом принт 2 выполнится только после выполнения всех текущих обязательных задач
// При использовании Task, наш код будет асинхронно выполняться на текущей очереди (т.е. это может быть как главный так и фоновый поток). В случае с DispatchQueue.main.async, блок кода передается для выполнения на главной очереди, что означает, что код будет выполняться асинхронно и сразу на главном потоке
