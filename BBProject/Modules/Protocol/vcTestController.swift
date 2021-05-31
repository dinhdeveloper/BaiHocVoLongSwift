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
        setUpBtn()
    }
    
    var btn: UIButton = {
       let btn = UIButton()
        btn.setTitle("Chon", for: .normal)
        btn.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        btn.addTarget(self, action: #selector(abtnSelectEmployee(_:)), for: .touchUpInside)
        return btn
    }()
    
    func setUpBtn() {
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(40)
        }
    }
    
    @objc private func abtnSelectEmployee(_ sender: UIButton){
        let vc = vcListPopup()
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        vc.view.isOpaque = false
        present(vc, animated: false, completion: nil)
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
