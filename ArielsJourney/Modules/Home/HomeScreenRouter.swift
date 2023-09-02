//
//  HomeScreenRouter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 01/09/23.
//

import UIKit

class HomeScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        let viewController = HomeScreenViewController()
        let router = HomeScreenRouter(viewController: viewController)
        let presenter = HomeScreenPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
    
    func navigateToGameplay() {
        print("Home -> Gameplay")
        self.push(GameplayScreenRouter.makeModule(), animated: true)
    }
    
    func navigateToContinue() {
        print("Home -> Gameplay (Continue)")
        self.push(GameplayScreenRouter.makeModule(), animated: true)
    }
}
