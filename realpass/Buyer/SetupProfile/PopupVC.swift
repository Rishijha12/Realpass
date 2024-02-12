//
//  PopupVC.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 11/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit

protocol viewPopupDelegate {
    func openBrokerList()
}
class PopupVC: UIViewController {
    
    
// MARK:- outlets
    @IBOutlet var viewPopup: UIView!{
        didSet{
            self.viewPopup.backgroundColor = .white
            
        }
    }
    @IBOutlet var lblInstructionForBroker: UILabel!{
        didSet{
            self.lblInstructionForBroker.text = "Contact one of the agents recommended brokers to help you with your home loan."
            self.lblInstructionForBroker.numberOfLines = 0
            self.lblInstructionForBroker.font = .custom(style: .Regular, size: .s16)
            self.lblInstructionForBroker.textColor = .black
        }
    }
    @IBOutlet var btnViewBroker: UIButton!{
        didSet{
            self.btnViewBroker.setTitle("View Broker", for: .normal)
            self.btnViewBroker.setTitleColor(UIColor.kTextColor(), for: .normal)
            self.btnViewBroker.titleLabel?.font = .custom(style: .Medium, size: .s16)
            self.btnViewBroker.backgroundColor = UIColor.kSplashColor()
            self.btnViewBroker.layer.cornerRadius = 5.0

        }
    }
    
    @IBOutlet var btnDismis: UIButton!
    // MARK: Local Variable
     var del : viewPopupDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- Setup View
    func setup(){
//        self.view.backgroundColor = UIColor(
    }
    
    // MARK:- Button Click Action
    
    @IBAction func btnClickViewBroker(_ sender: UIButton) {

        self.dismiss(animated: true) {
            self.del?.openBrokerList()
        }
    }
    
    @IBAction func btnClickDismis(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
 
}
