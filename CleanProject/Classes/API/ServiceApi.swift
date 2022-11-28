//
//  ServiceApi.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Uri López.. All rights reserved.
//
import Foundation

protocol ServiceAPIProtocol{
    func getSWArrayLocationResult(urlRecived: String, completion: @escaping (Result<PlanetsInfoSWProtocol, Error>) -> Void)
    
}

public class ServiceAPI: ServiceAPIProtocol{
    func getSWArrayLocationResult(urlRecived: String, completion: @escaping (Result<PlanetsInfoSWProtocol, Error>) -> Void){
        
        ApiManager.shared.ApiCall(for: urlRecived) { (result: Result<PlanetsInfoSW, Error>) in
            switch result{
                
                case .success(let object):
                    completion(.success(object))
                    
                case .failure(let error):
                    completion(.failure(error))
                    print(error)
            }
        }
    }
}
//        guard let url = urlFinal else{ return }
//
//        let urlSession = URLSession.shared
//        urlSession.dataTask(with: url){ (data, response, error) in
//
//            if let error{
//                completion(.failure(error))
//            }
//            if let data{
//                do{
//                    //reb un objecte pero l'ha d'asignar a un array
//                    let planetResultAPI =  try JSONDecoder().decode(PlanetsInfoSW.self, from: data)
//                    completion(.success(planetResultAPI))
//
//
//                }catch let decodeError{
//                    print(decodeError)
//                    completion(.failure(decodeError))
//                }
//            }
//        }.resume()
//    }

