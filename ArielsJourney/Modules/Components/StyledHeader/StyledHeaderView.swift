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
//      static let title = UIFont.bold(ofSize: 16, new: true)
    }
    
    private enum Constants {
      static let backImage = UIImage(named: "ic_voltar_new")?.withRenderingMode(.alwaysTemplate)
      static let homeImage = UIImage(named: "ic_botao_home")?.withRenderingMode(.alwaysTemplate)
    }
    
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
//      titleLabel.font = Fonts.title
        self.backButton.setTitle("", for: .normal)
        self.configButton.setTitle("", for: .normal)
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "dark_flat_pattern") ?? UIImage())
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        delegate?.didTapBackButton()
    }
    
    
    @IBAction func configButtonAction(_ sender: Any) {
        delegate?.didTapConfigButton()
    }
    
}
