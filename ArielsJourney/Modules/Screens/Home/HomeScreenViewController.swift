//
//  HomeScreenViewController.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import UIKit

class HomeScreenViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var headerView: StyledHeaderScreenView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var collectionOfButtons: Array<HomeStainedGlassButtonView>?
    
    // MARK: - Properties
    var presenter: HomeScreenPresenter!
    
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
        if let collectionOfButtons = collectionOfButtons {
            for (index, button) in collectionOfButtons.enumerated() {
                button.delegate = self
                button.tagButton = HomeScreenTags(rawValue: index) 
                button.title = HomeScreenTags(rawValue: index)?.description
            }
        }
        self.view.backgroundColor = UIColor(named: "ArielBackground")
        self.scrollView.showsHorizontalScrollIndicator = false
        self.headerView.showCenterIcon()
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

// MARK: - HomeScreenPresenterDelegate
extension HomeScreenViewController: HomeScreenPresenterDelegate {
    
    func didLoadRemoteConfig() {
    }
}

extension HomeScreenViewController: StyledHeaderScreenViewDelegate {
    
    func didTapBackButton() {}
    
    func didTapConfigButton() {
        self.presenter.showConfigurations()
    }
}

extension HomeScreenViewController: HomeStainedGlassButtonViewDelegate {
    func didTapButton(tag: HomeScreenTags) {
        self.presenter.didTapButton(tag: tag)
    }
}
