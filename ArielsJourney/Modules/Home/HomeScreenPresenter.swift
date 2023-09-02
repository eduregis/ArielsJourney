//
//  HomeScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import SwiftUI

enum HomeScreenTags: Int {
    case gameplayNew = 0
    case gameplayContinue = 1
    case herosJourney = 2
    case archetypes = 3
    case achievements = 4
    
    var description: String {
        switch self {
        case .gameplayNew: return "Novo Jogo"
        case .gameplayContinue: return "Continuar"
        case .herosJourney: return "Jornada do Herói"
        case .archetypes: return "Arquétipos"
        case .achievements: return "Conquistas"
        }
    }
}

protocol HomeScreenPresenterDelegate: BasePresenterDelegate {
}

class HomeScreenPresenter {
    
    weak var delegate: HomeScreenPresenterDelegate?
    let router: HomeScreenRouter
    
    init(delegate: HomeScreenPresenterDelegate, router: HomeScreenRouter) {
        
        self.delegate = delegate
        self.router = router
    }
    
    func didLoad() {
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    func didTapButton(tag: HomeScreenTags) {
        switch tag {
        case .gameplayNew:
            self.router.navigateToGameplay()
        case .gameplayContinue:
            self.router.navigateToContinue()
        case .herosJourney:
            self.router.navigateToHerosJourney()
        case .archetypes:
            self.router.navigateToGameplay()
        case .achievements:
            self.router.navigateToGameplay()
        }
    }
}
