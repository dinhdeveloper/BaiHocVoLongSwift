//
//  Logger.swift
//  BBProject
//
//  Created by IOS DEV02 on 04/05/2021.
//  Copyright Ā© 2021 QTCTEK COMP. All rights reserved.
//
import UIKit


class Logger{
    
 static func log(_ logType:LogType,_ message: String){
        switch logType {
        case LogType.error:
            print("\nš Error: \(message)\n")
        case LogType.warning:
            print("\nš Warning: \(message)\n")
        case LogType.success:
            print("\nš Success: \(message)\n")
        case LogType.action:
            print("\nš Action: \(message)\n")
        case LogType.canceled:
            print("\nš Cancelled: \(message)\n")
        }
    }

}
