//
//  DetailsHomeInteractor.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Uri López. All rights reserved.
//
import Foundation

protocol DetailsHomeInteractorProtocol {
    //TODO: CHANGE LocationClass
    func getData() -> LocationClass
    
}

internal final class DetailsHomeInteractor {
    //TODO: CHANGE LocationClass
    var data: LocationClass
    //TODO: CHANGE LocationClass
    init(data: LocationClass) {
        self.data = data
        
    }
}

extension DetailsHomeInteractor: DetailsHomeInteractorProtocol {
    //TODO: CHANGE LocationClass
    func getData() -> LocationClass {
        return self.data
        
    }
}
