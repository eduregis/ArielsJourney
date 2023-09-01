//
//  HomeScreenViewController.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import Foundation

import UIKit

class HomeScreenViewController: BaseViewController {

    // MARK: - Outlets
    
    
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
        self.title = "Teste"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }
    
    // MARK: - Methods

    // MARK: - Actions
    func navigateToGameplay() {
        self.presenter.navigateToGameplay()
    }
}

// MARK: - SplashScreenPresenterDelegate
extension HomeScreenViewController: HomeScreenPresenterDelegate {
    
    func didLoadRemoteConfig() {
    }
}
