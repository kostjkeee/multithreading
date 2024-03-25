//
//  Task4_1.swift
//  Multithreading
//
//  Created by Kostya Khvan on 22.03.2024.
//

import UIKit

class ViewControllerTask4_1: UIViewController {

    final class Post: Sendable {
            
    }

    enum State1: Sendable {
         case loading
         case data(String)
    }
        
    enum State2: Sendable {
         case loading
         case data(Post) // Out: Associated value 'data' of 'Sendable'-conforming enum 'State2' has non-sendable type 'ViewController.Post'
    }

    }
        
// Так как класс является референс типом, и вместе с тем потоконебезопасным, нам нужно обеспечить, что класс который мы передаем в качестве associated value у енама, будет потокобезопасным. Для этого подписывем его под протокол Sendable и делаем его final, гарантируя, что у него не будет подклассов, которые в какой-то момент могли бы переопределить его свойства и тем самым сделав его потоконебезопасным
