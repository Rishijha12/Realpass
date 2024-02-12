//
//  UIColor+Extension.swift
//  Demo_LRF+Setting
//
//  Created by i-Phone on 7/6/19.
//  Copyright © 2019 i-Phone. All rights reserved.
//

import Foundation
import UIKit

extension UIColor
{
    fileprivate class func hexStringToUIColor (_ hex:String) -> UIColor
    {
        var cString:String = hex.trimWhiteSpaceAndNewLine.uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = String(cString.suffix(from: cString.index(cString.startIndex, offsetBy: 1)))
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
//    static func color(with hexString:String) -> UIColor
//    {
//        let r, g, b: CGFloat
//        if hexString.hasPrefix("#") {
//            let start = hexString.index(hexString.startIndex, offsetBy: 1)
//            let hexColor = hexString.substring(from: start)
//
//            if hexColor.count == 6 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//
//                if scanner.scanHexInt64(&hexNumber) {
//                    r = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//                    g = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//                    b = CGFloat(hexNumber & 0x000000ff) / 255
//
//                    return UIColor.init(red: r, green: g, blue: b, alpha: 1.0)
//                }
//            }
//        }
//        return UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
//    }
    
//    convenience init(red: Int, green: Int, blue: Int)
//    {
//        assert(red >= 0 && red <= 255, "Invalid red component")
//        assert(green >= 0 && green <= 255, "Invalid green component")
//        assert(blue >= 0 && blue <= 255, "Invalid blue component")
//        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
//    }
    
//    convenience init(rgb: Int)
//    {
//        self.init(
//            red: (rgb >> 16) & 0xFF,
//            green: (rgb >> 8) & 0xFF,
//            blue: rgb & 0xFF
//        )
//    }
    // agent
    class func kAppBgColor() -> UIColor {
        return UIColor.hexStringToUIColor("#f0f2f5")  // 242 242 242
    }
    class func kTextColor() -> UIColor {
        return UIColor.hexStringToUIColor("#000000")  // 0 0 0
    }
    
    class func kPlaceholderColor() -> UIColor {
        return UIColor.hexStringToUIColor("#bababa")  // R: 186, G: 186, B: 186
    }
    
    class func kPlaceholder2Color() -> UIColor {
           return UIColor.hexStringToUIColor("#868686")  // R: 186, G: 186, B: 186
       }
    
    class func kWhiteColur() -> UIColor {
        return UIColor.hexStringToUIColor("#ffffff")  // 0 0 0
    }
    
    class func kBtnBlueColor() -> UIColor {
        return UIColor.hexStringToUIColor("#006ff1") // 0 95 250
    }
    
    class func kTableTextColor() -> UIColor {
        return UIColor.hexStringToUIColor("#5f6368") // 0 95 250
    }
    
    class func kYellowColor() -> UIColor {
        return UIColor.hexStringToUIColor("#fcff4b") // 0 95 250
    }
    class func kSliderColor() -> UIColor {
        return UIColor.hexStringToUIColor("#C3C3C5") // 0 95 250
    }
    
    // buyer
    
    class func kAppThemeColor() -> UIColor {
           return UIColor.hexStringToUIColor("#F8F8F8")  // 248 248 248
       }
       class func kTextColorBuyer() -> UIColor {
           return UIColor.hexStringToUIColor("#0D0D0D")  // 13 13 13
       }
       
       class func kPlaceholderColorBuyer() -> UIColor {
           return UIColor.hexStringToUIColor("#B1B1B1")  // 178 178 178
       }
    
    class func kRadioLabelColor() -> UIColor {
        return UIColor.hexStringToUIColor("#b1b1b1") //217 231 246 070707
        
    }
       
       class func kTextRedColor() -> UIColor {
           return UIColor.hexStringToUIColor("#717171") // 113 113 113
       }
       class func kSelectedColor() -> UIColor {
           return UIColor.hexStringToUIColor("#D9E7F6") //217 231 246
           
       }
       class func kLightColor() -> UIColor {
           return UIColor.hexStringToUIColor("#8d8d8d") //217 231 246
           
       }
       class func kSplashColor() -> UIColor {
           return UIColor.hexStringToUIColor("#FCFF4B") //217 231 246
           
       }
       
       class func kBlueColor() -> UIColor {
           return UIColor.hexStringToUIColor("#0773ed") //217 231 246
           
       }
    class func kLightBlueColor() -> UIColor {
        return UIColor.hexStringToUIColor("#DFEAF7") 
        
    }
    
       class func kInstructionColor() -> UIColor {
           return UIColor.hexStringToUIColor("#070707") //217 231 246 070707  d8e7f7
           
       }
       
       class func kUnselectedLine() -> UIColor {
           return UIColor.hexStringToUIColor("#e5e5e5") //217 231 246 070707 0773ed
           
       }
       
       class func kCellSelectedColor() -> UIColor {
           return UIColor.hexStringToUIColor("#0773ed") //217 231 246 070707 0773ed
           
       }
       
       class func kSepheratorColor() -> UIColor {
           return UIColor.hexStringToUIColor("#f3f3f3") //217 231 246 070707 0773ed
           
       }
       
       class func kBorderColor() -> UIColor {
           return UIColor.hexStringToUIColor("#c1bfbf") //217 231 246 070707 0773ed
           
       }
       class func kBorderColorAddLittleBitMore() -> UIColor {
           return UIColor.hexStringToUIColor("#242424") //217 231 246 070707 0773ed
           
       }
       
       class func kDolorImgViewColor() -> UIColor {
           return UIColor.hexStringToUIColor("#d8e7f7") //217 231 246 070707 0773ed
           
       }
       class func kTextViewPlaceholderColor() -> UIColor {
           return UIColor.hexStringToUIColor("#afafaf") //217 231 246 070707 0773ed
           
       }
       
       class func kButtonSelectedColor() -> UIColor {
           return UIColor.hexStringToUIColor("#E2EAF7") //217 231 246 070707 0773ed
           
       }
       class func kTaptoChangeProfile() -> UIColor {
           return UIColor.hexStringToUIColor("#6b6b6b") //217 231 246 070707 0773ed
           
       }
       class func kStarViewColor() -> UIColor {
              return UIColor.hexStringToUIColor("#9ACFD6") //217 231 246 070707 0773ed
              
          }
    
}
