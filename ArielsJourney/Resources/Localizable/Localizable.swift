//
//  Localizable.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import Foundation

protocol Localizable: RawRepresentable {
    func localized(_ args: [CVarArg], key: String?) -> String
    func localizedHTML(_ args: [CVarArg]) -> NSAttributedString?
}
extension Localizable where Self.RawValue == String {
    
    private var localizedString: String {
        return NSLocalizedString(rawValue, comment: "")
    }
    
    private var localizedCountries: String {
        return NSLocalizedString(rawValue, tableName: "Dialogues", comment: "")
    }
    
    func localized(_ args: [CVarArg] = [], key: String? = "") -> String {
        
        if let key = key, key == "dialogue" {
            return args.isEmpty ? localizedCountries : String(format: localizedCountries, arguments: args)
        } else {
            return args.isEmpty ? localizedString : String(format: localizedString, arguments: args)
        }
        
    }
    func localizedHTML(_ args: [CVarArg] = []) -> NSAttributedString? {
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] =
            [.documentType: NSAttributedString.DocumentType.html,
             .characterEncoding: String.Encoding.utf8.rawValue]
        let text = localized(args)
        let data = Data(text.utf8)
        return try? NSAttributedString(data: data, options: options, documentAttributes: nil)
    }
}

extension String {
    
    private var localizedString: String {
        return NSLocalizedString(self, comment: "")
    }
    
    private var localizedCountries: String {
        return NSLocalizedString(self, tableName: "Dialogues", comment: "")
    }
    
    func localized(_ args: [CVarArg] = [], key: String? = "") -> String {
        if let key = key, key == "dialogue" {
            return args.isEmpty ? localizedCountries : String(format: localizedCountries, arguments: args)
        } else {
            return args.isEmpty ? localizedString : String(format: localizedString, arguments: args)
        }
    }
}
