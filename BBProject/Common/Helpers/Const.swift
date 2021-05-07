//
//  Const.swift
//  BBProject
//
//  Created by IOS DEV02 on 07/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class Const {
    private init(){}
    class EmployeeDefault {
        private init(){}
        static var is_login = false
        static var is_login_Df = UserDefaults()
        static var is_login_Dfkey = "is_login_Dfkey"
        
        static var id_Df = UserDefaults()
        static var id_Df_key = "id_Df_key"
        static var phone_Df = UserDefaults()
        static var phone_Df_key = "phone_Df_key"
        static var level = UserDefaults()
        static var level_Df_key = "level_Df_key"
        static var level_name = UserDefaults()
        static var level_name_Df_key = "level_name_Df_key"
        static var fullname_Df = UserDefaults()
        static var fullname_Df_key = "fullname_Df_key"
        static var id_code_Df = UserDefaults()
        static var id_code_Df_key = "id_code_Df_key"
        static var employee = Employee()
        static var id_business_Df = UserDefaults()
        static var id_business_Df_key = "id_business_Df_key"
        
        static var store_name_Df = UserDefaults()
        static var store_name_Df_Key = "store_name_Df_Key"
        static var store_address_Df = UserDefaults()
        static var store_address_Df_Key = "store_address_Df_Key"
        static var store_phone_Df = UserDefaults()
        static var store_phone_Df_Key = "store_phone_Df_Key"
        
        static var store_begin_Df = UserDefaults()
        static var store_begin_Df_Key = "store_begin_Df_Key"
        static var store_end_Df = UserDefaults()
        static var store_end_Df_Key = "store_end_Df_Key"
    }
    
}
