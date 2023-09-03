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
    
    weak var delegate: HerosJourneyScreenPresenterDelegate?
    let router: HerosJourneyScreenRouter
    
    init(delegate: HerosJourneyScreenPresenterDelegate, router: HerosJourneyScreenRouter) {
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
    
    func showArcheetypeDetails() {
        self.router.showConfigurations()
    }
    
    func navigateToHome() {
        print("Home <- Jornada do Herói")
        self.router.pop(animated: true)
    }
    
    func didTapCard(cardInfo: HerosJourneyModel) {
        // TODO: - TROCAR PARA MODAL PROPRIO
        self.router.showConfigurations()
        print(cardInfo.descriptionText)
    }
}
