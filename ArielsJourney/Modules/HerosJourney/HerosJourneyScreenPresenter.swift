//
//  HerosJourneyScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import SwiftUI

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
    
    func navigateToHome() {
        print("Home <- Jornada do Herói")
        self.router.pop(animated: true)
    }
}
