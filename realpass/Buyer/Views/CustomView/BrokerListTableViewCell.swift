//
//  BrokerListTableViewCell.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 12/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit

class BrokerListTableViewCell: UITableViewCell {
    @IBOutlet var viewTblVeiwCellContainer: UIView!
    @IBOutlet var lblName: UILabel!{
        didSet{
            self.lblName.font = .custom(style: .Medium, size: .s18)
            self.lblName.textColor = .black
        }
    }
    @IBOutlet var lblUrl: UILabel!{
        didSet{
            self.lblUrl.font = .custom(style: .Medium, size: .s14)
            self.lblUrl.textColor = .black
//            let underLineAttribute = [NSAttributedString.Key.underlineStyle : NSUnderlineStyle.thick.rawValue]
            
        }
    }
    
    @IBOutlet var btnUrl: UIButton!{
        didSet{
            self.btnUrl.titleLabel?.font = .custom(style: .Regular, size: .s16)
        }
    }
    
    @IBOutlet var vewSepherator: UIView!{
        didSet{
            self.vewSepherator.backgroundColor = .kSepheratorColor()
        }
    }
    @IBOutlet var imgOfBroker: UIImageView!{
        didSet{
            
            imgOfBroker.layer.masksToBounds = true
            imgOfBroker.layer.cornerRadius = ((ScreenSize.SCREEN_WIDTH)*0.15)/2
            imgOfBroker.clipsToBounds = true
        }
    }
    var buttonPressed : (() -> ()) = {}
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        //Call your closure here
                buttonPressed()
            }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
