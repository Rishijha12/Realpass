//
//  UIFont+Extension.swift
//  Demo_LRF+Setting
//
//  Created by i-Phone on 7/6/19.
//  Copyright © 2019 i-Phone. All rights reserved.
//

import Foundation
import UIKit


extension UIFont {
    
   /*
    //MARK:- -------- logAllFont
    class func logAllfont() {
        for family in UIFont.familyNames as [String]
        {
            print("\(family)")
            for name in UIFont.fontNames(forFamilyName: family)
            {
                print("   \(name)")
            }
        }
    }
    
    // regular - bold medium
    class func Roboto_Medium(fontsize size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: getPropostionalFontSize(size))!
    }
    
    class func Roboto_regular(fontsize size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: getPropostionalFontSize(size))!
    }
    
    class func Roboto_Bold(fontsize size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: getPropostionalFontSize(size))!
    }
    
    class func ProximaNova__Thin(fontsize size: CGFloat) -> UIFont {
        return UIFont(name: "FontsFree-Net-Proxima-Nova-Sbold", size: getPropostionalFontSize(size))!
    }
    class func ProximaNova_Alt_Bold(fontsize size: CGFloat) -> UIFont {
        return UIFont(name: "Proxima Nova Alt Bold", size: getPropostionalFontSize(size))!
    }
    class func ProximaNova_Alt_Light(fontsize size: CGFloat) -> UIFont {
        return UIFont(name: "Proxima Nova Alt Light", size: getPropostionalFontSize(size))!
    }
    
    class func ProximaNova_Alt_Thin(fontsize size: CGFloat) -> UIFont {
        return UIFont(name: "Proxima Nova Alt Thin", size: getPropostionalFontSize(size))!
    }
    class func ProximaNova_Black(fontsize size: CGFloat) -> UIFont {
        return UIFont(name: "Proxima Nova Black", size: getPropostionalFontSize(size))!
    }
    class func ProximaNova_Bold(fontsize size: CGFloat) -> UIFont {
        return UIFont(name: "Proxima Nova Bold", size: getPropostionalFontSize(size))!
    }
    class func ProximaNova_Extrabold(fontsize size: CGFloat) -> UIFont {
        return UIFont(name: "Proxima Nova Extrabold", size: getPropostionalFontSize(size))!
    }
    class func ProximaNova_Thin(fontsize size: CGFloat) -> UIFont {
        return UIFont(name: "Proxima Nova Thin", size: getPropostionalFontSize(size))!
    }
 */
        private static var scale: CGFloat = {
            if UIScreen.main.bounds.width == 375 {
                return 375 / 414
            } else if UIScreen.main.bounds.width == 320 {
                return 320 / 414
            } else {
                return 1
            }
        }()
        
        enum Size: CGFloat {
            case s5 = 5,
            s8 = 8,
            s9 = 9,
            s10 = 10,
            s11 = 11,
            s12 = 12,
            s13 = 13,
            s14 = 14,
            s15 = 15,
            s16 = 16,
            s17 = 17,
            s18 = 18,
            s19 = 19,
            s20 = 20,
            s21 = 21,
            s22 = 22,
            s23 = 23,
            s24 = 24,
            s25 = 25,
            s26 = 26,
            s27 = 27,
            s28 = 28,
            s29 = 29,
            s30 = 30,
            s31 = 31,
            s32 = 32,
            s33 = 33,
            s34 = 34,
            s35 = 35,
            s36 = 36,
            s37 = 37,
            s38 = 38,
            s39 = 39,
            s40 = 40,
            s41 = 41,
            s42 = 42,
            s43 = 43,
            s44 = 44,
            s45 = 45,
            s46 = 46,
            s47 = 47,
            s48 = 48,
            s49 = 49,
            s50 = 50,
            s51 = 51,
            s55 = 55
        }
        enum Style: String {
            case Regular = "Regular", Medium = "Medium", Bold = "Bold"
        }
        
        class func custom(style: Style, size: Size) -> UIFont {
            let size = size.rawValue * scale
            return UIFont.init(name: "Roboto-\(style.rawValue)", size: getPropostionalFontSize(size)) ?? UIFont.systemFont(ofSize: getPropostionalFontSize(size))
    }
}
