//
//  LanguageWebViewController.swift
//  ProgrammingLanguagesGuide
//
//  Created by Andrei on 4/25/26.
//

import UIKit
import WebKit

class LanguageWebViewController: UIViewController {
    
    var language: ProgrammingLanguage?
    
    private let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Webpage"
        view.backgroundColor = .white
        
        setupWebView()
        loadWebsite()
    }
    
    private func setupWebView() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func loadWebsite() {
        guard let website = language?.website,
              let url = URL(string: website) else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
}
