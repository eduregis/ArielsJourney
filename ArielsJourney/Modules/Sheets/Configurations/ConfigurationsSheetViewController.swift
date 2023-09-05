//
//  ConfigurationsSheetViewController.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

class ConfigurationsSheetViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var headerView: StyledHeaderSheetView!
    
    // MARK: - Properties
    var presenter: ConfigurationsSheetPresenter!
    
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
        self.headerView.titleLabel.text = "Configurações"
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

// MARK: - ConfigurationsSheetPresenterDelegate
extension ConfigurationsSheetViewController: ConfigurationsSheetPresenterDelegate {
}

extension ConfigurationsSheetViewController: StyledHeaderSheetViewDelegate {
    
}
