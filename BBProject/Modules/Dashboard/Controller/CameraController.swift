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
        setUpChooseImage()
        
    }
    
    
    lazy var btnShowCamera : UIButton = {
        let btnShowCamera = UIButton()
        btnShowCamera.backgroundColor = Theme.shared.item_click_category
        btnShowCamera.layer.cornerRadius = 10
        btnShowCamera.setTitle("Show Camera", for: .normal)
        btnShowCamera.addTarget(self, action: #selector(showCamera), for: .touchUpInside)
        return btnShowCamera
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
}

