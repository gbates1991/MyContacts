//
//  ContactHeaderCell.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import UIKit

class ContactHeaderCell: UITableViewCell {

    static let REUSE_IDENTIFIER = "ContactDetailHeaderReuseIdentifier"
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
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
        
        photoImage.setCornerRadius(20.0, borderWidth: 2.0, borderColor: UIColor.grayColor())
        if let url = contact.imageUrl {
            photoImage.sd_setImageWithURL(url, placeholderImage: UIImage(named: "PhotoPlace"))
        }
        
        nameLabel.text = contact.name
        positionLabel.text = contact.position
        ageLabel.text = "Age: \(contact.age)"
    }

}
