//
//  EmployeeDetailPresenter.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 27/07/22.
//

import Foundation

protocol EmployeeDetailPresenterProtocol {
    
    var view: EmployeeDetailViewProtocol? {get set}
    var interactor: EmployeeDetailIntractorProtocol? {get set}
    var router: EmployeeDetailRouterProtocol? {get set}
}
class EmployeeDetailPresenter: EmployeeDetailPresenterProtocol {
    var view: EmployeeDetailViewProtocol?
    var interactor: EmployeeDetailIntractorProtocol?
    var router: EmployeeDetailRouterProtocol?
}

