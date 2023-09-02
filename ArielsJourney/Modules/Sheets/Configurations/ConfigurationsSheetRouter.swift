//
//  ConfigurationsSheetRouter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

class ConfigurationsSheetRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        let viewController = ConfigurationsSheetViewController()
        let router = ConfigurationsSheetRouter(viewController: viewController)
        let presenter = ConfigurationsSheetPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
}
