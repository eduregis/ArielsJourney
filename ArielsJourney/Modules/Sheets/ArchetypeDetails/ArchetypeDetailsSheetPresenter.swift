//
//  ArchetypeDetailsSheetPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import Foundation

protocol ArchetypeDetailsSheetPresenterDelegate: BasePresenterDelegate {
}

class ArchetypeDetailsSheetPresenter {
    
    weak var delegate: ArchetypeDetailsSheetPresenterDelegate?
    let router: ArchetypeDetailsSheetRouter
    var archetype: ArchetypeModel?
    
    init(delegate: ArchetypeDetailsSheetPresenterDelegate, router: ArchetypeDetailsSheetRouter) {
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
