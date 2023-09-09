//
//  GameplayScreenRouter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

class GameplayScreenRouter: BaseRouter {
    
    static func makeModule(isNewGame: Bool) -> UIViewController {
        let viewController = GameplayScreenViewController()
        let router = GameplayScreenRouter(viewController: viewController)
        let presenter = GameplayScreenPresenter(delegate: viewController, router: router)
        presenter.isNewGame = isNewGame
        viewController.presenter = presenter
        
        return viewController
    }
}
