//
//  UITextfield+Extension.swift
//  Demo_LRF+Setting
//
//  Created by i-Phone on 7/6/19.
//  Copyright © 2019 i-Phone. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

private var kAssociationKeyMaxLength: Int = 0

extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func removeLeftPaddingPoints(){
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func setCustomPropertyTextFeilds(_ placeholderText : NSString , txtColor : UIColor , alignMent : NSTextAlignment , keybordType : UIKeyboardType ,fontType : UIFont, tintColor : UIColor)
    {
        self.tintColor = tintColor
        self.textColor = txtColor
        self.textAlignment = alignMent
        self.keyboardType = keybordType
        self.font = fontType
        self.attributedPlaceholder = NSAttributedString(string: placeholderText as String, attributes: [NSAttributedString.Key.foregroundColor : UIColor.kInstructionColor()])
    }
    func setCommonPropertyTextFeilds(_ placeholderText : String)
    {
        self.tintColor = UIColor.kPlaceholderColor()
        self.textColor = UIColor.kTextColorBuyer() 
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.backgroundColor = UIColor.clear
//        self.font = UIFont.Font_Poppins_Regular(fontsize: 17.0)
        self.textAlignment = .left
        self.attributedPlaceholder = NSAttributedString(string: placeholderText as String, attributes: [NSAttributedString.Key.foregroundColor : UIColor.kPlaceholderColor()])
    }
    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }
    @objc func checkMaxLength(textField: UITextField) {
        guard let prospectiveText = self.text,
            prospectiveText.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        let substring = prospectiveText[..<indexEndOfText]
        text = String(substring)
        selectedTextRange = selection
    }
    
    
    
}

extension SkyFloatingLabelTextField{
func convertFirstLetter(){
    self.titleFormatter = { $0 }
}
}
