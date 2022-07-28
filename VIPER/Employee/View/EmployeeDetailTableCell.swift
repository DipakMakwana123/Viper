//
//  EmployeeDetailTableCell.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 27/07/22.
//

import UIKit

class EmployeeDetailTableCell: UITableViewCell {
    
    static let identifier = "EmployeeDetailTableCell"
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var lblSalary: UILabel?
    @IBOutlet weak var lblAge: UILabel?
    @IBOutlet weak var lblId: UILabel?
    @IBOutlet weak var profileImageView: UIImageView?
    @IBOutlet weak var backView: UIView?
    
    var empData: Datum? {
        didSet {
            lblId?.text = "Employee Id: \(empData?.id ?? 0)"
            lblName?.text = "Name: \(empData?.name ?? "")"
            lblSalary?.text = "Salary: \(empData?.salary ?? 0)"
            lblAge?.text = "Age: \(empData?.age ?? 0)"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    private func  configureView(){
        backView?.layer.cornerRadius = 10
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
