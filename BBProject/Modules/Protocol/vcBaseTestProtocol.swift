//
//  vcBaseTestProtocol.swift
//  BBProject
//
//  Created by IOS DEV02 on 25/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit


class vcBaseControl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func initialize(){}

    lazy private var popup_error: BaseViewPopUp = {
        let popup = BaseViewPopUp()
        popup.btnOK.backgroundColor = Theme.shared.ograneColor
        popup.btnOK.addTarget(self, action: #selector(actionHidePopupError(_:)), for: .touchUpInside)
        return popup
    }()
    
    @objc private func actionHidePopupError(_ sender: UIButton){
        popup_error.removeFromSuperview()
    }
}
