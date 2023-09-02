//
//  StyledHeaderView.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import UIKit

protocol StyledHeaderViewDelegate: AnyObject {
    func didTapBackButton()
    func didTapConfigButton()
}

class StyledHeaderView: UIView {
    
    @IBOutlet weak var centerIcon: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var configButton: UIButton!
    
    weak var delegate: StyledHeaderViewDelegate?
    var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    private enum Strings {
        static let nibName = "StyledHeaderView"
    }
    
    private enum Fonts {
        static let title = UIFont(name: "Macondo-Regular", size: 22)
    }
    
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
    
    func hideBackButton() {
        self.backButton.isHidden = true
    }
    
    func showCenterIcon() {
        self.centerIcon.isHidden = false
        self.titleLabel.isHidden = true
        self.backButton.isHidden = true
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        delegate?.didTapBackButton()
    }
    
    
    @IBAction func configButtonAction(_ sender: Any) {
        delegate?.didTapConfigButton()
    }
    
}
