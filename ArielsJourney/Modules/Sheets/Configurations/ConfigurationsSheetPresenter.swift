//
//  ConfigurationsSheetPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import Foundation

protocol ConfigurationsSheetPresenterDelegate: BasePresenterDelegate {
}

class ConfigurationsSheetPresenter {
    
    weak var delegate: ConfigurationsSheetPresenterDelegate?
    let router: ConfigurationsSheetRouter
    
    init(delegate: ConfigurationsSheetPresenterDelegate, router: ConfigurationsSheetRouter) {
        
        self.delegate = delegate
        self.router = router
    }
    
    func didLoad() {
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
}
