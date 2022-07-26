//
//  Enums.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 25/07/22.
//

import Foundation

enum CustomError: Error {
    case badURL
    case parserError
    case unknown
}

enum APIFailureCondition: Error {
    case invalidServerResponse
    case unknownError
    
}
enum RESTClientError: Error {
    case unknown
}
