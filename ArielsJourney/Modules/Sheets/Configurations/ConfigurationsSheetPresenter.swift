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
    
    weak var delegate: ConfigurationsSheetPresenterDelegate?
    let router: ConfigurationsSheetRouter
    
    init(delegate: ConfigurationsSheetPresenterDelegate, router: ConfigurationsSheetRouter) {
        
        self.delegate = delegate
        self.router = router
    }
    
    func didLoad() {
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    func ajustVolume(tag: Int, value: Float) {
        switch(tag) {
        case 0:
            UserDefaults.standard.set(value, forKey: UserDefaults.Keys.musicVolume.description)
            AudioManager.shared.ajustMusicVolume()
        case 1:
            UserDefaults.standard.set(value, forKey: UserDefaults.Keys.ambienceVolume.description)
            AudioManager.shared.ajustAmbienceVolume()
        case 2:
            UserDefaults.standard.set(value, forKey: UserDefaults.Keys.soundEffectVolume.description)
            AudioManager.shared.ajustSoundEffectVolume()
        default:
            break
        }
        AudioManager.shared.playSoundEffect(name: "Ariel_soundEffect_sliderButtonReleased")
       
    }
}
