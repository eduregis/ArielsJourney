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
    
    func navigateToHerosJourney() {
        print("Home -> Jornada do Herói")
        self.push(HerosJourneyScreenRouter.makeModule(), animated: true)
    }
    
    func navigateToArchetypes() {
        print("Home -> Arquétipos")
        self.push(ArchetypesScreenRouter.makeModule(), animated: true)
    }
    
    func navigateToAchievements() {
        print("Home -> Conquistas")
        self.push(AchievementsScreenRouter.makeModule(), animated: true)
    }
}
