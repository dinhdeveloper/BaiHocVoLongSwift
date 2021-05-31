//
//  CellItemList.swift
//  BBProject
//
//  Created by IOS DEV02 on 27/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class CellItemList: BaseTableViewCell {
    
    override func initialize(){
        backgroundColor = .white
        setUpCell()
        setUplbTitle()
        setUpImgChecked()
    }
    
    //MARK: mapping data
    func displayCell(customer: CategoryModel){
        lbTitle.text = customer.category_vn_title
//        if customer.checkChoose {
//            imgChecked.isHidden = false
//        }else {
//            imgChecked.isHidden = true
//        }
    }
    
    //MARK: ui element
    var cellItem : UIView = {
       let cell = UIView()
        cell.backgroundColor = .white
        return cell
    }()
    
    var lbTitle: UILabel = {
       let lb = UILabel()
        lb.textColor = .black
        lb.font = UIFont(name: Resource.FontName.shared.general, size: 17)
        return lb
    }()
    
    var imgChecked : UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "check1x")
        return img
    }()
    
    
    //MARK: setup view
    func setUpCell() {
        addSubview(cellItem)
        cellItem.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(Dimension.shared.BBHeight(height: 38))
        }
    }
    
    func setUplbTitle() {
        cellItem.addSubview(lbTitle)
        lbTitle.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Dimension.shared.BBWidth(width: 20))
            make.centerY.equalToSuperview()
        }
    }
    
    func setUpImgChecked() {
        cellItem.addSubview(imgChecked)
        imgChecked.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-Dimension.shared.BBWidth(width: 20))
        }
    }
}
