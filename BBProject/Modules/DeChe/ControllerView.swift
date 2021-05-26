//
//  ControllerView.swift
//  BBProject
//
//  Created by IOS DEV02 on 26/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class ControllerView: vcBaseController,ProtocolController {
    
    private var arrCategory: [CategoryModel] = []
    
    override func initialize() {
        view.backgroundColor = .white
        setUpBtnCallApi()
    }
    
    var btnCallApi : UIButton = {
        let btn = UIButton()
        btn.setTitle("Call API", for: .normal)
        btn.backgroundColor = .gray
        btn.addTarget(self, action: #selector(callApi(_:)), for: .touchUpInside )
        return btn
    }()
    
    func setUpBtnCallApi() {
        view.addSubview(btnCallApi)
        btnCallApi.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(40)
        }
    }
    
    @objc func callApi(_ sender: UIButton) {
        callApiAA()
    }
    
    func callApiAA() {
        let param = [API.shared.detect: "list_category"]
        
        requestApi(param: param) { (response) in
            if response?.success == Resource.Response.shared.success_true {
                response?.data.forEach({ (i) in
                    let item = CategoryModel(object: i)
                    self.arrCategory.append(item)
                })
            }else {
                print("àdsf")
            }
            
        }
    }
}
