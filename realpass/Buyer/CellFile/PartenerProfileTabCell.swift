//
//  PartenerProfileTabCell.swift
//  realpass
//
//  Created by patel chandan on 22/04/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit

class PartenerProfileTabCell: UITableViewCell {
    
    
    @IBOutlet weak var lblname: UILabel!
        {
        didSet
        {
            lblname.font = .custom(style: .Regular, size: .s14)//UIFont.Font_Robot_Medium(fontsize: 14.0)
            lblname.textColor = UIColor.kTextColor()
        }
    }
    
    @IBOutlet weak var lblnumber: UILabel!
    {
           didSet
           {
               lblnumber.font = .custom(style: .Regular, size: .s14)
               lblnumber.textColor = UIColor.kTextColor()
           }
       }
    
    @IBOutlet weak var lblemail: UILabel!
    {
           didSet
           {
               lblemail.font = .custom(style: .Regular, size: .s14)
               lblemail.textColor = UIColor.kTextColor()
           }
       }
    @IBOutlet var viewSephretor: UIView!{
        didSet{
            self.viewSephretor.backgroundColor = .kSepheratorColor()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
