//
//  UIView+CornerRadius.swift
//  MyContacts
//
//  Created by Pae on 2/4/16.
//  Copyright © 2016 Pae. All rights reserved.
//

import Foundation

extension UIView {
    func setCornerRadius(cornerRadius:CGFloat, borderWidth:CGFloat, borderColor:UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor.CGColor;
        self.layer.masksToBounds = true;
    }
}