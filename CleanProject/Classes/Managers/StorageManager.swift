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
    
    func fileExist(name: String) -> Bool{
        var exist: Bool
        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        
        if let pathComponent = url.appendingPathComponent(name) {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                exist = true
            } else {
                exist = false
            }
        } else {
            exist = false
        }
        return exist
    }
    
    func getObjects(name: String) -> [PlanetsAPIProtocol]? {
        let cachesDirectory = getCachesDirectory()
        
        let storageURL = cachesDirectory.appendingPathComponent(name, isDirectory: false)
        
        
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
