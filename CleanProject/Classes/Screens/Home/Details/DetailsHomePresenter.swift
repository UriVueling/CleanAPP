//
//  DetailsHomePresenter.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Bloks Telematics SL. All rights reserved.
//
import Foundation

protocol DetailsHomePresenterProtocol{
    func viewDidLoadWasCalled()
    func getDataName() -> String
    
}

internal final class DetailsHomePresenter {
    
    var view: DetailsHomeViewProtocol?
    var interactor: DetailsHomeInteractorProtocol
    
    
    init(interactor: DetailsHomeInteractor) {
        self.interactor = interactor
        
    }
}

extension DetailsHomePresenter: DetailsHomePresenterProtocol {
    func viewDidLoadWasCalled(){
        let object = interactor.getData()
        self.view?.setInfoOnScreen(objectPresenter: object)
        self.view?.setImageOnScreen(objectPresenter: object)
        
    }
    func getDataName()-> String{
        let location = interactor.getData()
        return location.name
        
    }
}
