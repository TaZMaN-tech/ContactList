//
//  Person.swift
//  ContactList
//
//  Created by Тадевос Курдоглян on 25.12.2024.
//

struct Person {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
