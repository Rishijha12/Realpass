//
//  ParternerTableViewCell.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 17/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit

class ParternerTableViewCell: UITableViewCell {
    // MARK:- Outlets
    @IBOutlet var viewPartnerDetailContainer: UIView!{
        didSet{
            self.viewPartnerDetailContainer.backgroundColor = .white
            self.viewPartnerDetailContainer.layer.cornerRadius = 10.0
        }
    }
    
    @IBOutlet var lblFName: UILabel!{
        didSet{
            self.lblFName.font = .custom(style: .Medium, size: .s16)
            self.lblFName.textColor = .black
        }
    }
    @IBOutlet var lblLName: UILabel!{
        didSet{
            self.lblLName.font = .custom(style: .Medium, size: .s16)
            self.lblFName.textColor = .black
        }
    }
    @IBOutlet var lblMobile: UILabel!{
        didSet{
            self.lblMobile.font = .custom(style: .Regular, size: .s16)
            self.lblMobile.textColor = .black
        }
    }
    @IBOutlet var lblEmail: UILabel!{
        didSet{
            self.lblEmail.font = .custom(style: .Regular, size: .s16)
            self.lblEmail.textColor = .black
        }
    }
    @IBOutlet var viewSepherator: UIView!{
        didSet{
            self.viewSepherator.backgroundColor = .kSepheratorColor()
        }
    }
    
    // MARK:- Local Properties
    var fName: String = ""
    var lName: String = ""
    var mobile: String = ""
    var lname: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
