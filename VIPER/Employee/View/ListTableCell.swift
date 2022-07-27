//
//  ListTableCell.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 27/07/22.
//

import UIKit

class ListTableCell: UITableViewCell {

    static let identifier = "ListTableCell"
    
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblDescription: UILabel?
    
    var empData: Datum? {
        didSet {
            lblTitle?.text = empData?.name
            lblDescription?.text = "Salary: \(empData?.salary ?? 0)"
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
