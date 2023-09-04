//
//  ElementDetailsSheetViewController.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import UIKit

class ElementDetailsSheetViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var headerView: StyledHeaderSheetView!
    @IBOutlet weak var descriptionText: UILabel!
    
    // MARK: - Properties
    var presenter: ElementDetailsSheetPresenter!
    
    private enum Fonts {
        static let description = UIFont(name: "Macondo-Regular", size: 16)
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
        if let archetype = presenter.archetype {
            self.headerView.titleLabel.text = archetype.archetypeStage
            self.descriptionText.text = archetype.descriptionText
            self.descriptionText.font = Fonts.description
            self.descriptionText.textColor = UIColor(named: "ArielText")
        }
        if let herosJourney = presenter.herosJourney {
            self.headerView.titleLabel.text = herosJourney.herosJourneysStage
            self.descriptionText.text = herosJourney.descriptionText
            self.descriptionText.font = Fonts.description
            self.descriptionText.textColor = UIColor(named: "ArielText")
        }
        self.view.backgroundColor = UIColor(named: "ArielBackground")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }
}

// MARK: - ElementDetailsSheetPresenterDelegate
extension ElementDetailsSheetViewController: ElementDetailsSheetPresenterDelegate {
    func didLoadRemoteConfig() {
    }
}

extension ElementDetailsSheetViewController: StyledHeaderSheetViewDelegate {
}
