//
//  Person.swift
//  KVO Example
//
//  Created by Fomagran on 2020/12/29.
//

import Foundation

@objc class Person:NSObject {
    @objc dynamic var name = "Fomagran"
}




//Swift4 이전
private var myContext = 0

class PersonObserver:NSObject {

    var person:Person
    
    init(withPerson:Person) {
        self.person = withPerson
        super.init()
        self.person.addObserver(self, forKeyPath: #keyPath(Person.name), options: .new, context: &myContext)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == &myContext {
            guard let change = change else { return }
            print("\(person.name) has changed \(change[.newKey] ?? "")")
        }
    }
}
