//
//  SubrubsCellVC.swift
//  realpass
//
//  Created by i-Verve on 01/04/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit

class SubrubsCellVC: UITableViewCell {

    @IBOutlet var btnRemoveHistory: UIButton!
    @IBOutlet var lblSearcedSubrubsName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var delHistory : (() -> Void)? = nil

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnAction(sender: UIButton)
       {
           if let btnAction = self.delHistory
           {
               btnAction()
             //  user!("pass string")
           }
       }

}
