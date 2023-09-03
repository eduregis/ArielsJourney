//
//  HerosJourneyList.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import Foundation

enum HerosJourneyEnum: CaseIterable {
    
    case ordinaryWorld, callToAdventure, refusalOfTheCall, meetingTheMentor, crossingTheThreshold, testsAlliesEnemies, approachToTheInmostCave, ordeal, reward, theRoadBack, resurrection, returnWithTheElixir
    
    var herosJourneyModel: HerosJourneyModel {
        switch self {
        case .ordinaryWorld:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.firstDesc.localized(),
                            imageName: "herosJourneyCard_01",
                            herosJourneysStage: HerosJourneyScreenTexts.firstTitle.localized())
        case .callToAdventure:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.secondDesc.localized(),
                            imageName: "herosJourneyCard_01",
                            herosJourneysStage: HerosJourneyScreenTexts.secondTitle.localized())
        case .refusalOfTheCall:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.thirdDesc.localized(),
                            imageName: "herosJourneyCard_01",
                            herosJourneysStage: HerosJourneyScreenTexts.thirdTitle.localized())
        case .meetingTheMentor:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.fourthDesc.localized(),
                            imageName: "herosJourneyCard_01",
                            herosJourneysStage: HerosJourneyScreenTexts.fourthTitle.localized())
        case .crossingTheThreshold:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.fifthDesc.localized(),
                            imageName: "herosJourneyCard_01",
                            herosJourneysStage: HerosJourneyScreenTexts.fifthTitle.localized())
        case .testsAlliesEnemies:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.sixthDesc.localized(),
                            imageName: "herosJourneyCard_01",
                            herosJourneysStage: HerosJourneyScreenTexts.sixthTitle.localized())
        case .approachToTheInmostCave:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.seventhDesc.localized(),
                            imageName: "herosJourneyCard_01",
                            herosJourneysStage: HerosJourneyScreenTexts.seventhTitle.localized())
        case .ordeal:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.eighthDesc.localized(),
                            imageName: "herosJourneyCard_01",
                            herosJourneysStage: HerosJourneyScreenTexts.eighthTitle.localized())
        case .reward:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.ninthDesc.localized(),
                            imageName: "herosJourneyCard_01",
                                     herosJourneysStage: HerosJourneyScreenTexts.ninthTitle.localized())
        case .theRoadBack:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.tenthDesc.localized(),
                            imageName: "herosJourneyCard_01",
                                     herosJourneysStage: HerosJourneyScreenTexts.tenthTitle.localized())
        case .resurrection:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.eleventhDesc.localized(),
                            imageName: "herosJourneyCard_01",
                                     herosJourneysStage: HerosJourneyScreenTexts.eleventhTitle.localized())
        case .returnWithTheElixir:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.twelfthDesc.localized(),
                            imageName: "herosJourneyCard_01",
                                     herosJourneysStage: HerosJourneyScreenTexts.twelfthTitle.localized())
        }
    }
}
