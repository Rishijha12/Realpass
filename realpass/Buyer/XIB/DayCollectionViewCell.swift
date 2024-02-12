//
//  DayCollectionViewCell.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 04/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
// MARK:- Outlets
    
    @IBOutlet var btnDay: UIButton!
    @IBOutlet var viewCellConainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK:- Custom Function
    func toggleSelected(){
        if (isSelected){
            viewCellConainer.backgroundColor = UIColor.kSelectedColor()
        }else{
             viewCellConainer.backgroundColor = UIColor.kAppThemeColor()
        }
    }

}
