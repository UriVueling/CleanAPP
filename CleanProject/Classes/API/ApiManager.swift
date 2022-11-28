//
//  ApiManager.swift
//  CleanProject
//
//  Created by josepL on 28/11/22.
//

import Foundation

struct ApiManager {
    static let shared = ApiManager()
    
    func ApiCall<T: Decodable>(for url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(
                .failure(
                    CustomError(
                        title: "Error URL",
                        desc: "Error URL",
                        code: 1
                    )
                )
            )
            return
        }

        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { data, _, error in
            if let error {
                completion(.failure(error))
                return
            }

            if let data {
                do {
                    let object = try JSONDecoder()
                        .decode(T.self,
                                from: data)
                    completion(.success(object))
                } catch let decodeError {
                    completion(.failure(decodeError))
                }
            }
        }.resume()
    }
}
