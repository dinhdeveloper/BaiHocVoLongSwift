//
//  CategoryModel.swift
//  BBProject
//
//  Created by IOS DEV02 on 23/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation

struct CategoryModel {
    var categoryId: String
    var categoryName: String
    var categoryImage: String
    var promotionId: String
    var checkChoose : Bool
    
    init(){
        categoryId = ""
        categoryName = ""
        categoryImage = ""
        promotionId = ""
        checkChoose = false
    }
    init(object: AnyObject) {
        if let dic: [String: AnyObject] = object as? [String: AnyObject]{
            categoryId = dic["categoryId"] as? String ?? ""
            categoryName = dic["categoryName"] as? String ?? ""
            categoryImage = dic["categoryImage"] as? String ?? ""
            promotionId = dic["promotionId"] as? String ?? ""
            checkChoose = false
        
        }else{
            categoryId = ""
            categoryName = ""
            categoryImage = ""
            promotionId = ""
            checkChoose = false
        }
    }
}
