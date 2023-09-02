//
//  AchievementsScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import SwiftUI

protocol AchievementsScreenPresenterDelegate: BasePresenterDelegate {
}

class AchievementsScreenPresenter {
    
    weak var delegate: AchievementsScreenPresenterDelegate?
    let router: AchievementsScreenRouter
    
    init(delegate: AchievementsScreenPresenterDelegate, router: AchievementsScreenRouter) {
        
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
        print("Home <- Conquistas")
        self.router.pop(animated: true)
    }
}
