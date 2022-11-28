//
//  HomePresenter.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Bloks Telematics SL. All rights reserved.
//
protocol HomePresenterProtocol{
    var view: HomeViewProtocol? { get set }
    var urlToPass: String { get set }
    //TODO: change PlanetsAPI
    var arrayLocal: [PlanetsAPIProtocol] { get set }
    func askForArrayInteractorWithURL()
    func countArray() ->Int
    func getArray() -> [PlanetsAPIProtocol]
    
}

class HomePresenter {
    
    var interactor: HomeInteractorProtocol
    var view: HomeViewProtocol?
    
    var urlToPass = "https://swapi.dev/api/planets/"

    var arrayLocal = [PlanetsAPIProtocol]()
    
    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
        
    }
    
}

extension HomePresenter: HomePresenterProtocol {
    func askForArrayInteractorWithURL() {
        interactor.asktoServiceArray(url: urlToPass, completion: {
            result in
            switch result {
            case .success(let resultAPI):
                self.arrayLocal.append(contentsOf: resultAPI.results)
                print(resultAPI)
                //self.urlToPass = resultAPI.results
                self.view?.loadData()

                break
                
            case .failure(_):
                self.view?.showAlert(tittle: "Error en la API", messageAlert: "No estamos recibiendo la info")
                break
                
            }
        })
    }
    func countArray() -> Int {
        return arrayLocal.count
        
    }
    
    func getArray() -> [PlanetsAPIProtocol] {
        return arrayLocal
        
    }
}
