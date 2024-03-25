//
//  Task3_1.swift
//  Multithreading
//
//  Created by Kostya Khvan on 21.03.2024.
//

import UIKit

class ViewControllerTask3_1: UIViewController {
    /*
     override func viewDidLoad() {
     super.viewDidLoad()
     
     var phrasesService = PhrasesService()
     //1
     DispatchQueue.global().async {
     for i in 0..<10 {
     phrasesService.addPhrase("Phrase \(i)")
     }
     }
     
     // Даем потокам время на завершение работы
     Thread.sleep(forTimeInterval: 1)
     
     // Выводим результат
     print(phrasesService.phrases)
     }
     
     class PhrasesService {
     //2
     let semaphore = DispatchSemaphore(value: 1)
     var phrases: [String] = []
     
     func addPhrase(_ phrase: String) {
     semaphore.wait()
     phrases.append(phrase)
     semaphore.signal()
     }
     }
     */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phrasesService = PhrasesService()
        let semaphore = DispatchSemaphore(value: 0)
        //3
        for i in 0..<10 {
            DispatchQueue.global().async {
                phrasesService.addPhrase("Phrase \(i)")
            }
        }
        
        // Даем потокам время на завершение работы
        Thread.sleep(forTimeInterval: 1)
        
        // Выводим результат
        semaphore.wait()
        print(phrasesService.phrases)
        semaphore.signal()
    }
    
}
    actor PhrasesService {
        var phrases: [String] = []
        let semaphore = DispatchSemaphore(value: 1)
        
        func addPhrase(_ phrase: String) {
            semaphore.wait()
            phrases.append(phrase)
            semaphore.signal()
        }
    }


