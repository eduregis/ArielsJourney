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
    
    // MARK: - Properties
    weak var delegate: HomeScreenPresenterDelegate?
    let router: HomeScreenRouter
    
    var dateCells: [HomeEnum] = []
    var cellSize: CGSize = CGSize(width: 142, height: 275)
    
    // MARK: - Init
    init(delegate: HomeScreenPresenterDelegate, router: HomeScreenRouter) {
        
        self.delegate = delegate
        self.router = router
    }
    
    // MARK: - Lifecycle
    func didLoad() {
    }
    
    func willAppear() {
        dateCells = HomeEnum.allCases
    }
    
    func didAppear() {
    }
    
    func didDisappear() {
        dateCells = []
    }
    
    //  MARK: - Methods
    
    // MARK: - Navigation
    func showConfigurations() {
        self.router.showConfigurations()
    }
    
    func didTapButton(tag: HomeEnum) {
        switch tag {
        case .gameplayNew:
            self.router.navigateToGameplay()
            UserDefaults.standard.set(true, forKey: UserDefaults.Keys.gameInProgress.description)
        case .gameplayContinue:
            if UserDefaults.standard.bool(forKey: UserDefaults.Keys.gameInProgress.description) {
                self.router.navigateToContinue()
            }
        case .herosJourney:
            self.router.navigateToHerosJourney()
        case .archetypes:
            self.router.navigateToArchetypes()
        case .achievements:
            self.router.navigateToAchievements()
        }
    }
}
