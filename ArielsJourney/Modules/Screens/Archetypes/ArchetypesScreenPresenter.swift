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
    
    // MARK: - Properties
    weak var delegate: ArchetypesScreenPresenterDelegate?
    let router: ArchetypesScreenRouter
    var activeArchetypes: Int = 0
    
    var dateCells: [ArchetypeModel] = []
    let cellSize: CGSize = CGSize(width: 142, height: 249)
    
    // MARK: - Init
    init(delegate: ArchetypesScreenPresenterDelegate, router: ArchetypesScreenRouter) {
        self.delegate = delegate
        self.router = router
        self.activeArchetypes = UserDefaults.standard.integer(forKey: UserDefaults.Keys.activeArchetypes.description)
    }
    
    // MARK: - Lifecycle
    func didLoad() {
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    //  MARK: - Methods
    func getArchetypes(completion: @escaping () -> Void) {
        for archetype in ArchetypesEnum.allCases {
            dateCells.append(archetype.archetypesModel)
        }
        completion()
    }
    
    // MARK: - Navigation
    func showConfigurations() {
        self.router.showConfigurations()
    }
    
    func navigateToHome() {
        print("Home <- Arquétipos")
        self.router.pop(animated: true)
    }
    
    func showElementDetails(index: Int) {
        let archetype = self.dateCells[index]
        self.router.showElementDetails(archetype: archetype)
    }
}
