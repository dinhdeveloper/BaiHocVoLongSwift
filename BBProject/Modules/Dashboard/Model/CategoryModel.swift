//
//  CategoryModel.swift
//  BBProject
//
//  Created by IOS DEV02 on 23/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation

struct CategoryModel {
    var categoryId: Int
    var categoryName: String
    var categoryImage: String
    var promotionId: String
    var category_vn_title: String
    var checkChoose : Bool
    
    
    init(){
        categoryId = 0
        categoryName = ""
        categoryImage = ""
        promotionId = ""
        category_vn_title = ""
        checkChoose = false
    }
    init(object: AnyObject) {
        if let dic: [String: AnyObject] = object as? [String: AnyObject]{
            categoryId = dic["categoryId"] as? Int ?? 0
            categoryName = dic["categoryName"] as? String ?? ""
            category_vn_title = dic["category_vn_title"] as? String ?? ""
            categoryImage = dic["categoryImage"] as? String ?? ""
            promotionId = dic["promotionId"] as? String ?? ""
            checkChoose = false
        
        }else{
            categoryId = 0
            categoryName = ""
            categoryImage = ""
            promotionId = ""
            category_vn_title = ""
            checkChoose = false
        }
    }
}
