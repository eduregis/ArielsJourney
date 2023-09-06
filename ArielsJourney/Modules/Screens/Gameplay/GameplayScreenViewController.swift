//
//  GameplayScreenViewController.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

enum GameplayAnimatedElements {
    case aboveToScreen
    case screenToBelow
    case belowToAbove
}

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
        self.headerView.hideBackground()
        self.blurBackground(backgroundName: "background_placeholder")
        self.letterText.font = Fonts.text
        self.letterText.textColor = UIColor(named: "ArielDark")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
        animateElements(animatedDirection: .aboveToScreen)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }
    
    // MARK: - Methods
}

// MARK: - GameplayScreenPresenterDelegate
extension GameplayScreenViewController: GameplayScreenPresenterDelegate {
    
    func animateElements(animatedDirection: GameplayAnimatedElements) {
        
        var movePoint: CGPoint = .zero
        
        switch animatedDirection {
        case .aboveToScreen:
            movePoint = CGPoint(x: 100, y: UIScreen.main.bounds.width)
        case .screenToBelow:
            movePoint = CGPoint(x: -100, y: UIScreen.main.bounds.width)
        case .belowToAbove:
            movePoint = CGPoint(x: 0, y: -2 * UIScreen.main.bounds.width)
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn,
                       animations: ({ [self] in
            self.firstCard.frame.origin = CGPoint(x: self.firstCard.frame.origin.x + movePoint.x, y: self.firstCard.frame.origin.y + movePoint.y)
            self.secondCard.frame.origin = CGPoint(x: self.secondCard.frame.origin.x - movePoint.x, y: self.secondCard.frame.origin.y + movePoint.y)
            self.letterContainer.frame.origin = CGPoint(x: self.letterContainer.frame.origin.x, y: self.letterContainer.frame.origin.y + movePoint.y)
        }), completion: {_ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                switch animatedDirection {
                case .aboveToScreen:
                    startTypingText()
                case .screenToBelow:
                    firstCard.isHidden = true
                    secondCard.isHidden = true
                    letterContainer.isHidden = true
                    animateElements(animatedDirection: .belowToAbove)
                case .belowToAbove:
                    flipCards()
                    firstCard.isHidden = false
                    secondCard.isHidden = false
                    letterContainer.isHidden = false
                    letterText.text = ""
                    animateElements(animatedDirection: .aboveToScreen)
                }
            }
        })
    }
    
    func flipCards() {
        self.firstCard.flip()
        self.secondCard.flip()
    }
    
    func setDialogueAndCards() {
        if let dialogue = presenter.dialogue {
            self.firstCard.setupCard(cardInfo: GameplayCardModel(image: dialogue.firstCardImageName, title: dialogue.firstCardText, isFlipped: true))
            self.secondCard.setupCard(cardInfo: GameplayCardModel(image: dialogue.secondCardImageName, title: dialogue.secondCardText, isFlipped: true))
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

extension GameplayScreenViewController: GameplayCardViewDelegate {
    func didTapCard() {
        animateElements(animatedDirection: .screenToBelow)
    }
}
