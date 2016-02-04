//
//  File.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol EmailType {
    var email:String { get }
    var label:String { get }
}

struct Email {
    
    let email:String
    let label:String
    
    // Initializer
    init (json:JSON) {
        email = json["email"].stringValue
        label = json["label"].stringValue
    }
}

extension Email:EmailType { }