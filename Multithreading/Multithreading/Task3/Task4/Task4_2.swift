//
//  Task4_2.swift
//  Multithreading
//
//  Created by Kostya Khvan on 22.03.2024.
//

import UIKit

protocol RMOperationProtocol {
    // Приоритеты
    var priority: DispatchQoS.QoSClass { get }
    // Выполняемый блок
    var completionBlock: (() -> Void)? { get }
    // Завершена ли операция
    var isFinished: Bool { get }
    var isExecuting: Bool { get }
    // Метод для запуска операции
    func start()
}

class RMOperation: RMOperationProtocol {
    var priority: DispatchQoS.QoSClass = .default
    
    var completionBlock: (() -> Void)?
    var isExecuting: Bool = false

    var isFinished: Bool = false
    
    func start() {
        DispatchQueue.global(qos: priority).async { [weak self] in
            self?.completionBlock?()
        }
        
    }
    
    /// В методе start. реализуйте все через глобальную паралельную очередь с приоритетами.
    
}





class ViewControllerTask4_2: UIViewController {
    let dispatchGroup = DispatchGroup()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let operationFirst = RMOperation()
        let operationSecond = RMOperation()
        
        
        operationFirst.priority = .userInitiated
        operationFirst.completionBlock = {
            
            for _ in 0..<50 {
                print(1)
            }
            print(Thread.current)
            print("Операция 1 полностью завершена!")
            self.dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        operationFirst.start()
        
        
        
        operationSecond.priority = .background
        operationSecond.completionBlock = {
            
            for _ in 0..<50 {
                print(2)
            }
            print(Thread.current)
            print("Операция 2 полностью завершена!")
            self.dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
            operationSecond.start()
        
        
        dispatchGroup.wait()
        
    }
}

