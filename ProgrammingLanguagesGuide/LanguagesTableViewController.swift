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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedLanguage = languages[indexPath.row]
        
        let basicVC = LanguageBasicViewController()
        basicVC.language = selectedLanguage
        
        navigationController?.pushViewController(basicVC, animated: true)
    }
}
