//
//  ContactsListViewController.swift
//  ContactList
//
//  Created by Тадевос Курдоглян on 26.12.2024.
//

import UIKit

final class ContactsListViewController: UITableViewController {
    
    private var persons = DataStore.shared.persons
}


extension ContactsListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        persons[section].fullName
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        let person = persons[indexPath.section]
        
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            content.image = UIImage(systemName: "phone")
            content.text = person.phone
        default:
            content.image = UIImage(systemName: "envelope")
            content.text = person.email
        }
        
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        return cell
    }
}
