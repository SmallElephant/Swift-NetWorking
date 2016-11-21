//
//  PayManager.swift
//  Swift-NetWorking
//
//  Created by FlyElephant on 16/11/21.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import UIKit

class PayManager: NSObject {
    static let sharedInstance = PayManager()
    private override init() {
        super.init()
       NotificationCenter.default.addObserver(self, selector: #selector(PayManager.payManagerNotification), name:NSNotification.Name(rawValue: "PayManagerNotification"), object: nil)
    }
    
    deinit {
        print("♻️ Dealloc \(String(describing: PayManager()))");
    }
    
    func payManagerNotification(notification:Notification) -> Void {
        print("PayManager收到了通知")
    }
}
