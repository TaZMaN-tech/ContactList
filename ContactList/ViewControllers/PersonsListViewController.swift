//
//  PersonsListViewController.swift
//  ContactList
//
//  Created by Тадевос Курдоглян on 25.12.2024.
//

import UIKit

final class PersonsListViewController: UITableViewController {
    
    private var persons = DataStore.shared.persons
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detailVC = segue.destination as? PersonDetailsViewController
        detailVC?.person = persons[indexPath.row]
    }

}


extension PersonsListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = persons[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        
        cell.contentConfiguration = content
        return cell
    }
}
