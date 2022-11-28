//
//  HomeCoodinator.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Uri López. All rights reserved.
//
import Foundation
import UIKit

protocol HomeCoordinatorProtocol {
    func goToDetails(data: PlanetsAPIProtocol, sender: UIViewController)
}

internal final class HomeCoordinator {
    

}
extension HomeCoordinator: HomeCoordinatorProtocol {
    
    func goToDetails(data: PlanetsAPIProtocol, sender: UIViewController) {
        let interactor = DetailsHomeInteractor(data: data)
        let presenter = DetailsHomePresenter(interactor: interactor)
        let view = DetailsHomeView(presenter: presenter)
        
        presenter.view = view
        sender.show(view, sender: nil)
    }
}
