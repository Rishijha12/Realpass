//
//  Utils.swift
//  RealPass
//
//  Created by patel chandan on 01/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

func transparentNav(nav: UINavigationController) {
    nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
    nav.navigationBar.shadowImage = UIImage()
    // nav.navigationBar.isTranslucent = true
}
func convertFirstLetter(txtField: SkyFloatingLabelTextField){
    txtField.titleFormatter = { $0 }
}

func swipeToPop(nav: UINavigationController) {

    nav.interactivePopGestureRecognizer?.isEnabled = true;
    nav.interactivePopGestureRecognizer?.delegate = nil;
}
