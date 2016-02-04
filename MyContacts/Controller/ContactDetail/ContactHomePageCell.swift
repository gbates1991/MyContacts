//
//  ContactHomePageCell.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import UIKit

class ContactHomePageCell: UITableViewCell {

    static let REUSE_IDENTIFIER = "ContactHomePageReuseIdentifier"

    @IBOutlet weak var homepageUrl: UILabel!
    
    var contact:ContactType? {
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
        guard let contact = contact else {return}

        homepageUrl.text = contact.homePage
    }
}
