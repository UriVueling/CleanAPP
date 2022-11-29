//
//  ServiceApi.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Uri López.. All rights reserved.
//
import Foundation

protocol ServiceAPIProtocol{
    func getSWArrayLocationResult(url: String?, completion: @escaping (Result<PlanetsInfoSWProtocol, Error>) -> Void)
    
}

public class ServiceAPI: ServiceAPIProtocol{
    func getSWArrayLocationResult(url: String?, completion: @escaping (Result<PlanetsInfoSWProtocol, Error>) -> Void){
        ApiManager.shared.ApiCall(for: url) { (result: Result<PlanetsInfoSW, Error>) in
            switch result{
                
                case .success(let object):
                    completion(.success(object))
                    
                case .failure(let error):
                    completion(.failure(error))
                    //print(error)
            }
        }
    }
}


