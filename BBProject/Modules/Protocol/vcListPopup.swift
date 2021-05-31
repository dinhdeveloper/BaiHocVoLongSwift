//
//  vcListPopup.swift
//  BBProject
//
//  Created by IOS DEV02 on 27/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit
import Alamofire

class vcListPopup: vcBaseControl {
    private var spage = 1
    private var loadmore = true
    
    var arrCategory: [CategoryModel] = []
    
    override func initialize() {
        view.backgroundColor = .white
        setUpSearch()
        setUpTable()
        getListCategory()
    }
    
    //MARK: api
    func getListCategory() {
        let param = [API.shared.detect: "list_category"]
        
        requestApi(param: param) { (response) in
            if response?.success == Resource.Response.shared.success_true {
                response?.data.forEach({ (i) in
                    let item = CategoryModel(object: i)
                    self.arrCategory.append(item)
                })
            }else {
                print("àdsf")
            }
            
        }
        tableview.reloadData()
    }
    
    //MARK: ui element
    lazy private var viewSearch: ViewSearch = {
        let viewSearch = ViewSearch()
        viewSearch.txtSearch.placeholder = "Search..."
        return viewSearch
    }()
    
    
    lazy private var tableview : BaseTableView = {
        let tbv = BaseTableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tbv.register(CellItemList.self, forCellReuseIdentifier: "CellItemList")
        tbv.estimatedRowHeight = 60
        tbv.rowHeight = UITableViewAutomaticDimension
        tbv.backgroundColor = .white
        tbv.delegate = self
        tbv.dataSource = self
        tbv.separatorStyle = .singleLine
        return tbv
    }()
    
    
    //MARK: setup view
    func setUpSearch() {
        view.addSubview(viewSearch)
        viewSearch.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.BBHeight(height: 20))
            make.left.equalToSuperview().offset(Dimension.shared.BBWidth(width: 20))
            make.right.equalToSuperview().offset(-Dimension.shared.BBWidth(width: 20))
            make.height.equalTo(Dimension.shared.BBWidth(width: 40))
        }
    }
    
    func setUpTable() {
        view.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.top.equalTo(viewSearch.snp.bottom).offset(Dimension.shared.BBHeight(height: 20))
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            
        }
    }
}

extension vcListPopup: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCategory.count > 0 ? arrCategory.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //adapter
        if arrCategory.count > 0 {
            let cell: CellItemList = tableView.dequeueReusableCell(withIdentifier: "CellItemList", for: indexPath) as! CellItemList
            cell.contentView.isUserInteractionEnabled = false //--------------> ios 14.2
            cell.displayCell(customer: arrCategory[indexPath.row])
            return cell
        }
       return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = DetailController()
//
//        vc.modalPresentationStyle = .fullScreen
//        vc.data = arrMusic[indexPath.row]
////        self.PushVC(vc: vc)
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
