//
//  GameplayScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import Foundation

protocol GameplayScreenPresenterDelegate: BasePresenterDelegate {
    func flipCards()
    func setDialogueAndCards()
    func startTypingText()
}

class GameplayScreenPresenter {
    
    // MARK: - Properties
    weak var delegate: GameplayScreenPresenterDelegate?
    let router: GameplayScreenRouter
    var dialogue: Dialogue?
    
    // MARK: - Init
    init(delegate: GameplayScreenPresenterDelegate, router: GameplayScreenRouter) {
        
        self.delegate = delegate
        self.router = router
    }
 
    // MARK: - Lifecycle Methods
    func didLoad() {
        
        guard let dialogue = GameplayDialogueManager.shared.getDialogueByString(name: "MC_01") else { return }
        
        self.dialogue = dialogue
        self.delegate?.setDialogueAndCards()
        self.delegate?.startTypingText()
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    // MARK: - Navigation
    func showConfigurations() {
        self.router.showConfigurations()
    }
    
    func navigateToHome() {
        print("Home <- Gameplay")
        self.router.pop(animated: true)
    }
}
