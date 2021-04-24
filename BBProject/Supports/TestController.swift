//
//  TestController.swift
//  BBProject
//
//  Created by IOS DEV02 on 24/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation
import UIKit

class TestController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTete()
    }
    
    var tete: ProductCell = {
       var tete = ProductCell()
        return tete
    }()
    
    func setUpTete() {
        view.addSubview(tete)
        tete.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}
