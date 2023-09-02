//
//  SplashScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import Foundation

protocol SplashScreenPresenterDelegate: BasePresenterDelegate {
}

class SplashScreenPresenter {
    
    weak var delegate: SplashScreenPresenterDelegate?
    let router: SplashScreenRouter
    
    init(delegate: SplashScreenPresenterDelegate, router: SplashScreenRouter) {
        
        self.delegate = delegate
        self.router = router
    }
    func didLoad() {
        navigateToHome()
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    func navigateToHome() {
        self.router.navigateToHome()
    }
}
