//
//  miniController.swift
//  BBProject
//
//  Created by IOS DEV02 on 10/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class miniController: vcBaseController {

    override func initialize(){
        setUpImgMusic()
        setUpLayoutMusic()
        setUpImgNext()
        setUpImgPlay()
        setUpSongName()
        setUpSinger()
        setUpImgBack()
    }
    //MARK: img Music
    var imgLogo : UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "buianhtuan")
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 30
        img.clipsToBounds = true
        return img
    }()
    
    func setUpImgMusic() {
        view.addSubview(imgLogo)
        imgLogo.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
    }
    //MARK: layout tv
    var layoutMusic : UIView = {
        let layout = UIView()
        return layout
    }()
    func setUpLayoutMusic() {
        view.addSubview(layoutMusic)
        layoutMusic.snp.makeConstraints { (make) in
            make.top.equalTo(imgLogo.snp.top)
            make.centerY.equalToSuperview()
            make.left.equalTo(imgLogo.snp.right).offset(10)
            make.width.equalTo(150)
        }
    }
    //MARK: label Music
    var lbMusicName : UILabel = {
       let lb = UILabel()
        lb.text = "Thuận theo ý trời Thuận theo ý trời Thuận theo ý trời"
        lb.textColor = .black
        lb.font = UIFont(name: Resource.FontName.shared.general, size: 16)
        lb.lineBreakMode = .byTruncatingTail
        lb.numberOfLines = 1
        return lb
    }()
    
    func setUpSongName() {
        layoutMusic.addSubview(lbMusicName)
        lbMusicName.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    //MARK: label Music
    var lbSinger : UILabel = {
       let lb = UILabel()
        lb.text = "Bùi Anh Tuấn"
        lb.textColor = .black
        lb.font = UIFont(name: Resource.FontName.shared.general, size: 12)
        lb.numberOfLines = 1
        return lb
    }()
    
    func setUpSinger() {
        layoutMusic.addSubview(lbSinger)
        lbSinger.snp.makeConstraints { (make) in
            make.top.equalTo(lbMusicName.snp.bottom)
            make.left.equalTo(lbMusicName.snp.left)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    //MARK: img next
    var imgNext : UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "next")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    func setUpImgNext() {
        view.addSubview(imgNext)
        imgNext.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
            make.height.equalTo(18)
            make.width.equalTo(18)
        }
    }
    
    //MARK: img play
    var imgPlay : UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "pause")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    func setUpImgPlay() {
        view.addSubview(imgPlay)
        imgPlay.snp.makeConstraints { (make) in
            make.right.equalTo(imgNext.snp.left).offset(-20)
            make.centerY.equalToSuperview()
            make.height.equalTo(18)
            make.width.equalTo(18)
        }
    }
    
    //MARK: img back
    var imgBack : UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "previous")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    func setUpImgBack() {
        view.addSubview(imgBack)
        imgBack.snp.makeConstraints { (make) in
            make.right.equalTo(imgPlay.snp.left).offset(-20)
            make.centerY.equalToSuperview()
            make.height.equalTo(18)
            make.width.equalTo(18)
        }
    }
}
