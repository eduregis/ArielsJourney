//
//  ConfigurationsModel.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 09/09/23.
//

import Foundation

struct VolumeSlidersModel: Hashable {
    var titleLabel: String
    var volumeKey: String
    
    init (titleLabel: String, volumeKey: String) {
        self.titleLabel = titleLabel
        self.volumeKey = volumeKey
    }
}

enum VolumeSlidersEnum: CaseIterable {
    case musicVolume, ambienceVolume, soundEffectVolume
    
    var volumeSlidersModel: VolumeSlidersModel {
        switch self {
        case .musicVolume:
            return VolumeSlidersModel(titleLabel: ConfigScreenTexts.music.localized(), volumeKey: UserDefaults.Keys.musicVolume.description)
        case .ambienceVolume:
            return VolumeSlidersModel(titleLabel: ConfigScreenTexts.ambience.localized(), volumeKey: UserDefaults.Keys.ambienceVolume.description)
        case .soundEffectVolume:
            return VolumeSlidersModel(titleLabel: ConfigScreenTexts.soundEffect.localized(), volumeKey: UserDefaults.Keys.soundEffectVolume.description)
        }
    }
}
