//
//  UserDefaultsKeys.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 06/09/23.
//

import Foundation

extension UserDefaults {
    
    enum Keys: String {
        case achievements
        case activeArchetypes
        case activeHerosJourney
        case ambienceVolume
        case duchbagCounter
        case firstOpen
        case gameInProgress
        case isNewJourney
        case lastDialogueSaved
        case musicVolume
        case soundEffectVolume
        
        var description: String {
            return self.rawValue
        }
    }
    
    public func optionalBool(forKey defaultName: String) -> Bool? {
        let defaults = self
        if let value = defaults.value(forKey: defaultName) {
            return value as? Bool
        }
        return nil
    }
}
