//
//  ArchetypeDetailsSheetRouter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import UIKit

class ArchetypeDetailsSheetRouter: BaseRouter {
    
    static func makeModule(archetype: ArchetypeModel) -> UIViewController {
        let viewController = ArchetypeDetailsSheetViewController()
        let router = ArchetypeDetailsSheetRouter(viewController: viewController)
        let presenter = ArchetypeDetailsSheetPresenter(delegate: viewController, router: router)
        presenter.archetype = archetype
        viewController.presenter = presenter
        
        return viewController
    }
}
