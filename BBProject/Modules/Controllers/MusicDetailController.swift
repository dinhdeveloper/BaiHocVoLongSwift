//
//  MusicDetailController.swift
//  BBProject
//
//  Created by IOS DEV02 on 08/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

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
        slider.addTarget(self, action: #selector(changeValueSlider(_:)), for: .valueChanged)
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
    //MARK: on change slider
    @objc func changeValueSlider(_ sender: AnyObject) {
        if player != nil {
//            player?.pause()
//            let currentime = sliderProcess.value
//            player?.replaceCurrentItem(with: <#T##AVPlayerItem?#>)
//            player?.play()
            
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
    //MARK: init player
    func playInit() {
        if data.links != "" {
            let url = URL(string: data.links)
            player = AVPlayer(url: url!)
            guard let duration = player?.currentItem?.asset.duration else {
                return
            }
    
            let durationBySecond = CMTimeGetSeconds(duration)
            let minute_ = Int(durationBySecond) / 60
            let second_ = Int(durationBySecond) % 60
            
            let minute = minute_ > 9 ? "\(minute_)" : "0\(minute_)"
            let second = second_ > 9 ? "\(second_)" : "0\(second_)"
            
            self.timerEnd.text = "\(minute):\(second)"
            self.sliderProcess.maximumValue = Float(durationBySecond)
            
            player?.play()
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
            
            let image = UIImage(named: "buianhtuan")!
            let artwork = MPMediaItemArtwork.init(boundsSize: image.size, requestHandler: { (size) -> UIImage in
                    return image
            })
            
            /// Show mini player lock screen app
            MPNowPlayingInfoCenter.default().nowPlayingInfo = [
                MPMediaItemPropertyTitle : data.name != "" ? data.name : "Dinh khung",
                MPMediaItemPropertyArtist: data.singer != "" ? data.singer : "Diem Khung",
                MPMediaItemPropertyPlaybackDuration: player?.currentItem!.asset.duration ?? "0",
                MPMediaItemPropertyArtwork: artwork
            ]
            UIApplication.shared.beginReceivingRemoteControlEvents()
            becomeFirstResponder()
            
        }
        else {
            popup_error.showPopUp(parentView: view, mess: "Không tìm thấy link bài hát", title: Resource.Title.shared.title_error, type: TYPE_POPUP.ERROR)
            popup_error.btnOK.addTarget(self, action: #selector(onBack), for: .touchUpInside)
        }
    }
    
    
    
    //This returns song length
    func calculateTimeFromNSTimeInterval(_ duration:TimeInterval) ->(minute:String, second:String){
       // let hour_   = abs(Int(duration)/3600)
        let minute_ = abs(Int((duration/60).truncatingRemainder(dividingBy: 60)))
        let second_ = abs(Int(duration.truncatingRemainder(dividingBy: 60)))
        
       // var hour = hour_ > 9 ? "\(hour_)" : "0\(hour_)"
        let minute = minute_ > 9 ? "\(minute_)" : "0\(minute_)"
        let second = second_ > 9 ? "\(second_)" : "0\(second_)"
        return (minute,second)
    }
    

    
//    func showTotalSongLength(){
//        calculateSongLength()
//        totalLengthOfAudioLabel.text = totalLengthOfAudio
//    }
//
//
//    func calculateSongLength(){
//        let time = calculateTimeFromNSTimeInterval(audioLength)
//        totalLengthOfAudio = "\(time.minute):\(time.second)"
//    }
    
    override func remoteControlReceived(with event: UIEvent?) {
        if let event = event {
            if event.type == .remoteControl {
                switch event.subtype {
                case .remoteControlPlay:
                    player?.play()
                case .remoteControlPause:
                    player?.pause()
                case .remoteControlNextTrack:
                    print("Bai tiep theo")
                case .remoteControlPreviousTrack:
                    print("Bai truoc do")
                default:
                    print("chua thiet lap")
                }
            }
        }
    }
    
    @objc func onBack() {
        navigationController?.popViewController(animated: true)
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
    
    @objc func updateSlider() {
        if player != nil {
            let currentTimeBySecond = CMTimeGetSeconds((player?.currentItem?.currentTime())!)
            
            sliderProcess.value = Float(currentTimeBySecond)
            let minute_ = Int(currentTimeBySecond) / 60
            let second_ = Int(currentTimeBySecond) % 60
            
            let minute = minute_ > 9 ? "\(minute_)" : "0\(minute_)"
            let second = second_ > 9 ? "\(second_)" : "0\(second_)"
            
            self.timerStart.text = "\(minute):\(second)"
            
//            if self.sliderProcess.maximumValue == Float(currentTimeBySecond) {
//                print("het bai nha")
//            }
            
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player?.pause()
        player = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
    func downloadAndSaveAudioFile(_ audioFile: String, completion: @escaping (String) -> Void) {
            
            //Create directory if not present
            let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            let documentDirectory = paths.first! as NSString
            let soundDirPathString = documentDirectory.appendingPathComponent("Sounds")
            
            do {
                try FileManager.default.createDirectory(atPath: soundDirPathString, withIntermediateDirectories: true, attributes:nil)
                print("directory created at \(soundDirPathString)")
            } catch let error as NSError {
                print("error while creating dir : \(error.localizedDescription)");
            }
            
            if let audioUrl = URL(string: audioFile) {     //http://freetone.org/ring/stan/iPhone_5-Alarm.mp3
                // create your document folder url
                let documentsUrl =  FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first! as URL
                let documentsFolderUrl = documentsUrl.appendingPathComponent("Sounds")
                // your destination file url
                let destinationUrl = documentsFolderUrl.appendingPathComponent(audioUrl.lastPathComponent)
                
                print(destinationUrl)
                // check if it exists before downloading it
                if FileManager().fileExists(atPath: destinationUrl.path) {
                    print("The file already exists at path")
                } else {
                    //  if the file doesn't exist
                    //  just download the data from your url
                    DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async(execute: {
                        if let myAudioDataFromUrl = try? Data(contentsOf: audioUrl){
                            // after downloading your data you need to save it to your destination url
                            if (try? myAudioDataFromUrl.write(to: destinationUrl, options: [.atomic])) != nil {
                                print("file saved")
                                completion(destinationUrl.absoluteString)
                            } else {
                                print("error saving file")
                                completion("")
                            }
                        }
                    })
                }
            }
        }
    
}
