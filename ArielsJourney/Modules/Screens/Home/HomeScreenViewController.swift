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
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var leadingGradientView: UIView!
    @IBOutlet weak var trailingGradientView: UIView!
    
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
        self.view.backgroundColor = UIColor(named: "ArielBackground")
        self.collectionView.showsHorizontalScrollIndicator = false
        self.headerView.showCenterIcon()
        self.configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
        leadingGradientView.setOpecityGradientBackground(color: UIColor(named: "ArielBackground") ?? .clear, direction: .toRight)
        trailingGradientView.setOpecityGradientBackground(color: UIColor(named: "ArielBackground") ?? .clear, direction: .toLeft)
    }
    
    // MARK: - Private Methods
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentMode = .center
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        HomeCollectionViewCell.registerNib(for: collectionView)
    }
}

// MARK: - HomeScreenPresenterDelegate
extension HomeScreenViewController: HomeScreenPresenterDelegate {
}

extension HomeScreenViewController: StyledHeaderScreenViewDelegate {
    
    func didTapBackButton() {}
    
    func didTapConfigButton() {
        self.presenter.showConfigurations()
    }
}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.dateCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 142, height: 275)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeCollectionViewCell.dequeueCell(from: collectionView, for: indexPath)
        cell.dateCell = presenter.dateCells[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didTapButton(tag: presenter.dateCells[indexPath.row])
    }
}
