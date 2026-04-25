//
//  LanguagesTableViewController.swift
//  ProgrammingLanguagesGuide
//
//  Created by Andrei on 4/25/26.
//

import UIKit

class LanguagesTableViewController: UITableViewController {

    var languages: [ProgrammingLanguage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Programming Languages"
        languages = LanguageDataManager().loadLanguages()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
        let language = languages[indexPath.row]
        
        cell.textLabel?.text = language.name
        cell.accessoryType = .disclosureIndicator

        return cell
    }
}
