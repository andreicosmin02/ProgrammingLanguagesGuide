//
//  LanguageBasicViewController.swift
//  ProgrammingLanguagesGuide
//
//  Created by Andrei on 4/25/26.
//

import UIKit

class LanguageBasicViewController: UIViewController {
    
    var language: ProgrammingLanguage?
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let creatorLabel = UILabel()
    private let yearLabel = UILabel()
    private let mainUseLabel = UILabel()
    private let detailsButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Basic Info"
        view.backgroundColor = .white
        
        setupUI()
        showData()
    }
    
    private func setupUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        creatorLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        mainUseLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 26)
        nameLabel.textAlignment = .center
        
        creatorLabel.textAlignment = .center
        yearLabel.textAlignment = .center
        mainUseLabel.textAlignment = .center
        mainUseLabel.numberOfLines = 0
        
        imageView.contentMode = .scaleAspectFit
        
        detailsButton.setTitle("More Details", for: .normal)
        detailsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        detailsButton.addTarget(self, action: #selector(openDetails), for: .touchUpInside)
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(creatorLabel)
        view.addSubview(yearLabel)
        view.addSubview(mainUseLabel)
        view.addSubview(detailsButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 140),
            imageView.heightAnchor.constraint(equalToConstant: 140),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            creatorLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            creatorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            creatorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            yearLabel.topAnchor.constraint(equalTo: creatorLabel.bottomAnchor, constant: 12),
            yearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            yearLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            mainUseLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 12),
            mainUseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainUseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            detailsButton.topAnchor.constraint(equalTo: mainUseLabel.bottomAnchor, constant: 35),
            detailsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func showData() {
        guard let language = language else { return }
        
        nameLabel.text = language.name
        creatorLabel.text = "Creator: \(language.creator)"
        yearLabel.text = "First appeared: \(language.year)"
        mainUseLabel.text = "Main use: \(language.mainUse)"
        
        imageView.image = UIImage(named: language.imageName) ?? UIImage(systemName: "chevron.left.forwardslash.chevron.right")
    }
    
    @objc private func openDetails() {
        let detailsVC = LanguageDetailsViewController()
        detailsVC.language = language
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
