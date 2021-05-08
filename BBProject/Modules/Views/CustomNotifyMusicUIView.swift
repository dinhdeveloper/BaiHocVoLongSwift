//
//  CustomNotifyMusicUIView.swift
//  BBProject
//
//  Created by IOS DEV02 on 08/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class CustomNotifyMusicUIView: BaseView {
    
    override func initialize() {
        setUpViewControl()
        setUpImvPrevious()
        setUpImvPlay()
        setUpImvNext()
    }
   
    
    //MARK: view music control
    lazy var viewMusicControl : UIView = {
        let bg = UIView()
        return bg
    }()
    
    func setUpViewControl() {
        addSubview(viewMusicControl)
        viewMusicControl.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }
    
    //MARK: previous
    lazy var imvPrevious: UIButton = {
        let img = UIButton()
        img.setImage(UIImage(named: "previous"), for: .normal)
        img.contentMode = .scaleAspectFill
        //        img.setImageColor(color: UIColor.white)
        return img
    }()
    
    func setUpImvPrevious() {
        viewMusicControl.addSubview(imvPrevious)
        imvPrevious.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(6)
            make.left.equalToSuperview().offset(35)
            make.centerY.equalToSuperview()
            make.width.equalTo(24)
        }
    }
    
    //MARK: play
    lazy var imvPlay: UIButton = {
        let img = UIButton()
        img.setImage(UIImage(named: "pause"), for: .normal)
        img.contentMode = .scaleAspectFill
        //img.addTarget(self, action: #selector(actionButtonPlay(_:)), for: .touchUpInside)
        return img
    }()
    
    func setUpImvPlay() {
        viewMusicControl.addSubview(imvPlay)
        imvPlay.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
        }
    }
    
    //MARK: next
    var imvNext: UIButton = {
        let img = UIButton()
        img.setImage(UIImage(named: "next"), for: .normal)
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    func setUpImvNext() {
        viewMusicControl.addSubview(imvNext)
        imvNext.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(6)
            make.right.equalToSuperview().offset(-35)
            make.centerY.equalToSuperview()
            make.width.equalTo(24)
        }
    }
}
