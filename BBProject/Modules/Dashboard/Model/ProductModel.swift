//
//  ProductModel.swift
//  BBProject
//
//  Created by IOS DEV02 on 23/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation

struct ProductModel {
    var productId: String
    var categoryId: String
    var productName: String
    var productPrice: String
    var productImage: String
    
    init(){
         productId = ""
         categoryId = ""
         productName = ""
         productPrice = ""
         productImage = ""
    }
    init(object: AnyObject) {
        if let dic: [String: AnyObject] = object as? [String: AnyObject]{
            productId = dic["productId"] as? String ?? ""
            categoryId = dic["categoryId"] as? String ?? ""
            productName = dic["productName"] as? String ?? ""
            productPrice = dic["productPrice"] as? String ?? ""
            productImage = dic["productImage"] as? String ?? ""
        
        }else{
             productId = ""
             categoryId = ""
             productName = ""
             productPrice = ""
             productImage = ""
        }
    }
}
