//
//  DetailsHomePresenter.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Bloks Telematics SL. All rights reserved.
//
import Foundation

protocol DetailsHomePresenterProtocol{

    
}

internal final class DetailsHomePresenter {
    
    var view: DetailsHomeViewProtocol?
    var interactor: DetailsHomeInteractorProtocol
    
    
    init(interactor: DetailsHomeInteractor) {
        self.interactor = interactor
        
    }
}

extension DetailsHomePresenter: DetailsHomePresenterProtocol {

}
