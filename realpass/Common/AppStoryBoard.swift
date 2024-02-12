//
//  AppStoryBoard.swift
//  ContactSyncDemo
//
//  Created by Mehul Pal on 09/07/19.
//  Copyright © 2019 Jatin. All rights reserved.
//


import UIKit
import Foundation

enum AppStoryboard : String {
    
    case PreLogin
    case Agent
    case Buyer
    
    
    var instance : UIStoryboard {
        
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID : String {
        
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    func showAlertMessage(messageStr:String, action: @escaping (UIAlertAction?) -> Void) {
        let alert = UIAlertController(title: APP_NAME, message: messageStr, preferredStyle: UIAlertController.Style.alert)
       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: action))
        self.present(alert, animated: true, completion: nil)
    }
}




