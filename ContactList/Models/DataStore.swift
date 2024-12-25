//
//  DataStore.swift
//  ContactList
//
//  Created by Тадевос Курдоглян on 25.12.2024.
//

final class DataStore {
    static let shared = DataStore()
    
    private let firstNames = [
        "Oliver", "Emma", "Liam", "Amelia", "Noah",
        "Ava", "James", "Isabella", "Ethan", "Charlotte",
        "Lucas", "Mia", "Mason", "Harper", "Logan"
    ]
    
    private let lastNames = [
        "Smith", "Johnson", "Williams", "Brown", "Jones",
        "Miller", "Davis", "Garcia", "Rodriguez", "Wilson",
        "Martinez", "Anderson", "Taylor", "Thomas", "Jackson"
    ]
    
    private let phones = [
        "555-123-4567", "555-987-6543", "555-111-2222", "555-444-3333", "555-999-8888",
        "555-222-9999", "555-777-6666", "555-101-2020", "555-303-4040", "555-505-6060",
        "555-070-8000", "555-110-2200", "555-330-4400", "555-990-8800", "555-777-3333"
    ]
    
    private let emails = [
        "1@example.com", "2@example.com", "3@example.com", "4@example.com", "5@example.com",
        "6@example.com", "7@example.com", "8@example.com", "9@example.com", "10@example.com",
        "11@example.com", "12@example.com", "13@example.com", "14@example.com", "15@example.com"
    ]
    
    private(set) var persons: [Person] = []
    
    private init() {
        persons = generateUniquePeople(count: 15)
    }
    
    private func generateUniquePeople(count: Int) -> [Person] {
           var availableFirstNames = firstNames.shuffled()
           var availableLastNames = lastNames.shuffled()
           var availablePhones = phones.shuffled()
           var availableEmails = emails.shuffled()
           
           var result: [Person] = []
           
           for _ in 0..<count {
               guard !availableFirstNames.isEmpty,
                     !availableLastNames.isEmpty,
                     !availableEmails.isEmpty,
                     !availablePhones.isEmpty else { break }
               
               let firstName = availableFirstNames.removeFirst()
               let lastName = availableLastNames.removeFirst()
               let email = availableEmails.removeFirst()
               let phone = availablePhones.removeFirst()
               
               let person = Person(firstName: firstName, lastName: lastName, phone: phone, email: email)
               result.append(person)
           }
           return result
       }
}
