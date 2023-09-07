//
//  SplashScreenPresenter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import Foundation

protocol SplashScreenPresenterDelegate: BasePresenterDelegate {
}

class SplashScreenPresenter {
    
    // MARK: - Properties
    weak var delegate: SplashScreenPresenterDelegate?
    let router: SplashScreenRouter
    
    // MARK: - Init
    init(delegate: SplashScreenPresenterDelegate, router: SplashScreenRouter) {
        self.delegate = delegate
        self.router = router
    }
    
    // MARK: - Lifecycle
    func didLoad() {
        isFirstOpen()
        navigateToHome()
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    //  MARK: - Methods
    func isFirstOpen() {
        if let firstOpen = UserDefaults.standard.object(forKey: UserDefaults.Keys.firstOpen.description) as? Date {
            print("\(FirstOpenTexts.notFirstOpen.localized()) \(firstOpen)")
        } else {
            print(FirstOpenTexts.firstOpen.localized())
            
            let userDefaults = UserDefaults.standard
            
            userDefaults.set(Date(), forKey: UserDefaults.Keys.firstOpen.description)
            
            userDefaults.set(0.5, forKey: UserDefaults.Keys.soundEffectVolume.description)
            userDefaults.set(0.5, forKey: UserDefaults.Keys.ambienceVolume.description)
            userDefaults.set(0.5, forKey: UserDefaults.Keys.musicVolume.description)
            
            userDefaults.set(0, forKey: UserDefaults.Keys.activeHerosJourney.description)
            userDefaults.set(0, forKey: UserDefaults.Keys.activeArchetypes.description)
            userDefaults.set(0, forKey: UserDefaults.Keys.duchbagCounter.description)
            
            userDefaults.set("", forKey:  UserDefaults.Keys.lastDialogueSaved.description)
            userDefaults.set(false, forKey: UserDefaults.Keys.gameInProgress.description)
            
            let array: [String] = []
            userDefaults.set(array, forKey: UserDefaults.Keys.achievements.description)
        }
    }
    
    // MARK: - Navigation
    func navigateToHome() {
        self.router.navigateToHome()
    }
}
