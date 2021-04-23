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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpViewSearch()
        
        setUpTitle()
        
        setUpColectView()
        
        getListCategory()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getCategoryId(_:)), name: NSNotification.Name("CATE"), object: nil)
        
    }
    
    @objc func getCategoryId(_ idCategory: Notification){
        guard let result: String = idCategory.object as? String else {
            return
        }
        print(result)
        getListProduct(idCategory: result)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    var searchView: SearchView = {
       let searchView = SearchView()
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
             make.height.equalTo(60)
            make.left.equalToSuperview().offset(10)
             make.right.equalToSuperview()
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
            arrCategory[0].checkChoose = true
             colect.reloadData()
         }
     }
    
    func getListProduct(idCategory : String) {
        Alamofire.request("http://mobishops.herokuapp.com/product/cate=\(idCategory)").responseJSON{ [self](res) in
            let object: AnyObject = res.value as AnyObject
            let dic: [AnyObject] = object as? [AnyObject] ?? []
            dic.forEach { (i) in
                let item = ProductModel(object: i)
                self.arrProduct.append(item)
            }
            colect.reloadData()
        }
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
            return CGSize(width: (Dimension.shared.width_screen / 2) - 40, height: 300)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    } // khoang cach giua 2 cell theo chieu tren duoi
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }// khoang cach giua 2 cell theo chieu trai phai
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    } // khoang cach giua colectionview so vs cha no
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        for i in 0..<arrCategory.count {
//            if i == indexPath.row {
//                arrCategory[i].checkChoose = true
//                getListProduct(idCategory: arrCategory[i].categoryId)
//            }
//            else{
//                arrCategory[i].checkChoose = false
//            }
//        }
//        colect.reloadData()
    }
}
