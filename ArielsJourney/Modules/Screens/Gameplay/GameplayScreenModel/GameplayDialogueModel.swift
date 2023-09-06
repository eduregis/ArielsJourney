//
//  GameplayScreenModel.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import Foundation

struct GameplayCardModel {
    let image: String
    let title: String
    var isFlipped: Bool
}

struct Dialogue: Hashable {
    var descriptionText: String
    var firstCardText: String
    var secondCardText: String
    var firstCardImageName: String
    var secondCardImageName: String
    var nextFirstDialogue: String?
    var nextSecondDialogue: String?
    var herosJourneysStage: String
    var soundTrigger: String?
    var achievementTrigger: String?
    var genericTrigger: String?
    var soundLoop: Bool?
    
    init (descriptionText: String, firstCardText: String, secondCardText: String,
          firstCardImageName: String, secondCardImageName: String, nextFirstDialogue: String? = "",
          nextSecondDialogue: String? = "", herosJourneysStage: String, soundTrigger: String? = "",
          achievementTrigger: String? = "", genericTrigger: String? = "", soundLoop: Bool? = false) {
        self.descriptionText = descriptionText
        self.firstCardText = firstCardText
        self.secondCardText = secondCardText
        self.firstCardImageName = firstCardImageName
        self.secondCardImageName = secondCardImageName
        self.nextFirstDialogue = nextFirstDialogue
        self.nextSecondDialogue = nextSecondDialogue
        self.herosJourneysStage = herosJourneysStage
        self.soundTrigger = soundTrigger
        self.achievementTrigger = achievementTrigger
        self.genericTrigger = genericTrigger
        self.soundLoop = soundLoop
    }
}
