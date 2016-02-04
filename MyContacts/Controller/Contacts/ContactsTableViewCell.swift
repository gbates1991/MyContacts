//
//  ContactsTableViewCell.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import UIKit
import SDWebImage

class ContactsTableViewCell: UITableViewCell {
    
    static let REUSE_IDENTIFIER = "ContactsTableViewCellReuseIdentifier"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var contact:ContactType?{
        didSet{
            setupCell()
        }
    }
    
    func setupCell(){
        guard let contact = contact else {
            return
        }
        
        textLabel?.text = contact.name
        detailTextLabel?.text = contact.position
        imageView?.setCornerRadius(10.0, borderWidth: 1.0, borderColor: UIColor.grayColor())
        if let url = contact.imageUrl {
            imageView?.sd_setImageWithURL(url, placeholderImage: UIImage(named: "PhotoPlace"))
        }
    }
}
