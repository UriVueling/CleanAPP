//
//  StorageManager.swift
//  CleanProject
//
//  Created by josepL on 28/11/22.
//
import Foundation

struct StorageManager {
    static let shared = StorageManager()
    
    func saveObjects(objectArray: [PlanetsAPIProtocol], name: String) {
        guard let plantetObj = objectArray as? [PlanetsAPI] else {
            return
        }
        do {
            
            let data = try JSONEncoder().encode(plantetObj)
            
            let cachesDirectory = getCachesDirectory()
            print(cachesDirectory)
            //TODO: append.json
            let storageURL = cachesDirectory.appendingPathComponent(name, isDirectory: false)
            
            do {
                try data.write(to: storageURL)
            } catch let errorWrite {
                print(errorWrite.localizedDescription)
            }
            
        } catch let errorDescode {
            print(errorDescode.localizedDescription)
        }
    }
    
    func getObjects(name: String) -> [PlanetsAPIProtocol]? {
        let cachesDirectory = getCachesDirectory()
        //TODO: append.json
        let storageURL = cachesDirectory.appendingPathComponent(name,
                                                                   isDirectory: false)
        
        guard let data = try? Data(contentsOf: storageURL),
              let object = try? JSONDecoder().decode([PlanetsAPI].self, from: data) else {
            return nil
        }
        
        return object
    }
    
    func getCachesDirectory() -> URL {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
