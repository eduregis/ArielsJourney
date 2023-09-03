//
//  StyledHeaderScreenView.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import UIKit

protocol StyledHeaderScreenViewDelegate: AnyObject {
    func didTapBackButton()
    func didTapConfigButton()
}

class StyledHeaderScreenView: UIView {
    
    // MARK: - Outlets
    @IBOutlet weak var centerIcon: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstAdornment: UIImageView!
    @IBOutlet weak var secondAdornment: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var configButton: UIButton!
    
    // MARK: - Properties
    weak var delegate: StyledHeaderScreenViewDelegate?
    var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    private enum Strings {
        static let nibName = "StyledHeaderScreenView"
    }
    
    private enum Fonts {
        static let title = UIFont(name: "Macondo-Regular", size: 20)
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
        self.centerIcon.isHidden = true
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func configView() {
        self.titleLabel.font = Fonts.title
        self.titleLabel.textColor = UIColor(named: "ArielText")
        self.backButton.setTitle("", for: .normal)
        self.configButton.setTitle("", for: .normal)
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "darkFlatPattern") ?? UIImage())
    }
    
    // MARK: - Methods
    
    func hideAdornments() {
        self.firstAdornment.isHidden = true
        self.secondAdornment.isHidden = true
    }
    
    func hideBackground() {
        self.contentView.backgroundColor = .clear
        self.overlayView.isHidden = true
    }
    
    func showCenterIcon() {
        self.centerIcon.isHidden = false
        self.titleLabel.isHidden = true
        self.backButton.isHidden = true
    }
    
    // MARK: - Actions
    @IBAction func backButtonAction(_ sender: Any) {
        delegate?.didTapBackButton()
    }
    
    
    @IBAction func configButtonAction(_ sender: Any) {
        delegate?.didTapConfigButton()
    }
    
}
