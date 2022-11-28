//
//  DetailsHomeInteractor.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Uri López. All rights reserved.
//
import Foundation

protocol DetailsHomeInteractorProtocol {
    func getData() -> PlanetsAPIProtocol
}

internal final class DetailsHomeInteractor {
    var data: PlanetsAPIProtocol
    
    init(data: PlanetsAPIProtocol) {
        self.data = data
    }

}

extension DetailsHomeInteractor: DetailsHomeInteractorProtocol {
    func getData() -> PlanetsAPIProtocol {
        return self.data
    }
}
