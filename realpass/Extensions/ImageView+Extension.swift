//
//  ImageView+Extension.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 02/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    public func makeImageCircla(_ image: UIImage){
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.image = image
    }
}
