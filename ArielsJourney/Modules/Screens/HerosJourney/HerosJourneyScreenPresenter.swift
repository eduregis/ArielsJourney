//
//  HerosJourneyScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import Foundation

protocol HerosJourneyScreenPresenterDelegate: BasePresenterDelegate {
}

class HerosJourneyScreenPresenter {
    
    // MARK: - Properties
    weak var delegate: HerosJourneyScreenPresenterDelegate?
    let router: HerosJourneyScreenRouter
    var activeHerosJourney: Int = 0
    
    // MARK: - Init
    init(delegate: HerosJourneyScreenPresenterDelegate, router: HerosJourneyScreenRouter) {
        self.delegate = delegate
        self.router = router
        self.activeHerosJourney = UserDefaults.standard.integer(forKey: UserDefaults.Keys.activeHerosJourney.description)
    }
    
    // MARK: - Lifecycle
    func didLoad() {
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    //  MARK: - Methods
    
    // MARK: - Navigation
    func showConfigurations() {
        self.router.showConfigurations()
    }
    
    func navigateToHome() {
        print("Home <- Jornada do Herói")
        self.router.pop(animated: true)
    }
    
    func didTapCard(cardInfo: HerosJourneyModel) {
        self.router.showElementDetails(herosJourney: cardInfo)
    }
}
