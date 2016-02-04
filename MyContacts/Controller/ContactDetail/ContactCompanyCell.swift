//
//  ContactCompanyCell.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import UIKit

class ContactCompanyCell: UITableViewCell {

    static let REUSE_IDENTIFIER = "ContactCompanyDetailsReuseIdentifier"
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyLocationLabel: UILabel!
    
    var company:CompanyDetailsType? {
        didSet {
            setupCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell() {
        companyNameLabel.text = company?.name
        companyLocationLabel.text = company?.location
    }
}
