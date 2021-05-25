//
//  vcBaseTestProtocol.swift
//  BBProject
//
//  Created by IOS DEV02 on 25/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit
import RSLoadingView
import Alamofire

class vcBaseControl: UIViewController , BaseProtocol {
    
    func requestApi(param: Dictionary<String, Any>, completionHandler: @escaping (ResultResponse?) -> ()) {
        showSpinner(onView: view)
        let url = API.shared.baseUrl
        let headers = ["Authorization": Resource.Method.shared.authen]
        Alamofire.request(url, method: HTTPMethod.post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch(response.result) {
                case .success(_):
                    DispatchQueue.main.async {
                        let obj: AnyObject = response.value as AnyObject
                        let result = ResultResponse(object: obj)
                        self.removeSpinner()
                        #if DEBUG
                            debugPrint("=======================================")
                            debugPrint(result)
                            debugPrint("=======================================")
                        #endif
                        completionHandler(result)
                    }
                    
                break
            case .failure(_):
                
                DispatchQueue.main.async {
                    self.removeSpinner()
                    print("error: \(response.description)")
                    if response.description.contains("Alamofire.AFError.ResponseSerializationFailureReason.inputDataNilOrZeroLength"){
                        self.popError.showPopUp(parentView: self.view, mess: "Lỗi dữ liệu", title: Resource.Title.shared.title_error, type: TYPE_POPUP.ERROR)
                        self.popError.btnOK.addTarget(self, action: #selector(self.hidePopupError(_:)), for: .touchUpInside)
                    }else{
                        self.popError.showPopUp(parentView: self.view, mess: "The Internet connection appears to be offline.", title: "The request timed out", type: TYPE_POPUP.ERROR)
                        self.popError.btnOK.addTarget(self, action: #selector(self.hidePopupError(_:)), for: .touchUpInside)
                    }

                }
                break
            }
        }
    }
    

    private var popError = BaseViewPopUp()
    
    
    func showToast(message : String) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 16.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    //loading cung anh sang
    func showLoadingHub() {
        let loadingView = RSLoadingView()
            loadingView.show(on: view)
    }
    
    func hideLoadingHub() {
        RSLoadingView.hide(from: view)
    }
    
    //Show loading toan man hinh
    var vSpinner: UIView?
    func showSpinner(onView: UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }

    func loger(_ logType: LogType, _ message: String) {
        switch logType {
        case LogType.error:
            print("\n📕 Error: \(message)\n")
        case LogType.warning:
            print("\n📙 Warning: \(message)\n")
        case LogType.success:
            print("\n📗 Success: \(message)\n")
        case LogType.action:
            print("\n📘 Action: \(message)\n")
        case LogType.canceled:
            print("\n📓 Cancelled: \(message)\n")
        }
    }
    
    @objc func hidePopupError(_ sender: UIButton) {
        popup_error.removeFromSuperview()
    }
    lazy private var popup_error: BaseViewPopUp = {
        let popup = BaseViewPopUp()
        popup.btnOK.backgroundColor = Theme.shared.ograneColor
        popup.btnOK.addTarget(self, action: #selector(hidePopupError(_:)), for: .touchUpInside)
        return popup
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    func initialize(){}
    
}
