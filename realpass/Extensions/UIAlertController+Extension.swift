//
//  UIAlertController+Extension.swift
//  Demo_LRF+Setting
//
//  Created by i-Phone on 7/6/19.
//  Copyright © 2019 i-Phone. All rights reserved.
//

import Foundation
import UIKit
@available(iOS 13.0, *)
extension UIAlertController{
    
    static func displayNoInternetAlert() {
        
        var viewController = appdelegate.window?.rootViewController
        
        if viewController?.presentedViewController != nil && !(viewController?.presentedViewController is UIAlertController) {
            viewController = viewController?.presentedViewController
        }
        
        UIAlertController.displayAlertFromController(viewController: viewController!, withTitle: APP_NAME, withmessage: Validation.NoInternetConnection, otherButtonTitles: ["OK"], completionHandler: nil)
    }
    
    static func displayAlertFromController(viewController : UIViewController, withTitle title:String?, withmessage message:String?, otherButtonTitles otherTitles:[String]?, completionHandler : ((_ index : NSInteger) -> Void)?) {
        
        if viewController.presentedViewController is UIAlertController {
            let lastalert = viewController.presentedViewController as! UIAlertController
            lastalert.dismiss(animated: false, completion: nil)
        }
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.view.tintColor = UIColor.kAppBgColor()
        
        
        for indexpos in (0...(otherTitles?.count)! - 1) {
            let  strbtntitle = otherTitles![indexpos] as String
            var style: UIAlertAction.Style = .default
            if (strbtntitle as NSString).isEqual(to: "Cancel") {
                style = .cancel
            }
            else if (strbtntitle as NSString).isEqual(to: "Delete") {
                style = .destructive
            }
            
            let action : UIAlertAction = UIAlertAction(title: strbtntitle as String, style: style, handler: { (action1 : UIAlertAction) in
                if (completionHandler != nil) {
                    completionHandler!(indexpos)
                }
            })
            alert.addAction(action)
        }
        viewController.present(alert, animated: true, completion: nil)
    }
}

//** Alert show
func showAlertWith(message : String, inView : UIViewController) {
    
    let alert = UIAlertController(title: APP_NAME, message: message, preferredStyle: UIAlertController.Style.alert)
//    alert.view.tintColor = UIColor.kAppBgColor()
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
    }))
    inView.present(alert, animated: true, completion: nil)
}
func showAlertWithFocusTable(message : String, txtFeilds : UITextField ,inView : UIViewController,tblName : UITableView) {
    
    let alert = UIAlertController(title: APP_NAME, message: message, preferredStyle: UIAlertController.Style.alert)
    alert.view.tintColor = UIColor.kAppBgColor()
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        tblName.reloadData()
        txtFeilds.becomeFirstResponder()
    }))
    inView.present(alert, animated: true, completion: nil)
}


func showAlertWithFocus(message : String, txtFeilds : UITextField ,inView : UIViewController) {
    
    let alert = UIAlertController(title: APP_NAME, message: message, preferredStyle: UIAlertController.Style.alert)
//    alert.view.tintColor = UIColor.kAppBgColor()
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        txtFeilds.becomeFirstResponder()
    }))
    inView.present(alert, animated: true, completion: nil)
}

func showAlertWithFocusOnTxtView(message : String, txtFeilds : UITextView ,inView : UIViewController) {
    
    let alert = UIAlertController(title: APP_NAME, message: message, preferredStyle: UIAlertController.Style.alert)
    alert.view.tintColor = UIColor.kAppBgColor()
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        txtFeilds.becomeFirstResponder()
    }))
    inView.present(alert, animated: true, completion: nil)
}
