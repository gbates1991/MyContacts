//
//  SideBarMenuVC.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import UIKit

class SideBarMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignOut(sender: AnyObject) {
        self.revealViewController().dismissViewControllerAnimated(true, completion: nil)
    }
}
