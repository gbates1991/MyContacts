//
//  SignInVC.swift
//  MyContacts
//
//  Created by Pae on 2/3/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var pwdText: UITextField!
    
    @IBAction func onForgotPwd(sender: AnyObject) {
        
    }
    
    @IBAction func onSignIn(sender: AnyObject) {
        if let contactsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(kStoryboardIdContactsVC) as? ContactsVC{
            let navVC = UINavigationController(rootViewController: contactsVC)
            let sideMenuBarVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(kStoryboardIdSideBarMenuVC) as? SideBarMenuVC
            let revealVC = SWRevealViewController(rearViewController: sideMenuBarVC, frontViewController: navVC)
            presentViewController(revealVC, animated: true, completion: nil)
        }
    }
}
