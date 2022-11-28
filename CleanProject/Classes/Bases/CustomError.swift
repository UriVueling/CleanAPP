//
//  CustomError.swift
//  CleanProject
//
//  Created by josepL on 28/11/22.
//

import Foundation

protocol CustomErrorProtocol: LocalizedError {
    var title: String? { get }
    var code: Int { get }
}

struct CustomError: CustomErrorProtocol {
    var title: String?
    var code: Int
    var errorDescription: String?
    var failureReason: String?
    
    init (title: String?, desc: String, code: Int) {
        self.title = title
        self.code = code
        self.errorDescription = desc
        self.failureReason = desc
    }
}
