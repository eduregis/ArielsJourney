//
//  AchievementsScreenRouter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

class AchievementsScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        let viewController = AchievementsScreenViewController()
        let router = AchievementsScreenRouter(viewController: viewController)
        let presenter = AchievementsScreenPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
}
