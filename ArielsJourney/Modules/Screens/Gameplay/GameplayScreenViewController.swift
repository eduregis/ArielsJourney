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
    @IBOutlet weak var letterText: UILabel!
    
    // MARK: - Properties
    var presenter: GameplayScreenPresenter!
    
    private enum Fonts {
        static let text = UIFont(name: "Macondo-Regular", size: 13)
    }
    
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
        self.letterText.font = Fonts.text
        self.letterText.textColor = UIColor(named: "ArielDark")
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
    
    func flipCards() {
        self.firstCard.flip()
        self.secondCard.flip()
    }
    
    func setDialogueAndCards() {
        if let dialogue = presenter.dialogue {
            self.firstCard.setupCard(cardInfo: GameplayCardModel(image: dialogue.firstCardImageName, title: dialogue.firstCardText, isCardSelected: true))
            self.secondCard.setupCard(cardInfo: GameplayCardModel(image: dialogue.secondCardImageName, title: dialogue.secondCardText, isCardSelected: true))
            self.letterText.text = dialogue.descriptionText
        }
    }
    
    func startTypingText() {
        if let dialogue = presenter.dialogue {
            letterText.setTyping(text: dialogue.descriptionText, completion: {
                DispatchQueue.main.async {
                    self.flipCards()
                }
            })
        }
        
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
