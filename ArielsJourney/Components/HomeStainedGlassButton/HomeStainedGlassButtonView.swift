//
//  HomeStainedGlassButtonView.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import UIKit

protocol HomeStainedGlassButtonViewDelegate: AnyObject {
    func didTapButton(tag: HomeScreenTags)
}

class HomeStainedGlassButtonView: UIView {
    
    // MARK: - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stainedGlassImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    weak var delegate: HomeStainedGlassButtonViewDelegate?
    var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    var tagButton: HomeScreenTags?
    
    private enum Strings {
        static let nibName = "HomeStainedGlassButtonView"
    }
    
    private enum Fonts {
        static let title = UIFont(name: "Macondo-Regular", size: 14)
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
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.contentView.addGestureRecognizer(tap)
    }
    
    private func configView() {
        self.titleLabel.font = Fonts.title
        self.titleLabel.textColor = UIColor(named: "ArielDark")
        self.stainedGlassImage.backgroundColor = .clear
        self.stainedGlassImage.image = UIImage(named: "stainedGlassNewGame")
        self.stainedGlassImage.contentMode = .scaleAspectFit
    }
    
    // MARK: - Methods
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        delegate?.didTapButton(tag: self.tagButton ?? HomeScreenTags.gameplayNew)
    }
}

