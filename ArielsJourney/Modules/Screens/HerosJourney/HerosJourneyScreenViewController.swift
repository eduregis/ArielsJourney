//
//  HerosJourneyScreenViewController.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

class HerosJourneyScreenViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var headerView: StyledHeaderScreenView!
    @IBOutlet var collectionOfCards: Array<HerosJourneyCardView>?
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Properties
    var presenter: HerosJourneyScreenPresenter!
    
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
        self.headerView.titleLabel.text = "Jornada do Herói"
        self.headerView.hideAdornments()
        self.view.backgroundColor = UIColor(named: "ArielBackground")
        if let cards = collectionOfCards {
            for (index, card) in cards.enumerated() {
                card.delegate = self
                card.setupCard(cardInfo: HerosJourneyEnum.allCases[index].herosJourneyModel )
            }
        }
        self.scrollView.showsHorizontalScrollIndicator = false
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

// MARK: - HerosJourneyScreenPresenterDelegate
extension HerosJourneyScreenViewController: HerosJourneyScreenPresenterDelegate {
    
    func didLoadRemoteConfig() {
    }
}

extension HerosJourneyScreenViewController: StyledHeaderScreenViewDelegate {
    func didTapBackButton() {
        self.presenter.navigateToHome()
    }
    
    func didTapConfigButton() {
        self.presenter.showConfigurations()
    }
}

extension HerosJourneyScreenViewController: HerosJourneyCardViewDelegate {
    func didTapCard(cardInfo: HerosJourneyModel) {
        self.presenter.didTapCard(cardInfo: cardInfo)
    }
}
