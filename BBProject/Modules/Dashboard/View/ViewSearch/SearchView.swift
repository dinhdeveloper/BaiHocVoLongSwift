//
//  SearchView.swift
//  BBProject
//
//  Created by IOS DEV02 on 23/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation
import UIKit

class SearchView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() {
        setUpViewSearch()
        setUpIconSearch()
        setUpedtSearch()
    }
    
    public var viewSearch: UIView = {
       let viewSearch = UIView()
        viewSearch.layer.cornerRadius = 7
        viewSearch.layer.borderWidth = 1
        viewSearch.layer.borderColor = UIColor.gray.cgColor
        return viewSearch
    }()
    
    func setUpViewSearch() {
        addSubview(viewSearch)
        viewSearch.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.center.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    let iconSearch: UIImageView =  {
        let iconSearch = UIImageView()
        iconSearch.image = UIImage(named: "iconSearch")
        iconSearch.alpha = 0.4
        iconSearch.contentMode = .scaleAspectFit //scale image
        return iconSearch
    }()
    
    func setUpIconSearch() {
        viewSearch.addSubview(iconSearch)
        iconSearch.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
    
    var edtSearch: UITextField = {
        let edtSearch = UITextField()
        edtSearch.placeholder = "Tìm kiếm theo sản phẩm"
        edtSearch.tintColor = .gray
        edtSearch.textColor = .black
        return edtSearch
    }()
    
    func setUpedtSearch() {
        viewSearch.addSubview(edtSearch)
        edtSearch.snp.makeConstraints { (make) in
            make.left.equalTo(iconSearch.snp.right).offset(20)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
        }
    }
    
}
