//
//  Task5_5.swift
//  Multithreading
//
//  Created by Kostya Khvan on 25.03.2024.
//

import UIKit

class ViewController5_5: UIViewController {
    
    var networkService = NetworkService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            print(await fetchMessages())
        }
    }
    
    func fetchMessages() async -> [Message] {
        await withCheckedContinuation { continutaion in
            // Асинхроннoe получениe данных
            networkService.fetchMessages { messages in
                continutaion.resume(returning: messages)
            }
        }
    }
}



struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}


class NetworkService {
    
    func fetchMessages(completion: @escaping ([Message]) -> Void) {
        let url = URL(string: "https://hws.dev/user-messages.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let messages = try? JSONDecoder().decode([Message].self, from: data) {
                    completion(messages)
                    return
                }
            }
            
            completion([])
        }
        .resume()
    }
}



