//
//  HomeInteractor.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Uri López. All rights reserved.
//
import Foundation

protocol HomeInteractorProtocol {

    func asktoServiceArray(urlRecived: String?, completion: @escaping (Result<PlanetsInfoSWProtocol, Error>) -> Void)
    
}

internal final class HomeInteractor {

    private let service: HomeServiceProtocol

    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
    }
    
}

extension HomeInteractor: HomeInteractorProtocol {

    func asktoServiceArray(urlRecived: String?, completion: @escaping (Result<PlanetsInfoSWProtocol, Error>) -> Void) {
        let serviceAPIProtocol = self.service.giveBackAPIService()

        serviceAPIProtocol.getSWArrayLocationResult(url: urlRecived, completion: { result in
            completion(result)
        })
    }
    
}
