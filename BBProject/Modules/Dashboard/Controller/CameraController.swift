//
//  CameraController.swift
//  BBProject
//
//  Created by IOS DEV02 on 27/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class CameraController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        //setUpImageView()
        setUpShowCamera()
        setUpShowPopup()
        setUpChooseImage()
        
    }
    
    //MARK: setup pop error, success, waiting
    lazy private var popup_error: BaseViewPopUp = {
        let popup = BaseViewPopUp()
        popup.btnOK.backgroundColor = Theme.shared.ograneColor
        popup.btnOK.addTarget(self, action: #selector(actionHidePopupError(_:)), for: .touchUpInside)
        return popup
    }()
    lazy private var popup_success: BaseViewPopUp = {
        let popup = BaseViewPopUp()
        popup.btnOK.backgroundColor = Theme.shared.ograneColor
        popup.btnOK.addTarget(self, action: #selector(actionHidePopupSuccess(_:)), for: .touchUpInside)
        return popup
    }()
    lazy private var popup_confirm: PopUpTwoAction = {
        let popup = PopUpTwoAction()
        popup.btnleft.addTarget(self, action: #selector(actionDeleteCustomerOK(_:)), for: .touchUpInside)
        popup.btnRight.addTarget(self, action: #selector(actionDeleteCustomerNO(_:)), for: .touchUpInside)
        popup.img_success.image = Resource.Images.shared.warning_yellow
        popup.btnRight.backgroundColor = Theme.shared.ograneColor
        return popup
    }()
    
    
    lazy var btnShowCamera : UIButton = {
        let btnShowCamera = UIButton()
        btnShowCamera.backgroundColor = Theme.shared.item_click_category
        btnShowCamera.layer.cornerRadius = 10
        btnShowCamera.setTitle("Show Camera", for: .normal)
        btnShowCamera.addTarget(self, action: #selector(showCamera), for: .touchUpInside)
        return btnShowCamera
    }()
    
    lazy var btnShowPopup : UIButton = {
        let btnShowPopup = UIButton()
        btnShowPopup.backgroundColor = Theme.shared.item_click_category
        btnShowPopup.layer.cornerRadius = 10
        btnShowPopup.setTitle("Show Popup", for: .normal)
        btnShowPopup.addTarget(self, action: #selector(showPopup), for: .touchUpInside)
        return btnShowPopup
    }()
    
    
    
    
    lazy var btnImage : UIButton = {
        let btnShowCamera = UIButton()
        btnShowCamera.backgroundColor = Theme.shared.item_click_category
        btnShowCamera.layer.cornerRadius = 10
        btnShowCamera.setTitle("Choose Image", for: .normal)
        btnShowCamera.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
        return btnShowCamera
    }()
    
    var imageView : UIImageView = {
       let img = UIImageView()

        return img
    }()
    
    func setUpShowCamera() {
        view.addSubview(btnShowCamera)
        btnShowCamera.snp.makeConstraints { (make) in
            //make.top.equalTo(imageView.snp.bottom)
            make.bottom.equalToSuperview().offset(-90)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo((Dimension.shared.width_screen/2)-40)
            make.height.equalTo(44)
        }
    }
    
    func setUpShowPopup() {
        view.addSubview(btnShowPopup)
        btnShowPopup.snp.makeConstraints { (make) in
            //make.top.equalTo(imageView.snp.bottom)
            make.bottom.equalTo(btnShowCamera.snp.top).offset(-30)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo((Dimension.shared.width_screen/2)-40)
            make.height.equalTo(44)
        }
    }
    
    
    func setUpChooseImage() {
        view.addSubview(btnImage)
        btnImage.snp.makeConstraints { (make) in
            //make.top.equalTo(imageView.snp.bottom)
            make.bottom.equalToSuperview().offset(-90)
            make.left.equalTo(btnShowCamera.snp.right).offset(10)
            make.right.equalToSuperview().offset(-30)
            make.width.equalTo((Dimension.shared.width_screen/2)-30)
            make.height.equalTo(44)
        }
    }
    
    func setUpImageView() {
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(100)
        }
    }
//
    //action
    @objc func showCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
    }
    
    @objc func showPopup() {
        self.popup_success.showPopUp(parentView: self.view, mess: "Tạo mới nhân viên thành công!", title: Resource.Title.shared.title_success, type: TYPE_POPUP.SUCCESS)
    }
    
    @objc func chooseImage() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = true
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
           // imageViewPic.contentMode = .scaleToFill
            imageView.image = pickedImage
            print(pickedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    //MARK : ACTION
    
    @objc private func actionHidePopupError(_ sender: UIButton){
        popup_error.removeFromSuperview()
    }
    @objc private func actionHidePopupSuccess(_ sender: UIButton){
        popup_success.removeFromSuperview()
    }
    @objc private func actionDeleteCustomerOK(_ sender: UIButton){
        popup_confirm.removeFromSuperview()
        //deleteCustomer()
        
    }
    @objc private func actionDeleteCustomerNO(_ sender: UIButton){
        popup_confirm.removeFromSuperview()
    }
    
}

