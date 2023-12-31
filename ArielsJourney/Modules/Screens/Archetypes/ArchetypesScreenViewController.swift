//
//  ArchetypesScreenViewController.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

class ArchetypesScreenViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var headerView: StyledHeaderScreenView!
    @IBOutlet weak var leadingGradientView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var trailingGradientView: UIView!
    
    // MARK: - Properties
    var presenter: ArchetypesScreenPresenter!
    
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
        self.headerView.titleLabel.text = ArchetypesScreenTexts.title.localized()
        self.headerView.hideAdornments()
        self.view.backgroundColor = UIColor(named: "ArielBackground")
        presenter.getArchetypes {
            self.configureCollectionView()
        }
        leadingGradientView.setOpecityGradientBackground(color: UIColor(named: "ArielBackground") ?? .clear, direction: .toRight)
        trailingGradientView.setOpecityGradientBackground(color: UIColor(named: "ArielBackground") ?? .clear, direction: .toLeft)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
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
        ArchetypeCollectionViewCell.registerNib(for: collectionView)
    }
}

// MARK: - ArchetypesScreenPresenterDelegate
extension ArchetypesScreenViewController: ArchetypesScreenPresenterDelegate {
}

extension ArchetypesScreenViewController: StyledHeaderScreenViewDelegate {
    func didTapBackButton() {
        self.presenter.navigateToHome()
    }
    
    func didTapConfigButton() {
        self.presenter.showConfigurations()
    }
}

extension ArchetypesScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.dataCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ArchetypeCollectionViewCell.dequeueCell(from: collectionView, for: indexPath)
        cell.isActive = (indexPath.row < presenter.activeArchetypes)
        cell.dataCell = presenter.dataCells[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.row < presenter.activeArchetypes) {
            presenter.showElementDetails(index: indexPath.row)
        }
    }
}
