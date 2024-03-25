//
//  Task5_8.swift
//  Multithreading
//
//  Created by Kostya Khvan on 25.03.2024.
//

import UIKit

class ViewController5_8: UIViewController {        
        
        override func viewDidLoad() {
                super.viewDidLoad()
            
            Task {
                await printMessage()
            }
        }
        
        func printMessage() async {
            let string = await withTaskGroup(of: String.self) { group -> String in
               // тут добавляем строки в группу

                let words = ["Hello", "My", "Road", "Map", "Group"]
                for word in words {
                    group.addTask {
                        word
                    }
                }
                
                var collected = [String]()

                for await value in group {
                    collected.append(value)
                }

                return collected.joined(separator: " ")
            }

            print(string)
        }
    }
