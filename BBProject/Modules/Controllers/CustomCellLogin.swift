//
//  CustomCellLogin.swift
//  BBProject
//
//  Created by IOS DEV02 on 06/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class CustomCellLogin: BaseView {
    

    override func initialize() {
        
        backgroundColor = UIColor.white
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        clipsToBounds = true
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2) // do bong
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.2
        setUpTextLogin()
        setUpEdt()
    }
    
    var tvLogin: UILabel = {
       let textLogin = UILabel()
        textLogin.textAlignment = .left
        textLogin.textColor = .black
        textLogin.font = UIFont(name: "nomal" , size: 14)
        return textLogin
    }()
    
    func setUpTextLogin() {
        addSubview(tvLogin)
        tvLogin.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(10)
            //make.height.equalTo(21)
        }
    }
    
    var edtLogin: UITextField = {
        let edt = UITextField()
        edt.textAlignment = .left
        edt.textColor = .black
//        edt.layer.cornerRadius = 6
//        edt.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
//        edt.layer.borderWidth = 0.5
        return edt
    }()
    
    func setUpEdt() {
        addSubview(edtLogin)
        edtLogin.snp.makeConstraints { (make) in
            make.top.equalTo(tvLogin.snp.bottom).offset(5)
            make.left.equalTo(tvLogin.snp.left)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(38)
        }
    }
}
