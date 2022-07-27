//
//  EmployeeInteractor.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 25/07/22.
//

import Foundation
import Combine 

/*
  
 - Refrence of Presenter
 - All Business Logic
 - Data Fetching From API
 - Data Fetching From Database
 - Validation
 -
 */


protocol EmployeeInteractorProtocol {
    
    var presenter: EmployeePresenterProtocol? {get set}
    func getEmployee()
    func getEmployeeFromDB()
}
// Concrete Implementation
class EmployeeInteractor:EmployeeInteractorProtocol {
    
    var apiManager: APIManager?
    
    init(apiManager:APIManager? = APIManager()){
        self.apiManager = apiManager
    }
    
    var presenter: EmployeePresenterProtocol?
    
    func getEmployee(){
        guard let url = URL(string:"\(BaseURL.url)\(EndPoint.employees)") else {
            return
        }
        apiManager?.requestAPI(url: url, completion: { [weak self](success,data,response,error) in
            if success {
                self?.presenter?.formatEmployeeData(data: data)
            }
            else {
                self?.presenter?.showError(error:error)
            }
        })
    }
    
    func getEmployeeFromDB(){
    }
    
}

