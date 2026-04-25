//
//  LanguagesTableViewController.swift
//  ProgrammingLanguagesGuide
//
//  Created by Andrei on 4/25/26.
//

import UIKit

class LanguagesTableViewController: UITableViewController {

    let languages = [
        "Swift",
        "Python",
        "JavaScript",
        "Java",
        "C#",
        "C++",
        "Go",
        "Rust",
        "Kotlin",
        "TypeScript"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Programming Languages"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
        cell.textLabel?.text = languages[indexPath.row]
        cell.accessoryType = .disclosureIndicator

        return cell
    }
}
