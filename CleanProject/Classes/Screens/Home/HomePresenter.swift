//
//  HomePresenter.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Bloks Telematics SL. All rights reserved.
//
protocol HomePresenterProtocol{
    var view: HomeViewProtocol? { get set }
    var urlToPass: String? { get set }
    //TODO: change PlanetsAPI
    var arrayLocal: [PlanetsAPIProtocol] { get set }
    func askForArrayInteractorWithURL()
    func countArray() ->Int
    func getArray() -> [PlanetsAPIProtocol]
    func checkIfMoreURL()-> Bool
    var loadFromCache: Bool { get set }
    var firstCall: Bool { get set }
    //var loadSpinner: Bool { get set }
    
}

internal final class HomePresenter {
    var interactor: HomeInteractorProtocol
    var view: HomeViewProtocol?
    var urlToPass: String?
    var firstCall = false
    
    //var urlToPass = "https://swapi.dev/api/planets/"
    var arrayLocal = [PlanetsAPIProtocol]()
    var loadFromCache = false

    
    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
        
    }
    
}

extension HomePresenter: HomePresenterProtocol {
    
    
    func askForArrayInteractorWithURL() {
        
        if !firstCall{
            urlToPass = "https://swapi.dev/api/planets/"
            firstCall = true
        }
        view?.loadingView(.show)
        interactor.asktoServiceArray(urlRecived: urlToPass,completion: {
            result in
            switch result {
            case .success(let resultAPI):
                
                self.arrayLocal.append(contentsOf: resultAPI.results)
                guard let nexturl = resultAPI.next else {
                    self.urlToPass = nil
                    return }
                self.urlToPass = nexturl
                self.view?.loadData()
                self.saveCache()
                break
                
            case .failure(_):

                let cacheExist = StorageManager().fileExist(name: "planets.json")
                if cacheExist{
                    self.loadFromCache = true
                    self.arrayLocal = StorageManager().getObjects(name: "planets.json") as! [PlanetsAPI]
                    self.view?.loadData()
                    self.view?.showAlert(tittle: "Error en la API", messageAlert: "No estamos recibiendo la info, cargando de cache")
                    
                }else{
                    self.view?.showAlert(tittle: "Sorry", messageAlert: "No tenemos cache, tienes internet?")
                }

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
    
    func checkIfMoreURL()-> Bool {

        if (urlToPass != nil){
            return true
            
        } else{
            return false
            
        }
    }
    func saveCache(){
    StorageManager().saveObjects(objectArray: self.arrayLocal, name: "planets.json")

    }
}
