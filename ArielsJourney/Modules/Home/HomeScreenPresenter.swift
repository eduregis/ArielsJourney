//
//  HomeScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import SwiftUI

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
    
    func navigateToGameplay() {
        self.router.navigateToGameplay()
    }
    
    func navigateToContinue() {
        self.router.navigateToContinue()
    }
    
}
