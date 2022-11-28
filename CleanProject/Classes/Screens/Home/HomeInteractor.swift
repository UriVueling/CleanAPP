//
//  HomeInteractor.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Uri López. All rights reserved.
//
import Foundation

protocol HomeInteractorProtocol {
    //TODO: CHANGE PlanetsInfoSWProtocol
    func asktoServiceArray(url: String, completion: @escaping (Result<PlanetsInfoSWProtocol, Error>) -> Void)
    
}

internal final class HomeInteractor {
    //TODO: CHANGE SWServiceProtocol
    private let service: HomeServiceProtocol
    //TODO: CHANGE SWServiceProtocol I SWService()
    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
    }
    
}

extension HomeInteractor: HomeInteractorProtocol {
    //TODO: CHANGE PlanetsInfoSWProtocol
    func asktoServiceArray(url: String, completion: @escaping (Result<PlanetsInfoSWProtocol, Error>) -> Void) {
        let serviceAPIProtocol = self.service.giveBackAPIService()
        //TODO: CHANGE getSWArrayLocationResult
        serviceAPIProtocol.getSWArrayLocationResult(urlRecived: url, completion: { result in
            completion(result)
        })
    }
    
}
