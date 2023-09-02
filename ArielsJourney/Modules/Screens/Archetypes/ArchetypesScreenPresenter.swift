//
//  ArchetypesScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import Foundation

protocol ArchetypesScreenPresenterDelegate: BasePresenterDelegate {
}

class ArchetypesScreenPresenter {
    
    weak var delegate: ArchetypesScreenPresenterDelegate?
    let router: ArchetypesScreenRouter
    
    init(delegate: ArchetypesScreenPresenterDelegate, router: ArchetypesScreenRouter) {
        
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
    
    func navigateToHome() {
        print("Home <- Arquétipos")
        self.router.pop(animated: true)
    }
}