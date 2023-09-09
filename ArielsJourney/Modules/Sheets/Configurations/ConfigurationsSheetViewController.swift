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

    @IBOutlet var collectionOfLabels: Array<UILabel>?
    @IBOutlet var collectionOfSliders: Array<CustomSlider>?
    
    // MARK: - Properties
    var presenter: ConfigurationsSheetPresenter!
    
    private enum Fonts {
        static let title = UIFont(name: "Macondo-Regular", size: 20)
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
        self.headerView.titleLabel.text = "Configurações"
        self.view.backgroundColor = UIColor(named: "ArielBackground")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }
    
    // MARK: - Methods
    func configureUI() {
        
        if let labels = collectionOfLabels, let sliders = collectionOfSliders {
            for (index, label) in labels.enumerated() {
                label.font = Fonts.title
                label.textColor = UIColor(named: "ArielText")
                label.text = presenter.dataSliders[index].volumeSlidersModel.titleLabel
            }
            
            for (index, slider) in sliders.enumerated() {
                let volumeModel = presenter.dataSliders[index]
                let volumeKey = volumeModel.volumeSlidersModel.volumeKey
                slider.setValue(UserDefaults.standard.float(forKey: volumeKey), animated: true)
                slider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
                slider.initialPercentage = CGFloat(UserDefaults.standard.float(forKey: volumeKey))
                slider.volumeSliderEnum = volumeModel
            }
        }
    }
    
    @objc func onSliderValChanged(slider: CustomSlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            if touchEvent.phase == .ended {
                if let volumeSliderEnum = slider.volumeSliderEnum {
                    presenter.ajustVolume(volumeSliderEnum: volumeSliderEnum, value: slider.value)
                }
            }
        }
    }
}

// MARK: - ConfigurationsSheetPresenterDelegate
extension ConfigurationsSheetViewController: ConfigurationsSheetPresenterDelegate {
}

extension ConfigurationsSheetViewController: StyledHeaderSheetViewDelegate {
    
}
