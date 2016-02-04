//
//  CompanyDetails.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol CompanyDetailsType {
    var location:String { get }
    var name:String { get }
}

struct CompanyDetails {
    
    let location:String
    let name:String
    
    // Initializer
    init (json:JSON) {
        location = json["location"].stringValue
        name = json["name"].stringValue
    }
}

extension CompanyDetails:CompanyDetailsType { }
