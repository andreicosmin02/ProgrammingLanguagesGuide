//
//  LanguageDetailsViewController.swift
//  ProgrammingLanguagesGuide
//
//  Created by Andrei on 4/25/26.
//

import UIKit

class LanguageDetailsViewController: UIViewController {
    
    var language: ProgrammingLanguage?
    
    private let detailsLabel = UILabel()
    private let webButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Details"
        view.backgroundColor = .white
        
        setupUI()
        showData()
    }
    
    private func setupUI() {
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        webButton.translatesAutoresizingMaskIntoConstraints = false
        
        detailsLabel.numberOfLines = 0
        detailsLabel.font = UIFont.systemFont(ofSize: 20)
        detailsLabel.textAlignment = .center
        
        webButton.setTitle("Open Webpage", for: .normal)
        webButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        webButton.addTarget(self, action: #selector(openWebpage), for: .touchUpInside)
        
        view.addSubview(detailsLabel)
        view.addSubview(webButton)
        
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            webButton.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 40),
            webButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func showData() {
        detailsLabel.text = language?.details
    }
    
    @objc private func openWebpage() {
        let webVC = LanguageWebViewController()
        webVC.language = language
        navigationController?.pushViewController(webVC, animated: true)
    }
}
