//
//  AppDelegate.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = {
        return UIWindow()
    }()
    
    static var windowView: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let window = self.window else { fatalError("No Window (loc)") }
        window.rootViewController = SplashScreenRouter.makeModule()
        window.makeKeyAndVisible()
        AppDelegate.windowView = window
        return true
    }


}

