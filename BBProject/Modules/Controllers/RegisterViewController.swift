//
//  RegisterViewController.swift
//  BBProject
//
//  Created by IOS DEV02 on 06/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class RegisterViewController: vcBaseController {
    
    weak var activeField: UITextField?

    override func initialize() {
        view.backgroundColor = .white
        setUpBgHeader()
        setUpIconHeader()
        setUpTextTitle()
        setUpScollView()
        setUpBgBody()
        setUpViewName()
        setUpViewEmail()
        setUpViewPass()
        setUpViewConfigPass()
        setupBtnRegister()
        setUpLayoutLogin()
        setUpTextRegister()
        setupbtnRegister()
        
        // setup keyboard event
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow),
                                                       name: .UIKeyboardDidShow, object: nil)
                    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden),
                                                           name: .UIKeyboardWillHide, object: nil)
    }
    
    //show hide keyboard
        @objc func keyboardDidShow(notification: Notification) {
            let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            guard let activeField = activeField, let keyboardHeight = keyboardSize?.height else { return }

            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight + Dimension.shared.BBHeight(height: 40), right: 0.0)
            scollView.contentInset = contentInsets
            scollView.scrollIndicatorInsets = contentInsets
            let activeRect = activeField.convert(activeField.bounds, to: scollView)
            scollView.scrollRectToVisible(activeRect, animated: true)
        }

        @objc func keyboardWillBeHidden(notification: Notification) {
            let contentInsets = UIEdgeInsets.zero
            scollView.contentInset = contentInsets
            scollView.scrollIndicatorInsets = contentInsets
        }
        @objc func textFieldDidEndEditing(_ textField: UITextField) {
            activeField = nil
        }

        @objc func textFieldDidBeginEditing(_ textField: UITextField) {
            activeField = textField
        }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: bg header
    var bgHeader : UIView = {
        let bg = UIView()
        bg.backgroundColor = .black
        return bg
    }()
    
    func setUpBgHeader() {
        view.addSubview(bgHeader)
        bgHeader.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(Dimension.shared.height_screen / 4)
        }
    }
    
    //MARK: icon bgheader
    lazy var iconHeader : UIButton = {
        let icon = UIButton()
        icon.setImage(UIImage(named: "left"), for: .normal)
        icon.contentMode = .scaleAspectFill
        icon.setImageColor(color: UIColor.white)
        icon.addTarget(self, action: #selector(onBackHeader), for: .touchUpInside)
        return icon
    }()
    func setUpIconHeader() {
        bgHeader.addSubview(iconHeader)
        iconHeader.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
    }
    
    @objc func onBackHeader() {
        self.backVC()
    }
    
    
    
    //MARK: setup TextViewRegister
     var tvTitle: UILabel = {
       let textRegister = UILabel()
        textRegister.textAlignment = .center
        textRegister.textColor = .white
        textRegister.text = "Đăng Ký"
        textRegister.font = UIFont(name: Resource.FontName.shared.general, size: 24)
        
        return textRegister
    }()
    
    func setUpTextTitle() {
        bgHeader.addSubview(tvTitle)
        tvTitle.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    //MARK: scollview
    var scollView : UIScrollView = {
        let bg = UIScrollView()
        bg.backgroundColor = #colorLiteral(red: 0.9685223699, green: 0.9686879516, blue: 0.9685119987, alpha: 1)
        bg.layer.maskedCorners = [.layerMinXMinYCorner]
        bg.clipsToBounds = true
        bg.layer.cornerRadius = 40
        return bg
    }()
    
    func setUpScollView() {
        view.addSubview(scollView)
        scollView.snp.makeConstraints { (make) in
            make.top.equalTo(bgHeader.snp.bottom).offset(-40)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: bg body
    var bgBody : UIView = {
        let bg = UIView()
        bg.backgroundColor = #colorLiteral(red: 0.9685223699, green: 0.9686879516, blue: 0.9685119987, alpha: 1)
//        bg.layer.maskedCorners = [.layerMinXMinYCorner]
//        bg.clipsToBounds = true
//        bg.layer.cornerRadius = 40
        return bg
    }()
    
    func setUpBgBody() {
        scollView.addSubview(bgBody)
        bgBody.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: setup viewName
    var viewName: CustomCellLogin = {
       let viewName = CustomCellLogin()
        viewName.edtLogin.placeholder = "Nhập họ vả tên"
        viewName.tvLogin.text = "Họ Và Tên: "
        viewName.edtLogin.keyboardType = .emailAddress
        return viewName
    }()
    
    func setUpViewName()  {
        bgBody.addSubview(viewName)
        viewName.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    //MARK: setup email
    lazy var viewEmail: CustomCellLogin = {
       let viewEmail = CustomCellLogin()
        viewEmail.edtLogin.placeholder = "Nhập địa chỉ email"
        viewEmail.tvLogin.text = "Email: "
        viewEmail.edtLogin.keyboardType = .emailAddress
        viewEmail.edtLogin.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        viewEmail.edtLogin.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        return viewEmail
    }()
    
    func setUpViewEmail()  {
        bgBody.addSubview(viewEmail)
        viewEmail.snp.makeConstraints { (make) in
            make.top.equalTo(viewName.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    //MARK: setup pass
    var viewPass: CustomCellLogin = {
       let viewPass = CustomCellLogin()
        viewPass.edtLogin.placeholder = "Nhập mật khẩu"
        viewPass.tvLogin.text = "Mật Khẩu: "
        viewPass.edtLogin.isSecureTextEntry = true
        viewPass.edtLogin.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        viewPass.edtLogin.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        return viewPass
    }()
    
    func setUpViewPass()  {
        bgBody.addSubview(viewPass)
        viewPass.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(viewEmail.snp.bottom).offset(20)
        }
    }
    
    //MARK: setup config pass
    lazy var viewConfigPass: CustomCellLogin = {
       let viewPass = CustomCellLogin()
        viewPass.edtLogin.placeholder = "Nhập lại mật khẩu"
        viewPass.tvLogin.text = "Nhập Lại Mật Khẩu: "
        viewPass.edtLogin.isSecureTextEntry = true
        viewPass.edtLogin.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        viewPass.edtLogin.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        return viewPass
    }()
    
    func setUpViewConfigPass()  {
        bgBody.addSubview(viewConfigPass)
        viewConfigPass.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(viewPass.snp.bottom).offset(20)
        }
    }
    
    //MARK: Setup button
    
    var btnRegister : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 12
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("Đăng Ký", for: .normal)
        return btn
    }()
    
    func setupBtnRegister() {
        bgBody.addSubview(btnRegister)
        btnRegister.snp.makeConstraints { (make) in
            make.top.equalTo(viewConfigPass.snp.bottom).offset(40)
            make.left.equalTo(viewPass.snp.left)
            make.right.equalTo(viewPass.snp.right)
            make.height.equalTo(45)
        }
    }
    
    //MARK: setup layout btn dang nhap
    var layoutLogin: UIView = {
        let layout = UIView()
        return layout
    }()
    
    func setUpLayoutLogin() {
        bgBody.addSubview(layoutLogin)
        layoutLogin.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-40)
            make.top.equalTo(btnRegister.snp.bottom).offset(20)
            //make.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    
    //MARK: setup TextViewRegister
     var textRegister: UILabel = {
       let textRegister = UILabel()
        textRegister.textAlignment = .center
        textRegister.textColor = .black
        textRegister.text = "Đã có tài khoản? "
        textRegister.font = UIFont(name: Resource.FontName.shared.general, size: 14)
        
        return textRegister
    }()
    
    func setUpTextRegister() {
        layoutLogin.addSubview(textRegister)
        textRegister.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    //MARK: dang ky
    lazy var btnLogin : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.9685223699, green: 0.9686879516, blue: 0.9685119987, alpha: 1)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("Đăng nhập", for: .normal)
        btn.titleLabel?.font =  UIFont(name: Resource.FontName.shared.bold, size: 14)
        btn.addTarget(self, action: #selector(changeToRegister), for: .touchUpInside)
        return btn
    }()
    
    func setupbtnRegister() {
        layoutLogin.addSubview(btnLogin)
        btnLogin.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(textRegister.snp.right)
            make.height.equalTo(40)
            make.right.equalToSuperview()
        }
    }
    
    //MARK: action register
    
    @objc func changeToRegister() {
        self.backVC()
    }
    
}
