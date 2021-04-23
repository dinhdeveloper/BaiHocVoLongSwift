//
//  CellCustomerManager.swift
//  BBProject
//
//  Created by IOS DEV02 on 19/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class CellCustomerManager: BaseTableViewCell {
    
    override func initialize() {
        setUpImageView()
        setUpTvName()
    }
    
    private let imageCustomer : UIImageView = {
        let imageCustomer = UIImageView()
        return imageCustomer
    }()
    
    private func setUpImageView() {
        addSubview(imageCustomer)
        imageCustomer.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    private var tvName : UILabel = {
        let tvName = UILabel()
        tvName.textColor = .black
        return tvName
        
    }()
    
    private func setUpTvName() {
        addSubview(tvName)
        tvName.snp.makeConstraints { (make) in
            make.left.equalTo(imageCustomer.snp.right).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(200)
            make.centerY.equalTo(imageCustomer.snp.centerY)
        }
    }
    
    func displayCell(customer: MusicModel){
        tvName.text = customer.name
        imageCustomer.displayImgPhoto(urlPhoto: customer.images, photo_default: Resource.Images.shared.photoDefault)
    }
}
