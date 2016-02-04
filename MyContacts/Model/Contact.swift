//
//  Contact.swift
//  MyContacts
//
//  Created by Pae on 2/3/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ContactType {
    var imageUrl:NSURL? { get }
    var homePage:String { get }
    var emails:[EmailType] { get }
    var name:String { get }
    var position:String { get }
    var address:[AddressType] { get }
    var companyDetails:CompanyDetailsType { get }
    var age:Int { get }
    var phone:[PhoneType] { get }
    
    var categoryCount:Int { get }
    
    func categoryTypeAtDetailIndex(index:Int) -> ContactInfoCategory
    func emailAtDetailIndex(index:Int) -> EmailType?
    func addressAtDetailIndex(index:Int) -> AddressType?
    func phoneAtDetailIndex(index:Int) -> PhoneType?
}

enum ContactInfoCategory {
    case Basic
    case HomePage
    case Email
    case Address
    case CompanyDetails
    case Phone
    case None
}

struct Contact {
    
    let imageUrl:NSURL?
    let homePage:String
    let emails:[EmailType]
    let name:String
    let position:String
    let address:[AddressType]
    let companyDetails:CompanyDetailsType
    let age:Int
    let phone:[PhoneType]
    
    var categoryCount:Int {
        get {
            return 1/*photo,name,age,position*/+1/*homepage*/+emails.count+address.count+1/*company*/+phone.count
        }
    }
    
    func categoryTypeAtDetailIndex(index:Int) -> ContactInfoCategory {
        if index == 0 {return .Basic}
        else if index == 1 {return .HomePage}
        else if index < 2+emails.count {return .Email}
        else if index < 2+emails.count+address.count {return .Address}
        else if index == 2+emails.count+address.count {return .CompanyDetails}
        else if index < 3+emails.count+address.count+phone.count {return .Phone}
        return .None
    }
    
    func emailAtDetailIndex(index:Int) -> EmailType? {
        let id = index-2
        if id >= 0 && id < emails.count {
            return emails[id]
        }
        return nil
    }
    
    func addressAtDetailIndex(index:Int) -> AddressType? {
        let id = index-emails.count-2
        if id >= 0 && id < address.count {
            return address[id]
        }
        return nil
    }
    
    func phoneAtDetailIndex(index:Int) -> PhoneType? {
        let id = index-emails.count-address.count-3
        if id >= 0 && id < phone.count {
            return phone[id]
        }
        return nil
    }
    
    // Initializer
    init (json:JSON) {
        imageUrl = NSURL(string: json["imageUrl"].stringValue)
        homePage = json["homePage"].stringValue
        emails = json["emails"].arrayValue.map {Email(json:$0)}
        name = json["name"].stringValue
        position = json["position"].stringValue
        address = json["address"].arrayValue.map {Address(json:$0)}
        companyDetails = CompanyDetails(json: json["companyDetails"])
        age = json["age"].intValue
        phone = json["phone"].arrayValue.map {Phone(json:$0)}
    }

}

extension Contact:ContactType { }