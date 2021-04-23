//
//  CellMusicColectionView.swift
//  BBProject
//
//  Created by IOS DEV02 on 22/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation
import UIKit

class CellMusicColectionView: BaseCollectionCell {
    
    override func initialize() {
        setUpTvLable()
    }
    
    private let imageCustomer : UIImageView = {
        let tvLable = UIImageView()
        return tvLable
    }()
    
    func setUpTvLable() {
        addSubview(imageCustomer)
        imageCustomer.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
        }
    }
    
    func displayCell(customer: CategoryModel){
        imageCustomer.displayImgPhoto(urlPhoto: customer.categoryImage, photo_default: Resource.Images.shared.photoDefault)
    }
    
}
