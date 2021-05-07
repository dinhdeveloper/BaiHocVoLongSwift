//
//  Resource.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

public class Resource {
    
    class Method {
        public static var shared = Method()
        private init(){}
        let postMethod = "POST"
        let getMethod = "GET"
        let authen = "Basic YWRtaW46cXRjdGVrQDEyMwx=="
    }
    
    class Response {
        public static var shared = Response()
        private init(){}
        let data : String = "data"
        let success : String = "success"
        let success_true : String = "true"
        let success_false : String = "false"
        let message : String = "message"
    }
    class Images {
        public static var shared = Images()
        private init(){}
        let noImage : UIImage = UIImage()
        let photoDefault : UIImage = UIImage(named: "Unknown") ?? UIImage()
        let checkerror1 : UIImage = UIImage(named: "checkerror1x") ?? UIImage()
        let checksuccess : UIImage = UIImage(named: "checked_success1x") ?? UIImage()
        let back1x : UIImage = UIImage(named: "back") ?? UIImage()
        let backHeader : UIImage = UIImage(named: "left_arrow") ?? UIImage()
        let arrow_point_down : UIImage = UIImage(named: "arrow-point-to-down1x") ?? UIImage()
        let user_avatar = UIImage(named: "user_avatar") ?? UIImage()
        var Icon_Job = UIImage(named: "Icon_Job") ?? UIImage()
        let warning_yellow = UIImage(named: "warning") ?? UIImage()
        
        
        let warning : UIImage = UIImage(named: "warning") ?? UIImage()
        let icon_avatar : UIImage = UIImage(named: "icon_avatar") ?? UIImage()
        let employee_manager : UIImage = UIImage(named: "QLNV") ?? UIImage()
        let product_manager : UIImage = UIImage(named: "QLSP") ?? UIImage()
        let customer_manager : UIImage = UIImage(named: "QLKH") ?? UIImage()
        let report_manager : UIImage = UIImage(named: "BCTK") ?? UIImage()
        let order_manager : UIImage = UIImage(named: "QLDH") ?? UIImage()
        let level_customer_manager : UIImage = UIImage(named: "QLCDKH") ?? UIImage()
        let next : UIImage = UIImage(named: "next1x") ?? UIImage()
        let information : UIImage = UIImage(named: "information") ?? UIImage()
        let clock = UIImage(named: "clock") ?? UIImage()
        let logout_admin : UIImage = UIImage(named: "logout") ?? UIImage()
        let key : UIImage = UIImage(named: "key") ?? UIImage()
        let star : UIImage = UIImage(named: "star_yellow") ?? UIImage()
        let task : UIImage = UIImage(named: "task") ?? UIImage()
        let Account_manager_list : UIImage = UIImage(named: "Account_manager_list") ?? UIImage()
        let search : UIImage = UIImage(named: "search") ?? UIImage()
        let icon_add : UIImage = UIImage(named: "btn_create") ?? UIImage()
        let icon_level : UIImage = UIImage(named: "icon_level") ?? UIImage()
        let avatar : UIImage = UIImage(named: "user1") ?? UIImage()
        let avatar_customer : UIImage = UIImage(named: "user1") ?? UIImage()
        let icon_cate : UIImage = UIImage(named: "icon_cate") ?? UIImage()
        let icon_product : UIImage = UIImage(named: "icon_product") ?? UIImage()
        let placeholder1x : UIImage = UIImage(named: "placeholder1x") ?? UIImage()
        let phone1x : UIImage = UIImage(named: "phone1x") ?? UIImage()
        let more : UIImage = UIImage(named: "more1x") ?? UIImage()
        let next_arrow : UIImage = UIImage(named: "next_arrow") ?? UIImage()
        let checked : UIImage = UIImage(named: "tick1x") ?? UIImage()
        let login_admin : UIImage = UIImage(named: "login_admin") ?? UIImage()
        let username_admin : UIImage = UIImage(named: "username_admin") ?? UIImage()
        let password_admin : UIImage = UIImage(named: "password_admin") ?? UIImage()
        let menu : UIImage = UIImage(named: "menu1x") ?? UIImage()
        let eye : UIImage = UIImage(named: "eye1x") ?? UIImage()
        let hidden : UIImage = UIImage(named: "hidden1x") ?? UIImage()
        let preview_black : UIImage = UIImage(named: "preview_black") ?? UIImage()
        let next_black : UIImage = UIImage(named: "next_black") ?? UIImage()
        let plus : UIImage = UIImage(named: "plus") ?? UIImage()
        let icon_filter : UIImage = UIImage(named: "icon_filter") ?? UIImage()
        let time : UIImage = UIImage(named: "time") ?? UIImage()
        let icon_vip : UIImage = UIImage(named: "icon_vip") ?? UIImage()
        let empty : UIImage = UIImage(named: "empty") ?? UIImage()
        let btnDelete : UIImage = UIImage(named: "btnDelete") ?? UIImage()
        let empty_box : UIImage = UIImage(named: "empty_box") ?? UIImage()
        let calendar : UIImage = UIImage(named: "calendar") ?? UIImage()
        let tag_complete : UIImage = UIImage(named: "tag_complete") ?? UIImage()
        let tag_dont_complete : UIImage = UIImage(named: "tag_dont_complete") ?? UIImage()
        let supplier : UIImage = UIImage(named: "supplier") ?? UIImage()
        let ware_house : UIImage = UIImage(named: "ware_house") ?? UIImage()
        let sell : UIImage = UIImage(named: "sell") ?? UIImage()
        let money : UIImage = UIImage(named: "money") ?? UIImage()
        let scan_barcode : UIImage = UIImage(named: "scan_barcode") ?? UIImage()
        let Shipment : UIImage = UIImage(named: "Shipment") ?? UIImage()
        let change : UIImage = UIImage(named: "change") ?? UIImage()
        let login_bg : UIImage = UIImage(named: "login_bg") ?? UIImage()
        let icon_barcode : UIImage = UIImage(named: "icon_barcode") ?? UIImage()
        let location : UIImage = UIImage(named: "location") ?? UIImage()
        let iconSub : UIImage = UIImage(named: "icon_sub") ?? UIImage()
        let iconAdd : UIImage = UIImage(named: "icon_plus") ?? UIImage()
        let menu_home : UIImage = UIImage(named: "menu_home") ?? UIImage()
        let menu_order : UIImage = UIImage(named: "menu_order") ?? UIImage()
        let icon_price : UIImage = UIImage(named: "icon_price") ?? UIImage()
        let icon_order_code : UIImage = UIImage(named: "icon_order_code") ?? UIImage()
        let icon_safe_quantity : UIImage = UIImage(named: "icon_safe_quantity") ?? UIImage()
        let icon_printer : UIImage = UIImage(named: "icon_printer") ?? UIImage()
        let icon_hone_nav : UIImage = UIImage(named: "icon_hone_nav") ?? UIImage()
        let icon_edit : UIImage = UIImage(named: "edit") ?? UIImage()
        let icon_camera : UIImage = UIImage(named: "icon_camera") ?? UIImage()
        let alarm : UIImage = UIImage(named: "alarm") ?? UIImage()
        let avatar_bh : UIImage = UIImage(named: "avatar_bh") ?? UIImage()
        let icon_name_bh : UIImage = UIImage(named: "icon_name_bh") ?? UIImage()
        let icon_code_bh : UIImage = UIImage(named: "icon_code_bh") ?? UIImage()
        let icon_email_bh : UIImage = UIImage(named: "icon_email_bh") ?? UIImage()
        let logo_company : UIImage = UIImage(named: "company") ?? UIImage()
        let force_signout : UIImage = UIImage(named: "force_signout") ?? UIImage()
        let warning_force_signout : UIImage = UIImage(named: "warning_force_signout") ?? UIImage()
        let dissable : UIImage = UIImage(named: "dissable") ?? UIImage()
        let warning_red : UIImage = UIImage(named: "warning_red") ?? UIImage()
        
