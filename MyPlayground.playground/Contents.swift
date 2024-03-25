import UIKit

var greeting = "Hello, playground"

class ViewControllerTask2_5: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(2)
        // block 1
        DispatchQueue.main.async {
            print(3)
            // во избежание дедлока меняем sync на async
            DispatchQueue.main.async {
                print(5)
            }
            print(4)
        }
        print(6)
    }
}

let vc = ViewControllerTask2_5()
print(1)
let view = vc.view
print(7)

// 1 2 6 7 3 4 5



/*
func firstMethod() {
    print("A")
    
    // блок 1
    DispatchQueue.main.async {
        print("S")
        // блок 3
        DispatchQueue.main.async {
            print("T")
        }
        print("K")
    }
    
    // блок 2
    DispatchQueue.main.async {
        DispatchQueue.global().sync {
            print("V")
        }
        print("E")
    }
    
    print("C")
}

firstMethod()

// A С S K V E T
// Блок 3

*/

/*
 func firstMethod() {
 print("A")
 
 // 1 блок
 DispatchQueue.main.async {
 print("B")
 
 // block 3
 DispatchQueue.main.async {
 print("C")
 }
 // block 4
 DispatchQueue.main.async {
 print("D")
 }
 
 DispatchQueue.global().sync {
 print("E")
 }
 }
 
 print("F")
 
 // 2 block
 DispatchQueue.main.async {
 print("G")
 }
 }
 
 firstMethod()
 
 // A F B E G C D
 // 3 block  4 block
 
*/
