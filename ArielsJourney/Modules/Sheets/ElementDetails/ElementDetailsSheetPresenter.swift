//
//  ElementDetailsSheetPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import Foundation

protocol ElementDetailsSheetPresenterDelegate: BasePresenterDelegate {
}

class ElementDetailsSheetPresenter {
    
    weak var delegate: ElementDetailsSheetPresenterDelegate?
    let router: ElementDetailsSheetRouter
    var archetype: ArchetypeModel?
    var herosJourney: HerosJourneyModel?
    
    init(delegate: ElementDetailsSheetPresenterDelegate, router: ElementDetailsSheetRouter) {
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
