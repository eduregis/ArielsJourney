//
//  ArchetypesModel.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import Foundation

struct ArchetypeModel: Hashable {
    var descriptionText: String
    var imageName: String
    var archetypeStage: String
    
    init (descriptionText: String, imageName: String, archetypeStage: String) {
        self.descriptionText = descriptionText
        self.imageName = imageName
        self.archetypeStage = archetypeStage
    }
}

enum ArchetypesEnum: CaseIterable {
    
    case hero, mentor, refusalOfTheCall, meetingTheMentor, crossingTheThreshold, testsAlliesEnemies, approachToTheInmostCave, ordeal
    
    var archetypesModel: ArchetypeModel {
        switch self {
        case .hero:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.firstDesc.localized(),
                            imageName: "01",
                            archetypeStage: ArchetypesScreenTexts.firstTitle.localized())
        case .mentor:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.secondDesc.localized(),
                            imageName: "02",
                            archetypeStage: ArchetypesScreenTexts.secondTitle.localized())
        case .refusalOfTheCall:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.thirdDesc.localized(),
                            imageName: "03",
                                  archetypeStage: ArchetypesScreenTexts.thirdTitle.localized())
        case .meetingTheMentor:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.fourthDesc.localized(),
                            imageName: "04",
                                  archetypeStage: ArchetypesScreenTexts.fourthTitle.localized())
        case .crossingTheThreshold:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.fifthDesc.localized(),
                            imageName: "05",
                                  archetypeStage: ArchetypesScreenTexts.fifthTitle.localized())
        case .testsAlliesEnemies:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.sixthDesc.localized(),
                            imageName: "06",
                                  archetypeStage: ArchetypesScreenTexts.sixthTitle.localized())
        case .approachToTheInmostCave:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.seventhDesc.localized(),
                            imageName: "07",
                                  archetypeStage: ArchetypesScreenTexts.seventhTitle.localized())
        case .ordeal:
            return ArchetypeModel(descriptionText: ArchetypesScreenTexts.eighthDesc.localized(),
                            imageName: "08",
                                  archetypeStage: ArchetypesScreenTexts.eighthTitle.localized())
        }
    }
}

