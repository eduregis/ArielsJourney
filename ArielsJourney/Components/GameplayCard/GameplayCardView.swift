//
//  GameplayCardView.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import UIKit

protocol GameplayCardViewDelegate: AnyObject {
}

class GameplayCardView: UIView {
    
    // MARK: - Properties
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
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
    
    // MARK: - View Lifecycle
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
    
    func setupCard(cardInfo: GameplayCardModel) {
        self.cardInfo = cardInfo
        self.titleLabel.text = cardInfo.title
        self.titleLabel.isHidden = !cardInfo.isCardSelected
        self.frontImageView.image = UIImage(named: cardInfo.image)
        self.configFlipView()
    }
    
    private func configFlipView() {
        backImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        backImageView.contentMode = .scaleToFill
        
        frontImageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        frontImageView.contentMode = .scaleToFill
        
        if let cardInfo = cardInfo {
            frontImageView.isHidden = cardInfo.isCardSelected
            backImageView.isHidden = !cardInfo.isCardSelected
        }
        
        contentView.addSubview(backImageView)
        contentView.sendSubviewToBack(backImageView)
        contentView.addSubview(frontImageView)
        contentView.sendSubviewToBack(frontImageView)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(flipTapped))
        contentView.addGestureRecognizer(singleTap)
    }
    
    @objc func flipTapped() {
        flip(cardInfo: cardInfo!)
    }
    
    func flip(cardInfo: GameplayCardModel) {
        var displayFlipItem = cardInfo
        frontImageView.isHidden = !displayFlipItem.isCardSelected
        backImageView.isHidden = displayFlipItem.isCardSelected
        titleLabel.isHidden = !displayFlipItem.isCardSelected
        
        UIView.transition(from: displayFlipItem.isCardSelected ? frontImageView : backImageView,
                          to: displayFlipItem.isCardSelected ? frontImageView : backImageView,
                          duration: spinTimeInterval,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews])
        
        displayFlipItem.isCardSelected = !displayFlipItem.isCardSelected
        self.cardInfo = displayFlipItem
    }
}
