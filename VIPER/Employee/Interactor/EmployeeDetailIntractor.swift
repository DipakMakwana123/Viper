//
//  EmployeeDetailrIntractor.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 27/07/22.
//

import Foundation

protocol EmployeeDetailIntractorProtocol {
    
    var presenter: EmployeeDetailPresenterProtocol? {get set}
    func getEmployeeDetail()
}
class EmployeeDetailIntractor: EmployeeDetailIntractorProtocol{
   
    var presenter: EmployeeDetailPresenterProtocol?
    
    func getEmployeeDetail(){
        
    }
}
