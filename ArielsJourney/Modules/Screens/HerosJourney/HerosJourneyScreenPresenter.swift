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
    var herosJourneyList: [HerosJourneyModel] = []
    
    init(delegate: HerosJourneyScreenPresenterDelegate, router: HerosJourneyScreenRouter) {
        
        self.delegate = delegate
        self.router = router
    }
    
    func didLoad() {
    }
    
    func willAppear() {
        HerosJourneyEnum.allCases.forEach {
            herosJourneyList.append($0.herosJourneyModel)
        }
        print(herosJourneyList)
    }
    
    func didAppear() {
        
    }
    
    func showConfigurations() {
        self.router.showConfigurations()
    }
    
    func navigateToHome() {
        print("Home <- Jornada do Herói")
        self.router.pop(animated: true)
    }
}
