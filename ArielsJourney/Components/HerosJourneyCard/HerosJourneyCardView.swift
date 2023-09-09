//
//  HerosJourneyCardView.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

protocol HerosJourneyCardViewDelegate: AnyObject {
    func didTapCard(cardInfo: HerosJourneyModel)
}

class HerosJourneyCardView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var emptyCardImage: UIImageView!
    @IBOutlet weak var largeNumberLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // MARK: - Properties
    weak var delegate: HerosJourneyCardViewDelegate?
    var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    var cardInfo: HerosJourneyModel?
    
    private enum Strings {
        static let nibName = "HerosJourneyCardView"
    }
    
    private enum Fonts {
        static let title = UIFont(name: "Macondo-Regular", size: 11)
        static let number = UIFont(name: "Macondo-Regular", size: 13)
        static let largeNumber = UIFont(name: "Macondo-Regular", size: 32)
    }
    
    // MARK: - View Lifecycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.commonInit()
        self.configView()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(Strings.nibName, owner: self, options: nil)
        addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func configView() {
        self.titleLabel.font = Fonts.title
        self.titleLabel.textColor = UIColor(named: "ArielDark")
        self.numberLabel.font = Fonts.number
        self.numberLabel.textColor = UIColor(named: "ArielDark")
        self.largeNumberLabel.font = Fonts.largeNumber
        self.largeNumberLabel.textColor = UIColor(named: "ArielText")
        self.emptyCardImage.image = UIImage(named: "herosJourneyCard_empty")
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.contentView.addGestureRecognizer(tap)
    }
    
    // MARK: - Methods
    func setupCard(cardInfo: HerosJourneyModel) {
        self.cardInfo = cardInfo
        self.titleLabel.text = cardInfo.herosJourneysStage
        self.numberLabel.text = "I"
        self.cardImage.image = UIImage(named: cardInfo.imageName)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let cardInfo = self.cardInfo {
            delegate?.didTapCard(cardInfo: cardInfo)
        }
        
    }
    
    // MARK: - Actions
}
