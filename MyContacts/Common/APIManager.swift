//
//  APIManager.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

// Simple wrapper for fetching assets
class APIManager {
    class func getContacts(completion:([ContactType]?, ErrorType?) -> ()){
        
        SVProgressHUD.show()
        
        Alamofire.request(.GET, kURLJson)
            .responseData { response  in
                // When error occured
                guard let data = response.result.value where response.result.error == nil else {
                    completion(nil, response.result.error)
                    SVProgressHUD.dismiss()
                    return
                }
                
                // As much simple it can be.
                SVProgressHUD.dismiss()
                completion (JSON(data: data).arrayValue.map{Contact(json: $0)}, nil)
        }
    }
}