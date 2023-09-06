//
//  GameplayCardView.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import UIKit

protocol GameplayCardViewDelegate: AnyObject {
    func didTapCard(nextDialogueName: String)
}

class GameplayCardView: UIView {
    
    // MARK: - Properties
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    weak var delegate: GameplayCardViewDelegate?
    private let backImageView: UIImageView! = UIImageView(image: UIImage(named: "gameplayCard_empty"))
    private var frontImageView = UIImageView()
    private var spinTimeInterval = 0.5
    var cardInfo: GameplayCardModel?
    
    private enum Strings {
        static let nibName = "GameplayCardView"
    }
    
    private enum Fonts {
        static let title = UIFont(name: "Macondo-Regular", size: 13)
    }
    
    // MARK: - Init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(Strings.nibName, owner: self, options: nil)
        addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.titleLabel.font = Fonts.title
        self.titleLabel.textColor = UIColor(named: "ArielDark")
    }
    
    // MARK: - Methods
    func setupCard(cardInfo: GameplayCardModel) {
        self.cardInfo = cardInfo
        self.titleLabel.text = cardInfo.title
        self.titleLabel.isHidden = !cardInfo.isFlipped
        self.frontImageView.image = UIImage(named: cardInfo.image)
        self.configFlipView()
    }
    
    private func configFlipView() {
        backImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        backImageView.contentMode = .scaleToFill
        
        frontImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        frontImageView.contentMode = .scaleToFill
        
        if let cardInfo = cardInfo {
            frontImageView.isHidden = cardInfo.isFlipped
            backImageView.isHidden = !cardInfo.isFlipped
        }
        
        contentView.addSubview(backImageView)
        contentView.sendSubviewToBack(backImageView)
        contentView.addSubview(frontImageView)
        contentView.sendSubviewToBack(frontImageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.contentView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let cardInfo = cardInfo, !cardInfo.isFlipped {
            delegate?.didTapCard(nextDialogueName: cardInfo.nextDialogue)
        }
    }
    
    func flip() {
        if var displayFlipItem = self.cardInfo {
            frontImageView.isHidden = !displayFlipItem.isFlipped
            backImageView.isHidden = displayFlipItem.isFlipped
            titleLabel.isHidden = !displayFlipItem.isFlipped
            
            UIView.transition(from: displayFlipItem.isFlipped ? frontImageView : backImageView,
                              to: displayFlipItem.isFlipped ? frontImageView : backImageView,
                              duration: spinTimeInterval,
                              options: [.transitionFlipFromLeft, .showHideTransitionViews])
            
            displayFlipItem.isFlipped = !displayFlipItem.isFlipped
            self.cardInfo = displayFlipItem
        }
    }
}
