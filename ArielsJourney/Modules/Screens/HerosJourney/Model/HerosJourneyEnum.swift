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
                            imageName: "Poder",
                            herosJourneysStage: HerosJourneyScreenTexts.firstTitle.localized())
        case .callToAdventure:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.secondDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.secondTitle.localized())
        case .refusalOfTheCall:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.thirdDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.thirdTitle.localized())
        case .meetingTheMentor:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.fourthDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.fourthTitle.localized())
        case .crossingTheThreshold:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.fifthDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.fifthTitle.localized())
        case .testsAlliesEnemies:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.sixthDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.sixthTitle.localized())
        case .approachToTheInmostCave:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.seventhDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.seventhTitle.localized())
        case .ordeal:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.eighthDesc.localized(),
                            imageName: "Capela",
                            herosJourneysStage: HerosJourneyScreenTexts.eighthTitle.localized())
        case .reward:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.ninthDesc.localized(),
                            imageName: "Capela",
                                     herosJourneysStage: HerosJourneyScreenTexts.ninthTitle.localized())
        case .theRoadBack:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.tenthDesc.localized(),
                            imageName: "Capela",
                                     herosJourneysStage: HerosJourneyScreenTexts.tenthTitle.localized())
        case .resurrection:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.eleventhDesc.localized(),
                            imageName: "Capela",
                                     herosJourneysStage: HerosJourneyScreenTexts.eleventhTitle.localized())
        case .returnWithTheElixir:
            return HerosJourneyModel(descriptionText: HerosJourneyScreenTexts.twelfthDesc.localized(),
                            imageName: "Capela",
                                     herosJourneysStage: HerosJourneyScreenTexts.twelfthTitle.localized())
        }
    }
}
