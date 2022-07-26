//
//  Data+Extension.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 25/07/22.
//

import Foundation


extension Data {
    func getModal<T:Codable>(modal : T.Type) -> T?{
        do {
            let modal  = try JSONDecoder().decode(modal, from:self)
            return modal
        } catch let parsingError {
            print("Error", parsingError)
        }
        return nil
    }
}
extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
