//
//  HomeScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import Foundation

protocol HomeScreenPresenterDelegate: BasePresenterDelegate {
}

class HomeScreenPresenter {
    
    weak var delegate: HomeScreenPresenterDelegate?
    let router: HomeScreenRouter
    
    var dateCells: [HomeEnum] = HomeEnum.allCases
    
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
    
    func showConfigurations() {
        self.router.showConfigurations()
    }
    
    func didTapButton(tag: HomeEnum) {
        switch tag {
        case .gameplayNew:
            self.router.navigateToGameplay()
        case .gameplayContinue:
            self.router.navigateToContinue()
        case .herosJourney:
            self.router.navigateToHerosJourney()
        case .archetypes:
            self.router.navigateToArchetypes()
        case .achievements:
            self.router.navigateToAchievements()
        }
    }
}
