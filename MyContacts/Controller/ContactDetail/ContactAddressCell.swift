//
//  ContactAddressCell.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import UIKit

class ContactAddressCell: UITableViewCell {

    static let REUSE_IDENTIFIER = "ContactAddressReuseIdentifier"
    
    @IBOutlet weak var addressLabel: UILabel!
    
    var address:AddressType? {
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
        addressLabel.text = "\(address!.address1) \(address!.address2) \(address!.address3), \(address!.zipcode), \(address!.city), \(address!.state), \(address!.country)"
    }
}
