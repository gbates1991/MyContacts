//
//  ContactEmailCell.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import UIKit

class ContactEmailCell: UITableViewCell {

    static let REUSE_IDENTIFIER = "ContactEmailReuseIdentifier"
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    
    var email:EmailType? {
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
        guard let email = email else {return}
        emailLabel.text = email.label
        emailAddress.text = email.email
    }
}
