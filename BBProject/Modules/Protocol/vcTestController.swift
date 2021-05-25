//
//  vcTestController.swift
//  BBProject
//
//  Created by IOS DEV02 on 25/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class vcTestController: vcBaseControl {

    override func initialize() {
        view.backgroundColor = .white
        requestApi()
    }

    func requestApi() {
        getListCategory()
    }
    
    func getListCategory() {
        let param = [API.shared.detect: "list_category"]
        
        requestApi(param: param) { (response) in
            if response?.success == Resource.Response.shared.success_true {
                response?.data.forEach({ (i) in
                    let item = CategoryModel(object: i)
                })
            }else {
                print("àdsf")
            }
            
        }
    }
}
