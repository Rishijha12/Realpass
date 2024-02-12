//
//  HomeTblCell.swift
//  Real Pass Buyer
//
//  Created by patel chandan on 09/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit

class BuyerHomeTblCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!{
        didSet{
            
        }
    }
    
    @IBOutlet weak var lblAddress: UILabel!{
        didSet{
            lblAddress.font = .custom(style: .Medium, size: .s16)
        }
    }
    
    @IBOutlet weak var lblWebSite: UILabel!{
        didSet{
            lblWebSite.font = .custom(style: .Regular, size: .s12)
            lblWebSite.textColor = UIColor.kLightColor()
        }
    }
    @IBOutlet var btnWebsite: UIButton!{
        didSet{
            self.btnWebsite.titleLabel?.font = .custom(style: .Regular, size: .s12)
            self.btnWebsite.setTitleColor(.kLightColor(), for: .normal)
        }
    }
    
    @IBOutlet weak var imgHome_Pic: UIImageView!{
        didSet{
            self.imgHome_Pic.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var imgProfile: UIImageView!{
        didSet{
        imgProfile.layer.cornerRadius = ScreenSize.SCREEN_WIDTH*0.067/2

        }
    }
    
    @IBOutlet weak var lblName: UILabel!{
        didSet{
        lblName.font = .custom(style: .Regular, size: .s12)
        }
    }
    
    @IBOutlet weak var lblDate: UILabel!{
        didSet{
        lblDate.font = .custom(style: .Regular, size: .s12)
        }
    }
    
    @IBOutlet var viewStar: UIView!{
        didSet{
//            self.viewStar.backgroundColor = .kStarViewColor()
        }
    }
    @IBOutlet var imgViewStar: UIImageView!{
        didSet{
            self.imgViewStar.image = UIImage(named: ImageName.rate)
            
        }
    }
    @IBOutlet var lblNumberOfStar: UILabel!{
        didSet{
            self.lblNumberOfStar.text = "4"
            self.lblNumberOfStar.font = .custom(style: .Medium, size: .s14)
        }
    }
    
    var buttonPressed : (() -> ()) = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        if isFromHome == true{
//            self.selectionStyle = .none
//        }else{
//            self.selectionStyle = .blue
//        }
    }
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        //Call your closure here
                buttonPressed()
        
    }

}
