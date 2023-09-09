//
//  ConfigurationsSheetPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import Foundation

protocol ConfigurationsSheetPresenterDelegate: BasePresenterDelegate {
}

class ConfigurationsSheetPresenter {
    
    // MARK: - Properties
    weak var delegate: ConfigurationsSheetPresenterDelegate?
    let router: ConfigurationsSheetRouter
    
    var dataSliders: [VolumeSlidersEnum] = []
    
    // MARK: - Init
    init(delegate: ConfigurationsSheetPresenterDelegate, router: ConfigurationsSheetRouter) {
        
        self.delegate = delegate
        self.router = router
    }
    
    // MARK: - Lifecycles
    func didLoad() {
    }
    
    func willAppear() {
        dataSliders = VolumeSlidersEnum.allCases
    }
    
    func didAppear() {
    }
    
    // MARK: - Methods
    func ajustVolume(volumeSliderEnum: VolumeSlidersEnum, value: Float) {
        switch(volumeSliderEnum) {
        case .musicVolume:
            UserDefaults.standard.set(value, forKey: UserDefaults.Keys.musicVolume.description)
            AudioManager.shared.ajustMusicVolume()
        case .ambienceVolume:
            UserDefaults.standard.set(value, forKey: UserDefaults.Keys.ambienceVolume.description)
            AudioManager.shared.ajustAmbienceVolume()
        case .soundEffectVolume:
            UserDefaults.standard.set(value, forKey: UserDefaults.Keys.soundEffectVolume.description)
            AudioManager.shared.ajustSoundEffectVolume()
        }
        AudioManager.shared.playSoundEffect(name: "Ariel_soundEffect_sliderButtonReleased")
       
    }
}
