//
//  AchievementsScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import Foundation

protocol AchievementsScreenPresenterDelegate: BasePresenterDelegate {
}

class AchievementsScreenPresenter {
    
    // MARK: - Properties
    weak var delegate: AchievementsScreenPresenterDelegate?
    let router: AchievementsScreenRouter
    
    // MARK: - Init
    init(delegate: AchievementsScreenPresenterDelegate, router: AchievementsScreenRouter) {
        
        self.delegate = delegate
        self.router = router
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
        print("Home <- Conquistas")
        self.router.pop(animated: true)
    }
}
