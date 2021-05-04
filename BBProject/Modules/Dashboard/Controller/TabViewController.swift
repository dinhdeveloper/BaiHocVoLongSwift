//
//  TabViewController.swift
//  BBProject
//
//  Created by IOS DEV02 on 26/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    var arrController: [UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTabbar()
        showFloatAction()
        
        self.selectedIndex = 0
        self.selectedViewController = arrController[0]
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .blue
    }
    
    
    private func setupTabbar(){
        let vc1 = DashBoardController()
        //let vc2 = GioHangController()
        vc1.tabBarItem = UITabBarItem(title: "Giao dịch", image: UIImage() , tag: 0)
        //vc2.tabBarItem = UITabBarItem(title: "Gio Hang", image: UIImage() , tag: 1)
        let vc3 = CameraController()
        vc3.tabBarItem = UITabBarItem(title: "Camera", image: UIImage() , tag: 1)
        arrController = [vc1, vc3]
        self.setViewControllers(arrController, animated: true)
    }
    
    lazy var floatAction : GioHangController = {
        let floatA = GioHangController()
        floatA.backgroundView.addTarget(self, action: #selector(onClickItem), for: .touchUpInside)
        return floatA
    }()
    
    func showFloatAction() {
        view.addSubview(floatAction)
        floatAction.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-150)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
    }
    //MARK: funtion
    private var is_show = false
    
    @objc func onClickItem() {
        if !is_show {
            self.floatAction.snp.updateConstraints { (make) in
                make.width.equalTo(150)
            }
        }else{
            self.floatAction.snp.updateConstraints { (make) in
                make.width.equalTo(60)
            }
        }
        is_show = !is_show
    }
}
