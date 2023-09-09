//
//  HomeScreenModel.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import Foundation

struct HomeModel: Hashable {
    var imageName: String
    var title: String
    
    init (imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
}

enum HomeEnum: CaseIterable {
    case gameplayNew, gameplayContinue, herosJourney, archetypes, achievements
    
    var homeModel: HomeModel {
        switch self {
        case .gameplayNew:
            return HomeModel(imageName: "stainedGlassNewGame", title: HomeScreenTexts.gameplayNew.localized())
        case .gameplayContinue:
            return HomeModel(imageName: "stainedGlassNewGame", title: HomeScreenTexts.gameplayContinue.localized())
        case .herosJourney:
            return HomeModel(imageName: "stainedGlassNewGame", title: HomeScreenTexts.herosJourney.localized())
        case .archetypes:
            return HomeModel(imageName: "stainedGlassNewGame", title: HomeScreenTexts.archetypes.localized())
        case .achievements:
            return HomeModel(imageName: "stainedGlassNewGame", title: HomeScreenTexts.achievements.localized())
        }
    }
}
