//
//  EmployeeDetailRouter.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 27/07/22.
//

import Foundation

protocol EmployeeDetailRouterProtocol{
    func setUp() 
}
class EmployeeDetailRouter: EmployeeDetailRouterProtocol{
    
     func setUp() {
        
        let router = EmployeeDetailRouter()
        
        var view: EmployeeDetailViewProtocol =  EmployeeDetailViewController()
        var presenter: EmployeeDetailPresenterProtocol = EmployeeDetailPresenter()
        var intractor: EmployeeDetailIntractorProtocol = EmployeeDetailIntractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = intractor
        presenter.router = router
        intractor.presenter = presenter
         
    }
}
