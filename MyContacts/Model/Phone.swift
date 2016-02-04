//
//  Phone.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol PhoneType {
    var number:String { get }
    var type:String { get }
}

struct Phone {
    
    let number:String
    let type:String

    // Initializer
    init (json:JSON) {
        number = json["number"].stringValue
        type = json["type"].stringValue
    }
}

extension Phone:PhoneType { }
