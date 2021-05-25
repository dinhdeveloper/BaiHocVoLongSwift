//
//  API.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

class API {
    private init() {}
    static var shared = API()
    
    private var url_local = "http://192.168.100.37/edu_player/api/"
    private var thumnail_local = "http://192.168.100.37/edu_player/"
    
    private var url_dev = "http://eduplayer.nongtrangviet.com/api/"
    private var thumnail_dev = "http://eduplayer.nongtrangviet.com/"
    
    lazy var baseUrl : String = url_dev
    lazy var baseUrl_thumbnail : String = thumnail_dev
    
    var api_category_manager = "product_category_manager"
    var api_product_manager = "product_manager"
    var api_packages_manager = "package_product_manager"
    var api_supplier_manager = "supplier_manager"
    var api_login = "employee_login"
    
    var detect : String = "detect"
    var type_manager : String = "type_manager"
    var check_phone_isset : String = "check_phone_isset"
    var register : String = "register"
    var login : String = "login"
    var customer_manager : String = "customer_manager"
    var list_customer = "list_customer"
    var forgot_password = "forgot_password"
    let list_product = "list_product"
    let list_category = "list_category"
    let check_product_favourite = "check_product_favourite"
    let favourite_music = "favourite_music"
    let create_favourite = "create_favourite"
    let delete_favourite = "delete_favourite"
    let change_pass = "change_pass"
    let id_category = "id_category"
}

