//
//  ServiceApi.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Uri López.. All rights reserved.
//
import Foundation

protocol ServiceAPIProtocol{
    func getSWArrayLocationResult(urlRecived: String?, completion: @escaping (Result<PlanetsInfoSWProtocol, Error>) -> Void)
    
}

public class ServiceAPI: ServiceAPIProtocol{
    func getSWArrayLocationResult(urlRecived: String?, completion: @escaping (Result<PlanetsInfoSWProtocol, Error>) -> Void){
        
        var urlFinal = URL(string: "https://swapi.dev/api/planets/")
        
        if let urlRecived{
            urlFinal = URL(string: urlRecived)
            
        }else{
            //As its the first call we set the pagination and the url to the default values
            urlFinal = URL(string: "https://swapi.dev/api/planets/")
        }
        guard let url = urlFinal else{ return }
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: url){ (data, response, error) in
            
            if let error{
                completion(.failure(error))
            }
            if let data{
                do{
                    //reb un objecte pero l'ha d'asignar a un array
                    let planetResultAPI =  try JSONDecoder().decode(PlanetsInfoSW.self, from: data)
                    completion(.success(planetResultAPI))
                    
                    
                }catch let decodeError{
                    print(decodeError)
                    completion(.failure(decodeError))
                }
            }
        }.resume()
    }
}
