//
//  ListTableCell.swift
//  VIPER
//
//  Created by Dipakbhai Valjibhai Makwana on 26/07/22.
//

import UIKit

class ListTableCell: UITableViewCell {
    
    static let identifier = "ListTableCell"
    
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblDescription: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
