//
//  BaseProtocol.swift
//  BBProject
//
//  Created by IOS DEV02 on 25/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

enum LogType: String{
    case error
    case warning
    case success
    case action
    case canceled
}

protocol BaseProtocol {
    
    var vSpinner : UIView? { get set }
    
    func initialize()
    
    func loger(_ logType:LogType,_ message: String)
    
    func hidePopupError(_ sender: UIButton)
    
    func showSpinner(onView : UIView)
    func removeSpinner()
    
    func showLoadingHub()
    func hideLoadingHub()
    
    func showToast(message : String)
    
    func requestApi(param: Dictionary<String, Any>,completionHandler:@escaping (ResultResponse?)->())
    
}
