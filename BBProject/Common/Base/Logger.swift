//
//  Logger.swift
//  BBProject
//
//  Created by IOS DEV02 on 04/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//
import UIKit


class Logger{
    
 static func log(_ logType:LogType,_ message: String){
        switch logType {
        case LogType.error:
            print("\n📕 Error: \(message)\n")
        case LogType.warning:
            print("\n📙 Warning: \(message)\n")
        case LogType.success:
            print("\n📗 Success: \(message)\n")
        case LogType.action:
            print("\n📘 Action: \(message)\n")
        case LogType.canceled:
            print("\n📓 Cancelled: \(message)\n")
        }
    }

}
