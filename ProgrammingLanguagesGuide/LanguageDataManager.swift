//
//  LanguageDataManager.swift
//  ProgrammingLanguagesGuide
//
//  Created by Andrei on 4/25/26.
//

import Foundation

class LanguageDataManager: NSObject, XMLParserDelegate {
    
    private var languages: [ProgrammingLanguage] = []
    
    private var currentElement = ""
    private var name = ""
    private var creator = ""
    private var year = ""
    private var mainUse = ""
    private var imageName = ""
    private var details = ""
    private var website = ""
    
    func loadLanguages() -> [ProgrammingLanguage] {
        languages.removeAll()
        
        guard let path = Bundle.main.path(forResource: "languages", ofType: "xml") else {
            print("languages.xml not found")
            return []
        }
        
        guard let parser = XMLParser(contentsOf: URL(fileURLWithPath: path)) else {
            print("Could not create XML parser")
            return []
        }
        
        parser.delegate = self
        parser.parse()
        
        return languages
    }
    
    func parser(_ parser: XMLParser,
                didStartElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?,
                attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        
        if elementName == "language" {
            name = ""
            creator = ""
            year = ""
            mainUse = ""
            imageName = ""
            details = ""
            website = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let value = string.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if value.isEmpty {
            return
        }
        
        switch currentElement {
        case "name":
            name += value
        case "creator":
            creator += value
        case "year":
            year += value
        case "mainUse":
            mainUse += value
        case "imageName":
            imageName += value
        case "details":
            details += value
        case "website":
            website += value
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser,
                didEndElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?) {
        
        if elementName == "language" {
            let language = ProgrammingLanguage(
                name: name,
                creator: creator,
                year: year,
                mainUse: mainUse,
                imageName: imageName,
                details: details,
                website: website
            )
            
            languages.append(language)
        }
    }
}
