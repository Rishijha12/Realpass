//
//  DateListCell.swift
//  realpass
//
//  Created by i-Verve on 06/07/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit

class DateListCell: UITableViewCell{
   
    @IBOutlet var tblBuyrListheitht: NSLayoutConstraint!
    @IBOutlet var dateBtnHeight: NSLayoutConstraint!
    @IBOutlet var TopView: UIView!
    @IBOutlet var btnDate: UIButton!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var tblViewBuyerList: UITableView!
    @IBOutlet var sephretorView: UIView!
    
    var buttonPressed : (() -> ()) = {}
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        //Call your closure here
                buttonPressed()
        
    }
}
