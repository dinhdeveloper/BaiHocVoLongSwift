//
//  ProductDetailController.swift
//  BBProject
//
//  Created by IOS DEV02 on 24/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ProductDetailController : UIViewController
{
    public var data = ProductModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpImage()
        
        self.imvProduct.displayImgPhoto(urlPhoto: data.productImage, photo_default: Resource.Images.shared.photoDefault)
        self.title = "\(data.productName)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        backButton.setBackgroundImage(Resource.Images.shared.backHeader, for: .normal)
        backButton.addTarget(self, action: #selector(backHeader), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        
        
        //        let backButtonItem = UIBarButtonItem(image: Resource.Images.shared.backHeader, style: .plain, target: self, action: #selector(backHeader))
        //        navigationController!.navigationBar.draw(CGRect(x: 0, y: 0, width: 40, height: 40))
        //        navigationItem.leftBarButtonItem = backButtonItem
    }
    
    let imvProduct : UIImageView  = {
        let imageProduct = UIImageView()
        imageProduct.contentMode = .scaleAspectFit //scale image
        return imageProduct
    }()
    
    func setUpImage() {
        view.addSubview(imvProduct)
        imvProduct.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            }else{
                make.top.equalTo(topLayoutGuide.snp.top).offset(20)
            }
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
    }
    
    
    
    @objc func backHeader() {
        navigationController?.popViewController(animated: true)
    }
}
