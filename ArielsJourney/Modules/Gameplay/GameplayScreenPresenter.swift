//
//  GameplayScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import SwiftUI

protocol GameplayScreenPresenterDelegate: BasePresenterDelegate {
}

class GameplayScreenPresenter {
    
    weak var delegate: GameplayScreenPresenterDelegate?
    let router: GameplayScreenRouter
    
    init(delegate: GameplayScreenPresenterDelegate, router: GameplayScreenRouter) {
        
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
        print("Home <- Gameplay")
        self.router.pop(animated: true)
    }
}
