//
//  AppInfo.swift
//  Swift-NetWorking
//
//  Created by FlyElephant on 16/11/22.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import UIKit

struct  AppInfo {
    static let infoDictionary = Bundle.main.infoDictionary
    
    static let appDisplayName: AnyObject? = Bundle.main.infoDictionary!["CFBundleDisplayName"] as AnyObject?
    
    static let bundleIdentifier:String = Bundle.main.bundleIdentifier!
    
    static let appVersion : AnyObject? = Bundle.main.infoDictionary! ["CFBundleShortVersionString"] as AnyObject?
    
    static let buildVersion : AnyObject? = Bundle.main.infoDictionary! ["CFBundleVersion"] as AnyObject? //Bulid 版本号
    
//    let appversion = majorVersion as! String
    
    static let iOSVersion:String = UIDevice.current.systemVersion //ios 版本
    
    static let identifierNumber = UIDevice.current.identifierForVendor //设备 udid
    
    static let systemName = UIDevice.current.systemName //设备名称
    
    static let model = UIDevice.current.model // 设备型号
    
    static let localizedModel = UIDevice.current.localizedModel  //设备区域化型号 如 A1533
}
