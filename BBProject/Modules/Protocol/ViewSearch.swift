//
//  ViewSearch.swift
//  BBProject
//
//  Created by IOS DEV02 on 27/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class ViewSearch: BaseView {
    
    override func initialize() {
        self.layer.cornerRadius = Dimension.shared.BBHeight(height: 17)
        setupViewMain()
        setupImgSearch()
        setuptxtSearch()
    }
    

    var view_bg: UIView = {
        let v = UIView()
        v.backgroundColor = Theme.shared.white_color
        v.addshadow(width: 1, height: 3, opacity: 0.5, radius: 3, color: .gray)
        v.layer.cornerRadius = Dimension.shared.BBHeight(height: 8)
        v.layer.borderColor = Theme.shared.white_color.cgColor
        v.layer.borderWidth = Dimension.shared.BBWidth(width: 1.5)
        return v
    }()
    var img_search: UIImageView = {
        let img = UIImageView()
        img.image = Resource.Images.shared.search
        img.clipsToBounds = true
        return img
    }()
    var txtSearch: UITextField = {
        let txt = UITextField()
        txt.addDoneToolBar()
        txt.returnKeyType = .search
        txt.font = UIFont(name: Resource.FontName.shared.general, size: 17)
        txt.attributedPlaceholder = NSAttributedString(string: Resource.Title.shared.search,
                                                       attributes: [NSAttributedStringKey.foregroundColor: Theme.shared.white_color, NSAttributedStringKey.font : UIFont(name: Resource.FontName.shared.general, size: Dimension.shared.BBFontsize(fsize: 15)) as Any])
        txt.backgroundColor = .clear
        txt.textColor = Theme.shared.white_color
        txt.clearButtonMode = .whileEditing
        return txt
    }()
    
    //MARK: Setup view
    private func setupViewMain(){
        addSubview(view_bg)
        view_bg.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(Dimension.shared.BBHeight(height: 42))
        }
    }
    private func setupImgSearch(){
        addSubview(img_search)
        img_search.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Dimension.shared.BBWidth(width: 20))
            make.width.equalTo(Dimension.shared.BBWidth(width: 20))
            make.height.equalTo(Dimension.shared.BBWidth(width: 20))
            make.centerY.equalToSuperview()
        }
    }
    private func setuptxtSearch(){
        addSubview(txtSearch)
        txtSearch.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.BBHeight(height: 1))
            make.left.equalTo(img_search.snp.right).offset(Dimension.shared.BBWidth(width: 10))
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-Dimension.shared.BBWidth(width: 5))
        }
    }
}
