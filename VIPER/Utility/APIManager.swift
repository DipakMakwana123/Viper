//
//  APIManager.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 25/07/22.
//

import Foundation
import UIKit
import Combine




class APIManager{
    
 
    func getAPICall(url: URL, compilation: @escaping (Result<Data?,CustomError>) -> ()){
        URLSession.shared.dataTask(with: url, completionHandler:{ (data,response,err) in
            // here we have check for status code also
            if let _ = err, data == nil {
                compilation(.failure(.badURL))
            }else {
                compilation(.success(data))
            }
        })
        .resume()
    }
    
    
    func requestAPI(url:URL, completion: @escaping (Bool,Data?,URLResponse?,Error?) -> ()) {
        
        if NetworkManager.isConnectedToNetwork() {
            
            let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
                
                guard error == nil else {
                    debugPrint("Error: problem calling GET \(error?.localizedDescription ?? "")")
                    completion(false, data,response,error)
                    return
                }
                
                guard let data = data else {
                    debugPrint("Error: did not receive data")
                    completion(false, data,response,error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                    debugPrint("Error: HTTP request failed")
                    completion(false, data,response,error)
                    return
                }
                
                completion(true, data,response,error)
            })
            dataTask.resume()
            
        }
        else{
            let error = NSError(domain:"", code: 0, userInfo:[ NSLocalizedDescriptionKey: "No internet Connection"]) as Error
            completion(true, nil,nil,error)
        }
    }
    
   
    
    
}

// MARK: Multipart functions
extension APIManager: ObservableObject {
    func getData(_ url:URL) async -> Future<Data?, Error> {
        let session = URLSession.shared
        return Future { promise in
            let task = session.dataTask(with: url) { data, response, error in
                if let err = error {
                    promise(.failure(err))
                } else {
                    if let data = data {
                        promise(.success(data))
                    }  else {
                        let unknownError = APIFailureCondition.invalidServerResponse
                        promise(.failure(unknownError))
                    }
                }
            }
            task.resume()
        }
    }
    
}


