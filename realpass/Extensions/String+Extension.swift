//
//  String+Extension.swift
//  Demo_LRF+Setting
//
//  Created by i-Phone on 7/6/19.
//  Copyright © 2019 i-Phone. All rights reserved.
//

import Foundation
import UIKit

extension String{
    
    var isAlphanumeric: Bool {
           return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
       }
    var trimWhiteSpaceAndNewLine : String {
        get {
            return self.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    var textlength: Int {
        get {
            return (self as NSString).length
        }
    }
    
    var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F,   // Variation Selectors
            0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
            0x1F1E6...0x1F1FF: // Flags
                return true
            default:
                continue
            }
        }
        return false
    }

    var isValidPhoneNumber: Bool {//A-Z|a-z
          // let emailRegEx = "[0-9]{2,}"
          // let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
          // return emailTest.evaluate(with: self)
           
           let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,12}$"
           let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
           return phoneTest.evaluate(with: self)
       }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    
    
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,32}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidSpaceName() -> Bool
    {
        let firstnameRegex = "^[a-zA-Z0-9_]*$"
        let FirstNameTest = NSPredicate(format: "SELF MATCHES %@", firstnameRegex)
        return FirstNameTest.evaluate(with: self)
    }
    
/*
    func isValidName() -> Bool {
        let testStr = "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
        let predicateTest = NSPredicate(format: "SELF MATCHES %@",testStr)
        return predicateTest.evaluate(with: self)
    }
 */
    
//        func separate(every stride: Int = 4, with separator: Character = " ") -> String {
//            return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
//        }
    
    func separate(every: Int, with separator: String) -> String {
            return String(stride(from: 0, to: Array(self).count, by: every).map {
                Array(Array(self)[$0..<min($0 + every, Array(self).count)])
            }.joined(separator: separator))
        }
    
    
    func isValidName() -> Bool {
        let allowed = CharacterSet.letters.union(.whitespaces)
        return unicodeScalars.allSatisfy(allowed.contains)
    }
    
    func isValidPhone() -> Bool {
        let phoneRegex = "^[0-9]{10,14}$" //[0-9+]{0,1}+
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    
    /*
     +1994423565 - Valid
     ++1994423565 - Invalid
     01994423565 - Valid
     001994423565 - Valid
     */
    
     func validateUrl (urlString: String?) -> Bool {
           let urlRegEx = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
           return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: urlString)
       }
       
       func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
          let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
          label.numberOfLines = 0
          label.text = self
          label.font = font
          label.sizeToFit()
          return label.frame.height
       }
}
extension UIStackView{
    func commonProperty() {
        self.axis  = NSLayoutConstraint.Axis.horizontal
        self.distribution  = UIStackView.Distribution.equalSpacing
        self.alignment = UIStackView.Alignment.center
        self.spacing   = 7.0
        self.translatesAutoresizingMaskIntoConstraints = false;
    }
}

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
        
    }
    
}
