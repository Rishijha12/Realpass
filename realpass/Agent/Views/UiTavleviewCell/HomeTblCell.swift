//
//  HomeTblCell.swift
//  RealPass
//
//  Created by patel chandan on 05/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import SDWebImage

class HomeTblCell: UITableViewCell {

    //MARK:- OUTLATS
    
    @IBOutlet weak var btnProperties: UIButton!{
        didSet{
            self.btnProperties.layer.cornerRadius = 13
            self.btnProperties.layer.borderWidth = 1
            self.btnProperties.layer.borderColor = UIColor.kPlaceholderColor().cgColor
        }
    }
    @IBOutlet weak var btnImageCell: UIButton!
    @IBOutlet weak var cellView: UIView!{
        didSet{
            
        }
    }
    
    @IBOutlet weak var img: UIImageView!{
        didSet{
            img.layer.masksToBounds = true
            img.layer.cornerRadius = ((ScreenSize.SCREEN_WIDTH-16)*0.15)/2
            img.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var lblName: UILabel!{
        didSet{
            lblName.font = UIFont.custom(style: .Medium, size: .s16)
            lblName.textColor = UIColor.kTextColor()
        }
    }
    
    @IBOutlet weak var lblEmail: UILabel!{
        didSet{
            lblEmail.font = UIFont.custom(style: .Regular, size: .s13)
            lblEmail.textColor = UIColor.kTableTextColor()
        }
    }
    
    @IBOutlet weak var lblNumber: UILabel!{
        didSet{
            lblNumber.font = UIFont.custom(style: .Regular, size: .s13)
            lblNumber.textColor = UIColor.kTableTextColor()
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func btnImageCellClicked(_ sender: UIButton) {
        
    }
    
}
