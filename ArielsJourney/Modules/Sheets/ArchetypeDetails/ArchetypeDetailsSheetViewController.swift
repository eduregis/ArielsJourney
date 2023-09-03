//
//  ArchetypeDetailsSheetViewController.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import UIKit

class ArchetypeDetailsSheetViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var headerView: StyledHeaderSheetView!
    @IBOutlet weak var descriptionText: UILabel!
    
    // MARK: - Properties
    var presenter: ArchetypeDetailsSheetPresenter!
    
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

// MARK: - ArchetypeDetailsSheetPresenterDelegate
extension ArchetypeDetailsSheetViewController: ArchetypeDetailsSheetPresenterDelegate {
    func didLoadRemoteConfig() {
    }
}

extension ArchetypeDetailsSheetViewController: StyledHeaderSheetViewDelegate {
}
