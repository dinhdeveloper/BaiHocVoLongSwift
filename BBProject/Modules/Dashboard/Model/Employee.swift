//
//  Employee.swift
//  BBProject
//
//  Created by IOS DEV02 on 07/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

struct Employee{
    var id: String
    var id_code: String
    var full_name: String
    var email: String
    var phone_number: String
    var address: String
    var is_check: Bool
    var birthday: String
    var image: String
    var status: String
    var level: String
    var level_name: String
    var store_code: String
    var store_name: String
    var store_code_name: String
    var store_address: String
    var store_phone: String
    var store_begin: String
    var store_end: String
    
    init() {
        id = ""
        id_code = ""
        full_name = ""
        email = ""
        phone_number = ""
        address = ""
        is_check = false
        birthday = ""
        level = ""
        status = ""
        image = ""
        level_name = ""
        store_code = ""
        store_name = ""
        store_code_name = ""
        store_address = ""
        store_phone = ""
        store_begin = ""
        store_end = ""
    }
    
    init(object: AnyObject) {
        if let dic: [String: AnyObject] = object as? [String: AnyObject] {
            id = dic["id"] as? String ?? ""
            id_code = dic["id_code"] as? String ?? ""
            full_name = dic["full_name"] as? String ?? "Haven't fullname"
            email = dic["email"] as? String ?? ""
            phone_number = dic["phone_number"] as? String ?? ""
            address = dic["address"] as? String ?? ""
            image = API.shared.baseUrl_thumbnail + (dic["image"] as? String ?? "")
            level = dic["level"] as? String ?? ""
            image = dic["image"] as? String ?? ""
            status = dic["status"] as? String ?? ""
            birthday = dic["birthday"] as? String ?? ""
            store_code = dic["id_business"] as? String ?? ""
            store_name = dic["store_name"] as? String ?? ""
            store_phone = dic["store_phone"] as? String ?? ""
            store_address = dic["store_address"] as? String ?? ""
            store_begin = dic["store_begin"] as? String ?? ""
            store_end = dic["store_end"] as? String ?? ""
            is_check = false
            switch level {
            case "2":
                level_name = "Admin"
            default:
                level_name = "Nhân viên"
            }
            //2: admin, 1: bán hàng
            store_code_name = ""

        }else{
            id = ""
            id_code = ""
            full_name = ""
            email = ""
            phone_number = ""
            address = ""
            is_check = false
            birthday = ""
            level = ""
            status = ""
            image = ""
            level_name = ""
            store_code = ""
            //2: admin, 1: bán hàng
            store_name = ""
            store_code_name = ""
            store_address = ""
            store_phone = ""
            store_begin = ""
            store_end = ""
        }
    }
    
}
