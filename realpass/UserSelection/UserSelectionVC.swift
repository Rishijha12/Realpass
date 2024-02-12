//
//  UserSelectionVC.swift
//  realpass
//
//  Created by patel chandan on 23/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit

class UserSelectionVC: UIViewController {

    @IBOutlet weak var btnAgent: UIButton!{
        didSet{
            btnAgent.layer.cornerRadius = 12.0
            btnAgent.backgroundColor = .white
        }
    }
    
    @IBOutlet weak var btnBuyer: UIButton!{
        didSet{
            btnBuyer.layer.cornerRadius = 12.0
            btnBuyer.backgroundColor = .white
        }
    }
    @IBOutlet weak var btnNext: UIButton!{
        didSet{
            btnNext.layer.cornerRadius = 10
            btnNext.backgroundColor = UIColor.kBtnBlueColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.kAppBgColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)

    }
   
    @IBAction func btnAgentAction(_ sender: UIButton) {
        
        userType = 1
        btnAgent.isSelected = !btnAgent.isSelected
        if btnAgent.isSelected
        {
            btnAgent.layer.borderWidth = 1
            btnAgent.layer.borderColor = UIColor.kBtnBlueColor().cgColor
            btnAgent.setTitleColor(.kBtnBlueColor(), for: .normal)
//            btnBuyer.isEnabled = false
            if btnBuyer.isSelected == true
            {
                btnBuyer.layer.borderWidth = 1
                btnBuyer.layer.borderColor = UIColor.white.cgColor
                btnBuyer.setTitleColor(.black, for: .normal)
                btnBuyer.isSelected = false
            }
            else{
                btnBuyer.isSelected = false
            }
        }
        else
        {
            btnAgent.layer.borderWidth = 1
            btnAgent.layer.borderColor = UIColor.white.cgColor
            btnAgent.setTitleColor(.black, for: .normal)
//            btnBuyer.isEnabled = true
        }
    }
    
    @IBAction func btnBuyerAction(_ sender: UIButton) {
        
        userType = 2
        btnBuyer.isSelected = !btnBuyer.isSelected
        if btnBuyer.isSelected
        {
            btnBuyer.layer.borderWidth = 1
            btnBuyer.layer.borderColor = UIColor.kBtnBlueColor().cgColor
            btnBuyer.setTitleColor(.kBtnBlueColor(), for: .normal)
//            btnAgent.isEnabled = false
            if btnAgent.isSelected == true
            {
                btnAgent.layer.borderWidth = 1
                btnAgent.layer.borderColor = UIColor.white.cgColor
                btnAgent.setTitleColor(.black, for: .normal)
                btnAgent.isSelected = false
            }else{
                btnAgent.isSelected = false
            }
        }
        else
        {
            btnBuyer.layer.borderWidth = 1
            btnBuyer.layer.borderColor = UIColor.white.cgColor
            btnBuyer.setTitleColor(.black, for: .normal)
//            btnAgent.isEnabled = true
        }
    }
    
    @IBAction func btnNextAction(_ sender: UIButton) {
        
        
        if btnAgent.isSelected
        {
            print("btnAgent")
            let objAgent = LoginVc.instantiate(fromAppStoryboard: .PreLogin)
            userType = 1
            UserDefaults.standard.setValue(userType, forKey: Keys.userType)
            self.navigationController?.pushViewController(objAgent, animated: true)
            
            btnAgent.layer.borderColor = UIColor.white.cgColor
            btnAgent.setTitleColor(.black, for: .normal)
            btnAgent.isSelected = false
            
        }
        else if btnBuyer.isSelected
        {
            print("btnBuyer")
            let objBuyer = LoginVc.instantiate(fromAppStoryboard: .PreLogin)
            userType = 2
            UserDefaults.standard.setValue(userType, forKey: Keys.userType)
            self.navigationController?.pushViewController(objBuyer, animated: true)
            
            btnBuyer.layer.borderColor = UIColor.white.cgColor
            btnBuyer.setTitleColor(.black, for: .normal)
            btnBuyer.isSelected = false
            
        }
        else
        {
            showAlertWith(message: "Please select any user.", inView: self)
        }
        
    }
}
