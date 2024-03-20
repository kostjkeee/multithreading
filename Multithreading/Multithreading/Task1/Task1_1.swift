//
//  ViewController.swift
//  Multithreading
//
//  Created by Kostya Khvan on 19.03.2024.
//

import UIKit

class ViewControllerTask1_1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Thread.detachNewThread {
            for _ in (0..<10) {
                let currentThread = Thread.current
                print("1, Current thread: \(currentThread)")
            }
        }
        
        for _ in (0..<10) {
            let currentThread = Thread.current
            print("2, Current thread: \(currentThread)")
        }
    }

    /// Только первый цикл перевести в другой поток с помощью Thread.detachNewThread и обяснить почему изменился вывод.
    
    /// Изначально, оба цикла находились  в одном потоке, и поэтому выполнялись поочередно, сначала первый цикл, затем второй.
    /// После того как мы перевели первый цикл в другой поток, они начали выполняться одновременно, поэтому результат из раза в раз может варьироваться.

}

