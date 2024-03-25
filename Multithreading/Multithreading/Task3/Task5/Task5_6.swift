//
//  Task5_6.swift
//  Multithreading
//
//  Created by Kostya Khvan on 25.03.2024.
//

import UIKit

enum MessagesError: Error {
    case empty
    case failedToLoad
}

class ViewController5_6: UIViewController {
    
    var networkService = NetworkService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                print(try await fetchMessages())
            } catch {
                print(error)
            }
        }
    }
    
    func fetchMessages() async throws -> [Message] {
        try await withCheckedThrowingContinuation { continutaion in
            // Асинхроннoe получениe данных
            networkService.fetchMessages { messages in
                if messages.isEmpty {
                    continutaion.resume(throwing: MessagesError.empty)
                } else {
                    continutaion.resume(returning: messages)
                }
            }
        }
    }
}



