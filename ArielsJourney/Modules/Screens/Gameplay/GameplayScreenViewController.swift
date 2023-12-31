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
    @IBOutlet weak var letterContainer: UIView!
    @IBOutlet weak var letterText: UILabel!
    
    // MARK: - Properties
    var presenter: GameplayScreenPresenter!
    var firstCardOffset: CGPoint?
    var secondCardOffset: CGPoint?
    var letterOffset: CGPoint?
    
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
        self.firstCard.delegate = self
        self.secondCard.delegate = self
        self.firstCard.cardEnum = .left
        self.secondCard.cardEnum = .right
        self.headerView.hideBackground()
        self.blurBackground(backgroundName: "background_placeholder")
        self.letterText.font = Fonts.text
        self.letterText.textColor = UIColor(named: "ArielDark")
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.stopTypingText(_:)))
        self.letterContainer.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
        presenter.startNewDialogue()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }
    
    // MARK: - Methods
    @objc func stopTypingText(_ sender: UITapGestureRecognizer) {
        if let descriptionText = presenter.descriptionText, letterText.typingMode {
            letterText.typingMode = false
            letterText.attributedText = descriptionText
            DispatchQueue.main.async {
                self.flipCards()
            }
        }
    }
}

// MARK: - GameplayScreenPresenterDelegate
extension GameplayScreenViewController: GameplayScreenPresenterDelegate {
    
    func animateElements(animatedDirection: GameplayAnimatedElements, completionHandler: @escaping () -> Void) {
        
        let movePoint: CGPoint = presenter.getMovePoint(animatedDirection: animatedDirection)
        
        UIView.animate(withDuration: 0.6, delay: 0.1, options: .curveEaseIn,
                       animations: ({ [self] in
            self.firstCard.frame.origin = CGPoint(x: self.firstCard.frame.origin.x + movePoint.x, y: self.firstCard.frame.origin.y + movePoint.y)
            self.secondCard.frame.origin = CGPoint(x: self.secondCard.frame.origin.x - movePoint.x, y: self.secondCard.frame.origin.y + movePoint.y)
            self.letterContainer.frame.origin = CGPoint(x: self.letterContainer.frame.origin.x, y: self.letterContainer.frame.origin.y + movePoint.y)
        }), completion: { _ in
            completionHandler()
        })
    }
    
    func hideElements(isHidden: Bool) {
        firstCard.isHidden = isHidden
        secondCard.isHidden = isHidden
        letterContainer.isHidden = isHidden
        letterText.text = ""
    }
    
    func flipCards() {
        self.firstCard.flip()
        self.secondCard.flip()
    }
    
    func setDialogueAndCards() {
        if let dialogue = presenter.dialogue {
            presenter.setupDialogue(newDialogue: dialogue)
            self.firstCard.setupCard(cardInfo: GameplayCardModel(image: dialogue.firstCardImageName, title: dialogue.firstCardText, nextDialogue: dialogue.nextFirstDialogue ?? "", isFlipped: true))
            self.secondCard.setupCard(cardInfo: GameplayCardModel(image: dialogue.secondCardImageName, title: dialogue.secondCardText, nextDialogue: dialogue.nextSecondDialogue ?? "", isFlipped: true))
        }
    }
    
    func startTypingText() {
        if let descriptionText = presenter.descriptionText {
            letterText.setTypingAttributed(newText: descriptionText, completion: {
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

extension GameplayScreenViewController: GameplayCardViewDelegate {
    func didTapCard(nextDialogueName: String, cardEnum: CardEnum) {
        
        switch cardEnum {
        case .left:
            firstCard.growAndShrink()
        case .right:
            secondCard.growAndShrink()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            presenter.goToNextDialogue(nextDialogueName: nextDialogueName)
        }
    }
}

