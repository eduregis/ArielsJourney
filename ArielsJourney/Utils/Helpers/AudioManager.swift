//
//  AudioManager.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 06/09/23.
//

import AVFoundation

class AudioManager {
    
    static var shared: AudioManager = {
        let instance = AudioManager()
        return instance
    }()
    
    private init() {}
    
    var musicPlayer: AVAudioPlayer?
    var ambiencePlayer: AVAudioPlayer?
    var soundEffectPlayer: AVAudioPlayer?
    
    func playMusic(name: String) {
        // "nierCityRuins"
        guard let pathToFind = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: pathToFind)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            musicPlayer?.setVolume(UserDefaults.standard.float(forKey: UserDefaults.Keys.musicVolume.description), fadeDuration: 0)
            musicPlayer?.play()
        } catch {
            // localized
        }
    }
    
    func ajustMusicVolume() {
        musicPlayer?.setVolume(UserDefaults.standard.float(forKey: UserDefaults.Keys.musicVolume.description), fadeDuration: 0.2)
    }
    
    func playAmbience(name: String) {
        // "forestSound"
        guard let pathToFind = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: pathToFind)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            ambiencePlayer = try AVAudioPlayer(contentsOf: url)
            ambiencePlayer?.setVolume(UserDefaults.standard.float(forKey: UserDefaults.Keys.ambienceVolume.description), fadeDuration: 0)
            ambiencePlayer?.numberOfLoops = -1
            ambiencePlayer?.play()
        } catch {
            // localized
        }
    }
    
    func ajustAmbienceVolume() {
        ambiencePlayer?.setVolume(UserDefaults.standard.float(forKey: UserDefaults.Keys.ambienceVolume.description), fadeDuration: 0.2)
    }
    
    func playSoundEffect(name: String) {
        guard let pathToFind = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: pathToFind)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            soundEffectPlayer = try AVAudioPlayer(contentsOf: url)
            soundEffectPlayer?.setVolume(UserDefaults.standard.float(forKey: UserDefaults.Keys.soundEffectVolume.description), fadeDuration: 0)
            soundEffectPlayer?.play()
        } catch {
            // localized
        }
    }
    
    func ajustSoundEffectVolume() {
        soundEffectPlayer?.setVolume(UserDefaults.standard.float(forKey: UserDefaults.Keys.soundEffectVolume.description), fadeDuration: 0.2)
    }
}
