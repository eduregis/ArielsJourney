//
//  StyledHeaderSheetView.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

protocol StyledHeaderSheetViewDelegate: AnyObject {
}

class StyledHeaderSheetView: UIView {
    
    // MARK: - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var backgroundContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    weak var delegate: StyledHeaderSheetViewDelegate?
    var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    private enum Strings {
        static let nibName = "StyledHeaderSheetView"
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
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func configView() {
        self.titleLabel.font = Fonts.title
        self.titleLabel.textColor = UIColor(named: "ArielText")
        self.backgroundContainer.backgroundColor = UIColor(patternImage: UIImage(named: "darkFlatPattern") ?? UIImage())
    }
    
    // MARK: - Methods

    
    // MARK: - Actions
}
