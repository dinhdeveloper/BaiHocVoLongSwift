//
//  MusicViewController.swift
//  BBProject
//
//  Created by IOS DEV02 on 08/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit
import Alamofire

class MusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var spage = 1
    private var loadmore = true
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.navigationBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //navigationController?.navigationBar.isHidden = false
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMusic.count > 0 ? arrMusic.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //adapter
        if arrMusic.count > 0 {
            let cell: CellCustomerManager = tableView.dequeueReusableCell(withIdentifier: "CellCustomerManager", for: indexPath) as! CellCustomerManager
            cell.contentView.isUserInteractionEnabled = false //--------------> ios 14.2
            cell.displayCell(customer: arrMusic[indexPath.row])
            return cell
        }
       return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = MusicDetailController()
        
        vc.modalPresentationStyle = .fullScreen
        vc.data = arrMusic[indexPath.row]
//        self.PushVC(vc: vc)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    var arrMusic: [MusicModel] = []
    //MARK: vong doi
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTable()
        getListSong()
        
        
        //setUpLayoutMini()
    }
    
    
    lazy private var tableview : BaseTableView = {
        let tbv = BaseTableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tbv.register(CellCustomerManager.self, forCellReuseIdentifier: "CellCustomerManager")
        tbv.estimatedRowHeight = 60
        tbv.rowHeight = UITableViewAutomaticDimension
        tbv.backgroundColor = .white
        tbv.delegate = self
        tbv.dataSource = self
        tbv.separatorStyle = .singleLine
        return tbv
    }()
    
    func setUpTable() {
        view.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            
        }
    }
    
    func getListSong() {
        Alamofire.request("https://appmusic-test.herokuapp.com/song/list").responseJSON{ [self](res) in
            let object: AnyObject = res.value as AnyObject
            let dic: [AnyObject] = object as? [AnyObject] ?? []
            dic.forEach { (i) in
                let item = MusicModel(object: i)
                self.arrMusic.append(item)
            }
            tableview.reloadData()
        }
    }
    
    var miniPlayer: MiniPlayerBaseView = {
       let layout = MiniPlayerBaseView()
        layout.backgroundColor = UIColor.white
        layout.layer.shadowColor = UIColor.gray.cgColor
        layout.layer.shadowOffset = CGSize(width: -1, height: -1) // do bong
        layout.layer.shadowRadius = 3
        layout.layer.shadowOpacity = 0.2
        return layout
    }()
    
    func setUpLayoutMini() {
        view.addSubview(miniPlayer)
        miniPlayer.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(60)
            make.bottom.equalToSuperview()
        }
    }

    
}
