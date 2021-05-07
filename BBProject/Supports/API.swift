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
    
    static var detect : String = "detect"
    
    private var baseUrl_live = "https://kimantai.com/api/"
    private var base_thumbnail_live = "https://kimantai.com/"
    
    lazy var baseUrl : String = baseUrl_live
    lazy var baseUrl_thumbnail : String = base_thumbnail_live
    
    var api_category_manager = "product_category_manager"
    var api_product_manager = "product_manager"
    var api_packages_manager = "package_product_manager"
    var api_supplier_manager = "supplier_manager"
    var api_login = "employee_login"
}

