//
//  AppCoodinator.swift
//  CleanProject
//
//  Created by josepL on 28/11/22.
//

import Foundation
import UIKit

public protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var tbBarController: UITabBarController { get set }
    
    func start()
}

class AppCoordinator: CoordinatorProtocol {
    
    //MARK: variables
    var childCoordinators: [CoordinatorProtocol] = []
    var window: UIWindow
    
    lazy var tbBarController: UITabBarController = {
        getNavigation()
    }()
    
    //MARK: INIT
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = tbBarController
        self.window.makeKeyAndVisible()
    }
    
    //MARK: Funtions set up
    private func getNavigation() -> UITabBarController {
        let navigator = UITabBarController()
        return navigator
    }
    
    func start() {
        setTabBar()
    }
    func setTabBar(){
        let homeView = setHomeView()
        homeView.title = "HOME"
        homeView.tabBarItem.image = UIImage(systemName: "house.fill")
        
        tbBarController.setViewControllers([homeView], animated: true)
    }
    
    //MARK: Configurating views
    func setHomeView() -> UINavigationController{
        //TODO: Add navigationControllers and return it
        let navigationcontroller = UINavigationController()
        let coordinator = HomeCoordinator()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(interactor: interactor)
        let view = HomeViewController(presenter: presenter)
        
        view.coordinator = coordinator
        presenter.view = view
        navigationcontroller.setViewControllers([view], animated: true)
        
        return navigationcontroller
    }
}
