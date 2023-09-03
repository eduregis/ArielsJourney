//
//  HerosJourneyModel.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import Foundation

struct HerosJourneyModel: Hashable {
    var descriptionText: String
    var imageName: String
    var herosJourneysStage: String
    
    init (descriptionText: String, imageName: String, herosJourneysStage: String) {
        self.descriptionText = descriptionText
        self.imageName = imageName
        self.herosJourneysStage = herosJourneysStage
    }
}
