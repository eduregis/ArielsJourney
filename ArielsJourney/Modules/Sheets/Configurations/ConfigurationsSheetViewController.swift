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
    
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var ambienceLabel: UILabel!
    @IBOutlet weak var soundEffectLabel: UILabel!
    
    @IBOutlet weak var musicSlider: CustomSlider!
    @IBOutlet weak var ambienceSlider: CustomSlider!
    @IBOutlet weak var soundEffectSlider: CustomSlider!
    
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
        configureUI()
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
    func configureUI() {
        musicLabel.text = ConfigScreenTexts.music.localized()
        musicSlider.setValue(UserDefaults.standard.float(forKey: UserDefaults.Keys.musicVolume.description), animated: true)
        musicSlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        musicSlider.tag = 0
        
        ambienceLabel.text = ConfigScreenTexts.ambience.localized()
        ambienceSlider.setValue(UserDefaults.standard.float(forKey: UserDefaults.Keys.ambienceVolume.description), animated: true)
        ambienceSlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        ambienceSlider.tag = 1
        
        soundEffectLabel.text = ConfigScreenTexts.soundEffect.localized()
        soundEffectSlider.setValue(UserDefaults.standard.float(forKey: UserDefaults.Keys.soundEffectVolume.description), animated: true)
        soundEffectSlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        soundEffectSlider.tag = 2
    }
    
    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            if touchEvent.phase == .ended {
                presenter.ajustVolume(tag: slider.tag, value: slider.value)
            }
        }
    }
}

// MARK: - ConfigurationsSheetPresenterDelegate
extension ConfigurationsSheetViewController: ConfigurationsSheetPresenterDelegate {
}

extension ConfigurationsSheetViewController: StyledHeaderSheetViewDelegate {
    
}
