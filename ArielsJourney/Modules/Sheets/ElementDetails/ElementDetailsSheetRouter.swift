//
//  ElementDetailsSheetRouter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import UIKit

class ElementDetailsSheetRouter: BaseRouter {
    
    static func makeModule(archetype: ArchetypeModel? = nil, herosJourney: HerosJourneyModel? = nil) -> UIViewController {
        let viewController = ElementDetailsSheetViewController()
        let router = ElementDetailsSheetRouter(viewController: viewController)
        let presenter = ElementDetailsSheetPresenter(delegate: viewController, router: router)
        presenter.archetype = archetype
        presenter.herosJourney = herosJourney
        viewController.presenter = presenter
        
        return viewController
    }
}
