//
//  ViewController.swift
//  KVO Example
//
//  Created by Fomagran on 2020/12/29.
//

import UIKit

class ViewController: UIViewController {
    
    var nameObservation: NSKeyValueObservation?
    let fomagran = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Swift4 이전
//        let fomagran = Person()
//        let observer = PersonObserver(withPerson:fomagran)
//
//        fomagran.name = "Khalid"
//        fomagran.name = "Young"

        nameObservation = fomagran.observe(\Person.name, options: [.old,.new,.initial]) { (person, name) in
            print("\(name.oldValue ?? "") changed name to \(name.newValue ?? "")")
        }
        fomagran.name = "Young"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        nameObservation?.invalidate()
    }
    
}


