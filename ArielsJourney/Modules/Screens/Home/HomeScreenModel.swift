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
            return HomeModel(imageName: "stainedGlassNewGame", title: "Novo Jogo")
        case .gameplayContinue:
            return HomeModel(imageName: "stainedGlassNewGame", title: "Continuar")
        case .herosJourney:
            return HomeModel(imageName: "stainedGlassNewGame", title: "Jornada do Herói")
        case .archetypes:
            return HomeModel(imageName: "stainedGlassNewGame", title: "Arquétipos")
        case .achievements:
            return HomeModel(imageName: "stainedGlassNewGame", title: "Conquistas")
        }
    }
}
