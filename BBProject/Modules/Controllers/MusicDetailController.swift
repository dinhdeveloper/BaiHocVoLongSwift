//
//  MusicDetailController.swift
//  BBProject
//
//  Created by IOS DEV02 on 08/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit
import AVFoundation

class MusicDetailController: vcBaseController {
    
    public var data = MusicModel()
    
   var isPlaying = false
    
    public var player : AVPlayer?
    
    var URL_DEMO = "https://appmusic-test.herokuapp.com/music/anhthanhnien.mp3"
    
    override func initialize() {
        view.backgroundColor = .white
        self.title = data.name
        
        setUpViewSlider()
        setUpLayoutTimer()
        setUpTimerStart()
        setUpTimerEnd()
        setUpSlider()
        setUpViewControl()
        setUpImvPrevious()
        setUpImvPlay()
        setUpImvNext()
        
        playInit()
        
    }
    
    //MARK: layout Slider
    var viewSlider: UIView = {
        let viewSlider = UIView()
        return viewSlider
    }()
    
    func setUpViewSlider() {
        view.addSubview(viewSlider)
        viewSlider.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-140)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(40)
        }
    }
    //MARK: layout timer
    var layoutTimer: UIView = {
        let layout = UIView()
        return layout
    }()
    func setUpLayoutTimer() {
        viewSlider.addSubview(layoutTimer)
        layoutTimer.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(15)
        }
    }
    //MARK: timer start
    var timerStart: UILabel = {
        let timeStart = UILabel()
        timeStart.text = "00:00"
        return timeStart
    }()
    func setUpTimerStart() {
        layoutTimer.addSubview(timerStart)
        timerStart.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: timer end
    var timerEnd: UILabel = {
        let timeEnd = UILabel()
        timeEnd.text = "00:00"
        return timeEnd
    }()
    func setUpTimerEnd() {
        layoutTimer.addSubview(timerEnd)
        timerEnd.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
    }
    
    
    //MARK: slider
    lazy var sliderProcess: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    func setUpSlider() {
        viewSlider.addSubview(sliderProcess)
        sliderProcess.snp.makeConstraints { (make) in
            make.top.equalTo(layoutTimer.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: view music control
    lazy var viewMusicControl : UIView = {
        let bg = UIView()
        return bg
    }()
    
    func setUpViewControl() {
        view.addSubview(viewMusicControl)
        viewMusicControl.snp.makeConstraints { (make) in
            make.top.equalTo(viewSlider.snp.bottom).offset(10)
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
        img.addTarget(self, action: #selector(actionButtonPlay(_:)), for: .touchUpInside)
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
    
    //MARK: action
    @objc func actionButtonPlay(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if isPlaying {
            imvPlay.setImage(UIImage(named: "play"), for: .normal)
            imvPlay.contentMode = .scaleAspectFill
            if player != nil {
                if sender.isSelected == true {
                    player?.play()
                } else {
                    player?.pause()
                }
            }
        }else {
            imvPlay.setImage(UIImage(named: "pause"), for: .normal)
            imvPlay.contentMode = .scaleAspectFill
            if player != nil {
                if sender.isSelected == true {
                    player?.play()
                } else {
                    player?.pause()
                }
            }
        }
        isPlaying = !isPlaying
        
    }
    
    func playInit() {
        let url = URL(string: data.links)
        player = AVPlayer(url: url!)
        guard let duration = player?.currentItem?.asset.duration else {
            return
        }
        let durationBySecond = CMTimeGetSeconds(duration)
        let min = Int(durationBySecond) / 60
        let second = Int(durationBySecond) % 60
        self.timerEnd.text = "\(min):\(second)"
        self.sliderProcess.maximumValue = Float(durationBySecond)
        
        player?.play()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    
    @objc func updateSlider() {
        if player != nil {
            let currentTimeBySecond = CMTimeGetSeconds((player?.currentItem?.currentTime())!)
                sliderProcess.value = Float(currentTimeBySecond)
            let min = Int(currentTimeBySecond) / 60
            
            let second = Int(currentTimeBySecond) % 60
            self.timerStart.text = "\(min):\(second)"
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player?.pause()
    }
}