        let tabbar_home : UIImage = UIImage(named: "tabbar_home") ?? UIImage()
        let tabbar_order : UIImage = UIImage(named: "tabbar_order") ?? UIImage()
        let tabbar_product : UIImage = UIImage(named: "tabbar_product") ?? UIImage()
        let tabbar_customer : UIImage = UIImage(named: "tabbar_customer") ?? UIImage()
        let tabbar_logout : UIImage = UIImage(named: "tabbar_logout") ?? UIImage()
        
    }
    class FontName {
        public static var shared = FontName()
        private init(){}
        let bold_italic : String = "HelveticaNeue-BoldItalic"
        let bold : String = "HelveticaNeue-Bold"
        let italic : String = "HelveticaNeue-Italic"
        let general : String = "HelveticaNeue"
    }
    class Title {
        public static var shared = Title()
        private init(){}
        let cancel : String = "Thoát"
        let search : String = "Tìm kiếm"
        let title_error : String = "Thông báo"
        let title_success : String = "Thành công"
    }
    class Identifier {
        public static var shared = Identifier()
        private init(){}
        let cell_default : String = "CellDefault"
        let cell_slideMenu : String = "CellSlideMenu"
    }
    class NotificationName {
        public static var shared = NotificationName()
        private init(){}
        let select_item_slidemenu = "select_item_slidemenu"
    }
    class TitleAlert {
        public static var shared = TitleAlert()
        private init(){}
        let disconnect : String = "Mất kết nối Internet"
        let no_connect_server : String = "Có lỗi xảy ra vui lòng thử lại"
        let account_exist : String = "Tài khoản đã được đăng ký"
        let invalid_pw : String = "Sai mật khẩu"
        let phone_dont_exist : String = "Tài khoản không tồn tại"
    }
}
