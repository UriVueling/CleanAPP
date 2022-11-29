//
//  StorageManagerMock.swift
//  CleanProjectTests
//
//  Created by josepL on 29/11/22.
//

import Foundation
@testable import CleanProject

class StorageManagerMock {
//    static let shared = StorageManager()
    var saveObjectsCalled = false
    var fileExistCalled = false
    var fileExistNo = false
    var getObjectsCalled = false
    var getObjectsSetError = false
    var getObjectsError = false
    var getCachesDirectoryCalled = false
    
    func saveObjects(objectArray: [PlanetsAPIProtocol], name: String) {
        
        saveObjectsCalled = true
        
//        guard let plantetObj = objectArray as? [PlanetsAPI] else {
//            return
//        }
//        do {
//
//            let data = try JSONEncoder().encode(plantetObj)
//
//            let cachesDirectory = getCachesDirectory()
//            let storageURL = cachesDirectory.appendingPathComponent(name, isDirectory: false)
//
//            do {
//                try data.write(to: storageURL)
//            } catch let errorWrite {
//                print(errorWrite.localizedDescription)
//            }
//
//        } catch let errorDescode {
//            print(errorDescode.localizedDescription)
//        }
    }
    
    func fileExist(name: String) -> Bool{
        
        fileExistCalled = true
        var exist = false
        
        if !fileExistNo{
            exist = true
        }
        return exist
        
//
//        var exist: Bool
//        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0] as String
//        let url = NSURL(fileURLWithPath: path)
//
//        if let pathComponent = url.appendingPathComponent(name) {
//            let filePath = pathComponent.path
//            let fileManager = FileManager.default
//            if fileManager.fileExists(atPath: filePath) {
//                exist = true
//            } else {
//                exist = false
//            }
//        } else {
//            exist = false
//        }
//        return exist
    }
    
    func getObjects(name: String) -> [PlanetsAPIProtocol]? {
        
        getObjectsCalled = true
        
        
        if getObjectsSetError{
            getObjectsError = true
        }else{
            getObjectsError = false
        }
        
        return TestConstants.arrayPlanetsMock
//        let cachesDirectory = getCachesDirectory()
//
//        let storageURL = cachesDirectory.appendingPathComponent(name, isDirectory: false)
//
//
//        guard let data = try? Data(contentsOf: storageURL),
//              let object = try? JSONDecoder().decode([PlanetsAPI].self, from: data) else {
//            return nil
//        }
//        return object
    }
    
    func getCachesDirectory() -> URL {
        
        getCachesDirectoryCalled = true
        
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
