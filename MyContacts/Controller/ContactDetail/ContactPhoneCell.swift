//
//  ContactPhoneCell.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import UIKit

class ContactPhoneCell: UITableViewCell {

    static let REUSE_IDENTIFIER = "ContactPhoneReuseIdentifier"
    
    @IBOutlet weak var phoneTypeLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var phone:PhoneType? {
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
    }

    func setupCell() {
        phoneTypeLabel.text = phone?.type
        phoneNumberLabel.text = phone?.number
    }
}
