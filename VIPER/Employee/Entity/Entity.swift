//
//  Entity.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 25/07/22.
//

import Foundation
/*
 
 1. Entity == Modal 
 */

struct Employee: Codable {
    let status: String?
    let data: [Datum]?
    let message: String?
    
    init() {
        status = ""
        data = []
        message = ""
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let name: String
    let salary, age: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
        case profileImage = "profile_image"
    }
}

