//
//  GameplayScreenViewController.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

class GameplayScreenViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var headerView: StyledHeaderScreenView!
    @IBOutlet weak var firstCard: GameplayCardView!
    @IBOutlet weak var secondCard: GameplayCardView!
    
    // MARK: - Properties
    var presenter: GameplayScreenPresenter!
    
    // MARK: - View Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
        self.headerView.delegate = self
        self.headerView.hideBackground()
        self.blurBackground(backgroundName: "background_placeholder")
        self.firstCard.setupCard(cardInfo: GameplayCardModel(image: "gameplayCard_MC_01", title: "Teste1", isCardSelected: true))
        self.secondCard.setupCard(cardInfo: GameplayCardModel(image: "gameplayCard_MC_01", title: "Teste2", isCardSelected: true))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }
    

}

// MARK: - GameplayScreenPresenterDelegate
extension GameplayScreenViewController: GameplayScreenPresenterDelegate {
    
    func didLoadRemoteConfig() {
    }
}

extension GameplayScreenViewController: StyledHeaderScreenViewDelegate {
    func didTapBackButton() {
        self.presenter.navigateToHome()
    }
    
    func didTapConfigButton() {
        self.presenter.showConfigurations()
    }
}
