//
//  LoginViewController.swift
//  BBProject
//
//  Created by IOS DEV02 on 06/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class LoginViewController: vcBaseController {
    
    //MARK: vong doi
    override func initialize() {
        
        view.backgroundColor = .white
        
        setUpBgHeader()
        
        setUpBgBody()
        
        setUpIconHeader()
        
        setUpTextLogin()
        
        setUpViewEmail()
        
        setUpViewPass()
        
        setupBtnLogin()
        
        setUpLayoutRegister()
        
        setUpTextRegister()
        
        setupbtnRegister()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //self.navigationController?.isNavigationBarHidden = false
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
            make.height.equalTo(Dimension.shared.height_screen / 3)
        }
    }
    //MARK: icon bgheader
    let iconHeader : UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "face_scan")
        icon.setImageColor(color: .white)
        icon.contentMode = .center
        return icon
    }()
    func setUpIconHeader() {
        bgHeader.addSubview(iconHeader)
        iconHeader.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    
    //MARK: bg body
    var bgBody : UIView = {
        let bg = UIView()
        bg.backgroundColor = #colorLiteral(red: 0.9685223699, green: 0.9686879516, blue: 0.9685119987, alpha: 1)
        bg.layer.maskedCorners = [.layerMinXMinYCorner]
        bg.clipsToBounds = true
        bg.layer.cornerRadius = 40
        return bg
    }()
    
    func setUpBgBody() {
        view.addSubview(bgBody)
        bgBody.snp.makeConstraints { (make) in
            make.top.equalTo(bgHeader.snp.bottom).offset(-40)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    //MARK: setup TextViewLogin
    let textLogin: UILabel = {
       let textLogin = UILabel()
        textLogin.textAlignment = .center
        textLogin.textColor = .black
        textLogin.text = "Đăng Nhập"
        textLogin.font = UIFont(name: Resource.FontName.shared.general, size: 24)
        return textLogin
    }()
    
    func setUpTextLogin() {
        bgBody.addSubview(textLogin)
        textLogin.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    //MARK: setup email
    var viewEmail: CustomCellLogin = {
       let viewEmail = CustomCellLogin()
        viewEmail.edtLogin.placeholder = "Nhập username"
        viewEmail.tvLogin.text = "Username: "
        viewEmail.edtLogin.keyboardType = .emailAddress
        return viewEmail
    }()
    
    func setUpViewEmail()  {
        bgBody.addSubview(viewEmail)
        viewEmail.snp.makeConstraints { (make) in
            make.top.equalTo(textLogin.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    //MARK: setup pass
    var viewPass: CustomCellLogin = {
       let viewPass = CustomCellLogin()
        viewPass.edtLogin.placeholder = "Nhập mật khẩu"
        viewPass.tvLogin.text = "Mật khẩu: "
        viewPass.edtLogin.isSecureTextEntry = true
        return viewPass
    }()
    
    func setUpViewPass()  {
        bgBody.addSubview(viewPass)
        viewPass.snp.makeConstraints { (make) in
            make.top.equalTo(viewEmail.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    //MARK: Setup button
    
    var btnLogin : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 12
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("Đăng Nhập", for: .normal)
        btn.addTarget(self, action: #selector(actionLogin(_:)), for: .touchUpInside)
        return btn
    }()
    
    func setupBtnLogin() {
        bgBody.addSubview(btnLogin)
        btnLogin.snp.makeConstraints { (make) in
            make.top.equalTo(viewPass.snp.bottom).offset(40)
            make.left.equalTo(viewPass.snp.left)
            make.right.equalTo(viewPass.snp.right)
            make.height.equalTo(45)
        }
    }
    //MARK: setup layout btn dang ky
    var layoutRegister: UIView = {
        let layout = UIView()
        return layout
    }()
    
    func setUpLayoutRegister() {
        bgBody.addSubview(layoutRegister)
        layoutRegister.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-40)
            //make.left.equalToSuperview()
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
        textRegister.text = "Nếu chưa có tài khoản? "
        textRegister.font = UIFont(name: Resource.FontName.shared.general, size: 14)
        
        return textRegister
    }()
    
    func setUpTextRegister() {
        layoutRegister.addSubview(textRegister)
        textRegister.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    //MARK: dang ky
    lazy var btnRegister : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.9685223699, green: 0.9686879516, blue: 0.9685119987, alpha: 1)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("Đăng ký", for: .normal)
        btn.titleLabel?.font =  UIFont(name: Resource.FontName.shared.bold, size: 14)
        btn.addTarget(self, action: #selector(changeToRegister), for: .touchUpInside)
        return btn
    }()
    
    func setupbtnRegister() {
        layoutRegister.addSubview(btnRegister)
        btnRegister.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(textRegister.snp.right)
            make.height.equalTo(40)
            make.right.equalToSuperview()
        }
    }
    
    //MARK: action register
    
    @objc func changeToRegister() {
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    //MARK: popup
    lazy private var popup_error: BaseViewPopUp = {
        let popup = BaseViewPopUp()
        popup.btnOK.addTarget(self, action: #selector(actionShowPopupError(_:)), for: .touchUpInside)
        return popup
    }()
    
    @objc private func actionShowPopupError(_ sender: UIButton){
        popup_error.removeFromSuperview()
    }
    
    //MARK: call api
    
    @objc private func actionLogin(_ sender: UIButton){
        if viewEmail.edtLogin.text! == "" {
            popup_error.showPopUp(parentView: view, mess: "Vui lòng nhập Username", title: Resource.Title.shared.title_success, type: TYPE_POPUP.SUCCESS)
            return
        }
        if viewPass.edtLogin.text! == "" {
            popup_error.showPopUp(parentView: view, mess: "Vui lòng nhập Password", title: Resource.Title.shared.title_success, type: TYPE_POPUP.SUCCESS)
            return
        }
        login()
    }
    
    private func login(){
        
        let param = [API.detect: API.shared.api_login,
                     "id_code": viewEmail.edtLogin.text!,
                     "password": viewPass.edtLogin.text!,
                     "store_code": "ABCXYZ"]
        print("param: \(param)")
        requestApi(param: param) { (response) in
            switch response?.success{
            case Resource.Response.shared.success_true:
                response?.data.forEach({ (i) in
                    let emp = Employee(object: i)
                    self.successRequest(emp: emp)
                })

            default: break
                
            }
        }
    }
    
    private func successRequest(emp: Employee){
        
//        Const.EmployeeDefault.employee = emp
//        Const.EmployeeDefault.is_login_Df.set(true, forKey: Const.EmployeeDefault.is_login_Dfkey)
//        Const.EmployeeDefault.id_Df.set(emp.id, forKey: Const.EmployeeDefault.id_Df_key)
//        Const.EmployeeDefault.fullname_Df.set(emp.full_name, forKey: Const.EmployeeDefault.fullname_Df_key)
//        Const.EmployeeDefault.level.set(emp.level, forKey: Const.EmployeeDefault.level_Df_key)
//        Const.EmployeeDefault.level_name.set(emp.level_name, forKey: Const.EmployeeDefault.level_name_Df_key)
//        Const.EmployeeDefault.id_code_Df.set(emp.id_code, forKey: Const.EmployeeDefault.id_code_Df_key)
//        Const.EmployeeDefault.id_business_Df.set(emp.store_code, forKey: Const.EmployeeDefault.id_business_Df_key)
//        Const.EmployeeDefault.store_name_Df.setValue(emp.store_name, forKey: Const.EmployeeDefault.store_name_Df_Key)
//        Const.EmployeeDefault.store_address_Df.setValue(emp.store_address, forKey: Const.EmployeeDefault.store_address_Df_Key)
//        Const.EmployeeDefault.store_phone_Df.setValue(emp.store_phone, forKey: Const.EmployeeDefault.store_phone_Df_Key)
//        Const.EmployeeDefault.store_begin_Df.setValue(emp.store_begin, forKey: Const.EmployeeDefault.store_begin_Df_Key)
//        Const.EmployeeDefault.store_end_Df.setValue(emp.store_end, forKey: Const.EmployeeDefault.store_end_Df_Key)
//
        let vc = DashBoardController()
        vc.modalPresentationStyle = .fullScreen
        PushVC(vc: vc)
        
    }
}
