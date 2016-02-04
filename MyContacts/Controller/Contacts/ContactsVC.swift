//
//  ContractsVC.swift
//  MyContacts
//
//  Created by Pae on 2/3/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import UIKit

class ContactsVC: UITableViewController {

    var contacts = [ContactType]() {
        didSet{
            refreshTable()
        }
    }
    
    var filteredContacts = [ContactType]() {
        didSet{
            refreshTable()
        }
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        
        self.tableView.tableHeaderView?.addSubview(searchController.searchBar)
        self.tableView.tableHeaderView?.frame.size.height += 30
        
        if self.revealViewController() != nil {
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "MenuIndicator"), style: .Plain, target: self.revealViewController(), action: "revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        SVProgressHUD.show()
        APIManager.getContacts{ contacts, error in
            SVProgressHUD.dismiss()
            guard let contacts = contacts where error == nil else {
                let alertVC = UIAlertController(title: nil, message: "Loading error occured.", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                alertVC.addAction(action)
                self.presentViewController(alertVC, animated: true, completion: nil)
                return
            }
            self.contacts = contacts
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        navigationItem.title = "Contacts"
        searchController.searchBar.hidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Contacts"
        searchController.searchBar.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshTable() {
        tableView.reloadData()
    }
    
    func onBarMenu() {
        print("BarMenu")
    }
}

// MARK: UITableViewDataSource
extension ContactsVC {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredContacts.count
        }
        return contacts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ContactsTableViewCell.REUSE_IDENTIFIER, forIndexPath: indexPath) as! ContactsTableViewCell
        let contact: ContactType
        if searchController.active && searchController.searchBar.text != "" {
            contact = filteredContacts[indexPath.row]
        } else {
            contact = contacts[indexPath.row]
        }
        
        // Configure the cell...
        cell.contact = contact
        return cell
    }
}

// MARK: - UITableView Delegate
extension ContactsVC {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let contact: ContactType
        if searchController.active && searchController.searchBar.text != "" {
            contact = filteredContacts[indexPath.row]
        } else {
            contact = contacts[indexPath.row]
        }
        
        // Don't like to use storyboard segue.
        if let contactDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(kStoryboardIdContactDetailVC) as? ContactDetailVC{
            contactDetailVC.contact = contact
            navigationController?.pushViewController(contactDetailVC, animated: true)
        }
    }
}

// MARK: - UISearchResultsUpdating
extension ContactsVC: UISearchResultsUpdating {
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        let searchText = searchController.searchBar.text!
        filteredContacts = contacts.filter { $0.name.lowercaseString.containsString(searchText.lowercaseString) == true}
    }
}
