//
//  DashBoardController.swift
//  BBProject
//
//  Created by IOS DEV02 on 23/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class DashBoardController: UIViewController {
    
    var arrCategory: [CategoryModel] = []
    var arrProduct: [ProductModel] = []
    var arrTemp: [ProductModel] = []
    private var time: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //navigationController?.toolbar.isHidden = true
        
        //navigationController?.navigationBar.isHidden = true
        //navigationController?.setToolbarHidden(false, animated: true)
        
        setUpViewSearch()
        
        setUpTitle()
        
        setUpColectView()
        
        getListCategory()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getCategoryId(_:)), name: NSNotification.Name("CATE"), object: nil)
        
        Logger.log(.error, "Invalid Credit Information")
        
    }
    
    @objc func getCategoryId(_ idCategory: Notification){
        guard let result: [String: AnyObject] = idCategory.object as? [String: AnyObject] else {
            return
        }
        let id = result["id"] as? Int ?? 0
        arrCategory = result["arr"] as? [CategoryModel] ?? []
        arrProduct = []
        getListProduct(idCategory: id)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       // navigationController?.navigationBar.isHidden = false
    }
    
    
    lazy var searchView: SearchView = {
        let searchView = SearchView()
        searchView.edtSearch.addTarget(self, action: #selector(searchPro(_:)), for: .editingChanged)
        searchView.edtSearch.returnKeyType = .search
        return searchView
    }()
    
    func setUpViewSearch() {
        view.addSubview(searchView)
        searchView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }
    
    var tvTitle : UILabel = {
        let tvTitle = UILabel()
        tvTitle.textColor = .black
        tvTitle.text = "Hôm nay bán gì?"
        tvTitle.font = .systemFont(ofSize: 20)
        return tvTitle
    }()
    
    func setUpTitle() {
        view.addSubview(tvTitle)
        tvTitle.snp.makeConstraints { (make) in
            make.top.equalTo(searchView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview()
        }
    }
    
    lazy var colect : BaseCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colect = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
        colect.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
        colect.register(CellColectionViewCateogory.self, forCellWithReuseIdentifier: "CellColectionViewCateogory")
        colect.delegate = self
        colect.dataSource = self
        colect.backgroundColor = .white
        layout.scrollDirection = .vertical
        
        return colect
    }()
    
    func setUpColectView() {
        view.addSubview(colect)
        colect.snp.makeConstraints { (make) in
            //             if #available(iOS 11.0, *) {
            //                 make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            //             }else{
            //                 make.top.equalTo(topLayoutGuide.snp.top)
            //             }
            make.top.equalTo(tvTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
    }
    
    func getListCategory() {
        Alamofire.request("https://mobishops.herokuapp.com/category/list").responseJSON{ [self](res) in
            let object: AnyObject = res.value as AnyObject
            let dic: [AnyObject] = object as? [AnyObject] ?? []
            dic.forEach { (i) in
                let item = CategoryModel(object: i)
                self.arrCategory.append(item)
            }
            if arrCategory.count > 0{
                arrCategory[0].checkChoose = true
                getListProduct(idCategory: arrCategory[0].categoryId)
            }
            colect.reloadData()
        }
    }
    
    func getListProduct(idCategory : Int) {
        Alamofire.request("https://mobishops.herokuapp.com/product/cate=\(idCategory)").responseJSON{ [self](res) in
            
            let object: AnyObject = res.value as AnyObject
            let dic: [AnyObject] = object as? [AnyObject] ?? []
            dic.forEach { (i) in
                let item = ProductModel(object: i)
                self.arrProduct.append(item)
            }
            self.arrTemp = self.arrProduct
            colect.reloadData()
        }
    }
    
    @objc private func searchPro(_ sender: UIButton){
        if time != nil{
            time.invalidate()
        }
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerSearch), userInfo: nil, repeats: false)
        
    }
    @objc private func timerSearch(){
        arrProduct = []
        //uppercased: chu hoa, lowercased
        arrTemp.forEach { (i) in
            if i.productName.uppercased().contains(searchView.edtSearch.text!.uppercased()){
                arrProduct.append(i)
            }
        }
        if searchView.edtSearch.text! == ""{
            arrProduct = arrTemp
        }
        colect.reloadData()
    }
    
}

extension DashBoardController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // chia ra 2 cell 
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return arrProduct.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell:  CellColectionViewCateogory = collectionView.dequeueReusableCell(withReuseIdentifier: "CellColectionViewCateogory", for: indexPath) as! CellColectionViewCateogory
            cell.arrCate = arrCategory
            cell.colect.reloadData()
            return cell
            
        default:
            let cell:  ProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
            
            cell.displayCell(customer: arrProduct[indexPath.row])
            return cell
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: Dimension.shared.width_screen, height: 45)
        default:
            return CGSize(width: (Dimension.shared.width_screen / 2) - 20, height: 200)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    } // khoang cach giua 2 cell theo chieu tren duoi
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }// khoang cach giua 2 cell theo chieu trai phai
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    } // khoang cach giua colectionview so vs cha no
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1{
            let vc = ProductDetailController()
            vc.modalPresentationStyle = .fullScreen
            vc.data = arrProduct[indexPath.row]
            //self.PushVC(vc: vc)
            navigationController?.navigationBar.isHidden = false
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
