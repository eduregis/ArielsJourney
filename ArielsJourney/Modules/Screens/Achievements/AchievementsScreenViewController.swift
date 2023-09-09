//
//  AchievementsScreenViewController.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import Foundation

import UIKit

class AchievementsScreenViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var headerView: StyledHeaderScreenView!
    
    // MARK: - Properties
    var presenter: AchievementsScreenPresenter!
    
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
        self.headerView.titleLabel.text = AchievementsScreenTexts.title.localized()
        self.headerView.hideAdornments()
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

// MARK: - AchievementsScreenPresenterDelegate
extension AchievementsScreenViewController: AchievementsScreenPresenterDelegate {

}

extension AchievementsScreenViewController: StyledHeaderScreenViewDelegate {
    func didTapBackButton() {
        self.presenter.navigateToHome()
    }
    
    func didTapConfigButton() {
        self.presenter.showConfigurations()
    }
}
