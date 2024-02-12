//
//  sharedManager.swift
//  Demo_LRF+Setting
//
//  Created by Mehul Pal on 12/07/19.
//  Copyright © 2019 i-Phone. All rights reserved.
//

import UIKit

enum Authentication
{
    case isFirstLaunch
    case isLogin
    case isRememberMe
    case isLogOut
}

class SharedManager
{
    var authenticateState : Authentication = .isFirstLaunch
    static let sharedInstance = SharedManager()
    func network()
    {}
    private init() {}
}
