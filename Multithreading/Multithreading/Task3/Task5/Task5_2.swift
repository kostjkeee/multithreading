//
//  Task5_2.swift
//  Multithreading
//
//  Created by Kostya Khvan on 25.03.2024.
//

import UIKit

class ViewController5_2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1)
        Task { @MainActor  in
            print(2)
        }
        print(3)
    }
    
}
// При вызове Task с атрибутом @MainActor, мы создаем асинхронную задачу, которая будет выполнена на главной потоке. Таким образом это равносильно написанию DispatchQueue.main.async
// От обычной Task, данный код отличается тем, что задача будет выполняться именно на главном очереди, в то время как без атрибута @MainActor, задача выполнялась бы на текущей очереди (т.е. или на главном или на любом другом потоке в зависимости от контекста)

