//
//  HerosJourneyScreenRouter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

class HerosJourneyScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        let viewController = HerosJourneyScreenViewController()
        let router = HerosJourneyScreenRouter(viewController: viewController)
        let presenter = HerosJourneyScreenPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
}
