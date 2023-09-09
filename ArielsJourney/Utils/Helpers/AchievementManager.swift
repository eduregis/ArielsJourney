//
//  AchievementManager.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 09/09/23.
//

import Foundation

class AchievementManager {
    
    static var shared: AchievementManager = {
        let instance = AchievementManager()
        return instance
    }()
    
    private init() {}
    
    func getAchievementByString(name: String) -> String {
        switch name {
            case "prodigy": return AchievementTexts.prodigy.localized()
            case "bestEnd": return AchievementTexts.bestEnd.localized()
            default: return ""
        }
    }
}
