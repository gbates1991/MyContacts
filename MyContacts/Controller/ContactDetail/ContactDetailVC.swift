//
//  ContactDetailVC.swift
//  MyContacts
//
//  Created by Pae on 2/3/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import UIKit

class ContactDetailVC: UITableViewController {
    
    var contact: ContactType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Contact Details"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshTable() {
        tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Fade)
    }
}

// MARK: UITableViewDataSource
extension ContactDetailVC {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let contact = contact { return contact.categoryCount }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let detailCategory = contact!.categoryTypeAtDetailIndex(indexPath.row)
        
        switch detailCategory {
        case .Basic:
            let cell = tableView.dequeueReusableCellWithIdentifier(ContactHeaderCell.REUSE_IDENTIFIER, forIndexPath: indexPath) as! ContactHeaderCell
            cell.contact = self.contact
            return cell
        case .HomePage:
            let cell = tableView.dequeueReusableCellWithIdentifier(ContactHomePageCell.REUSE_IDENTIFIER, forIndexPath: indexPath) as! ContactHomePageCell
            cell.contact = self.contact
            return cell
        case .Email:
            let cell = tableView.dequeueReusableCellWithIdentifier(ContactEmailCell.REUSE_IDENTIFIER, forIndexPath: indexPath) as! ContactEmailCell
            cell.email = self.contact?.emailAtDetailIndex(indexPath.row)
            return cell
        case .Address:
            let cell = tableView.dequeueReusableCellWithIdentifier(ContactAddressCell.REUSE_IDENTIFIER, forIndexPath: indexPath) as! ContactAddressCell
            cell.address = self.contact?.addressAtDetailIndex(indexPath.row)
            return cell
        case .CompanyDetails:
            let cell = tableView.dequeueReusableCellWithIdentifier(ContactCompanyCell.REUSE_IDENTIFIER, forIndexPath: indexPath) as! ContactCompanyCell
            cell.company = self.contact?.companyDetails
            return cell
        case .Phone:
            let cell = tableView.dequeueReusableCellWithIdentifier(ContactPhoneCell.REUSE_IDENTIFIER, forIndexPath: indexPath) as! ContactPhoneCell
            cell.phone = self.contact?.phoneAtDetailIndex(indexPath.row)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableView Delegate
extension ContactDetailVC {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

