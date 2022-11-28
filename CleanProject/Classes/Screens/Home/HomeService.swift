//
//  HomeService.swift
//  CleanProject
//
//  Created josepL.
//  Copyright © 2022 Uri López. All rights reserved.
//
import Foundation
import UIKit

protocol HomeServiceProtocol {
    
    func giveBackAPIService()-> ServiceAPIProtocol
}
internal final class HomeService {
   
    private let serviceAPI: ServiceAPIProtocol

    init(serviceAPI: ServiceAPIProtocol = ServiceAPI()) {
        self.serviceAPI = serviceAPI
    }
    
}

extension HomeService: HomeServiceProtocol {
    func giveBackAPIService()-> ServiceAPIProtocol {
        return serviceAPI
    }
}

