//
//  ArchetypesScreenRouter.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 02/09/23.
//

import UIKit

class ArchetypesScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        let viewController = ArchetypesScreenViewController()
        let router = ArchetypesScreenRouter(viewController: viewController)
        let presenter = ArchetypesScreenPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
    
    func showElementDetails(archetype: ArchetypeModel) {
        let overlayVC = ElementDetailsSheetRouter.makeModule(archetype: archetype)
        overlayVC.transitioningDelegate  = self.overlayTransitioningDelegate
        overlayVC.modalPresentationStyle = .custom
        self.present(overlayVC, animated: true)
    }
}
