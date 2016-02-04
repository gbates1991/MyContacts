//
//  Address.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol AddressType {
    var address1:String { get }
    var address2:String { get }
    var address3:String { get }
    var zipcode:Int { get }
    var country:String { get }
    var city:String { get }
    var state:String { get }
}

struct Address {
    
    let address1:String
    let address2:String
    let address3:String
    let zipcode:Int
    let country:String
    let city:String
    let state:String
    
    // Initializer
    init (json:JSON) {
        address1 = json["address1"].stringValue
        address2 = json["address2"].stringValue
        address3 = json["address3"].stringValue
        zipcode = json["zipcode"].intValue
        country = json["country"].stringValue
        city = json["city"].stringValue
        state = json["state"].stringValue
    }
}

extension Address:AddressType { }