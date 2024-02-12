//
//  ForgotPasswordVc.swift
//  RealPass
//
//  Created by patel chandan on 10/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import SwiftyJSON
import SkyFloatingLabelTextField

class ForgotPasswordVc: UIViewController,UITextFieldDelegate {
    
    //MARK:- OUTLATS
    @IBOutlet weak var myview: UIView!{
        didSet{
            myview.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var txtForgotPassword: SkyFloatingLabelTextField!{
        didSet{
            txtForgotPassword.attributedPlaceholder = NSAttributedString(string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.kPlaceholderColor()])
            txtForgotPassword.placeholder = "Email"
            txtForgotPassword.title = "Email"
//            txtForgotPassword.titleFont = UIFont.Roboto_regular(fontsize: 9.0)
            txtForgotPassword.titleFont = .custom(style: .Regular, size: .s9)
            txtForgotPassword.selectedTitleColor = UIColor.kTextColor()
            txtForgotPassword.selectedLineColor = UIColor.kBtnBlueColor()
//            txtForgotPassword.font = UIFont.Roboto_regular(fontsize: 16.0)
            txtForgotPassword.font = .custom(style: .Regular, size: .s16)
            txtForgotPassword.textColor = UIColor.kTextColor()
            txtForgotPassword.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var imgMail: UIImageView!{
        didSet{
            imgMail.tintColor = UIColor.black
        }
    }
    
    @IBOutlet weak var btnSubmit: UIButton!{
        didSet{
            btnSubmit.layer.cornerRadius = 12
            btnSubmit.backgroundColor = UIColor.kBtnBlueColor()
//            btnSubmit.titleLabel?.font = UIFont.custom(style: .Regular, size: .s20)

            btnSubmit.titleLabel?.font = .custom(style: .Regular, size: .s20)
            btnSubmit.setTitleColor(UIColor.kWhiteColur(), for: .normal)
        }
    }
    
    //MARK:- LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        txtForgotPassword.delegate = self
        self.title = "FORGOT PASSWORD"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        self.view.backgroundColor = UIColor.kAppBgColor()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.setLeftBarButton(.init(image: #imageLiteral(resourceName: "back button"), style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
                   self.navigationItem.leftBarButtonItem!.tintColor = .black
        
        self.swipeToPop()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "FORGOT PASSWORD"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setLeftBarButton(.init(image: #imageLiteral(resourceName: "back button"), style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
                   self.navigationItem.leftBarButtonItem!.tintColor = .black
    }
    
    //MARK:- ACTIONS
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        self.validationForgot()
    }
    
    //MARK:- FUNCTIONS
    
    @objc func backNavigationAction()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    func validationForgot()
    {
        let currEmail = currentUser.email
        
        if txtForgotPassword.text!.isBlank
        {
            showAlertWithFocus(message: Validation.EmailId, txtFeilds: txtForgotPassword, inView: self)
        }
        else if txtForgotPassword.text?.isValidEmail() == false
        {
            showAlertWithFocus(message: Validation.ValidEmailId, txtFeilds: txtForgotPassword, inView: self)
        }
        else
        {
            if userType == 1
            {
                self.ForgotPasswordApi()
            }
            else
            {
               self.ForgotPasswordBuyerApi()
            }
        }
    }
    
    
    //MARK:- textfield Delegets
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == txtForgotPassword
        {
            imgMail.tintColor = UIColor.kBtnBlueColor()
        }
      
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        imgMail.tintColor = .black
    }
    
    func swipeToPop() {

        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
    }
    
    
    func ForgotPasswordApi()
    {
        var param: [String:Any] = [:]
        param[RequestKeys.email] = self.txtForgotPassword.text
        
        APIManager.showLoader()
        APIManager.shared.callPostApi(url: APIEndpoint.forgotPassword, parameters: param) { (result) in
        APIManager.hideLoader()
            
            
            switch result
            {
            case.success(let response):
                
                let data = JSON.init(response)
                print(data)
                if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 5{
                    showAlertWith(message: data["message"].stringValue, inView: self)
                }
                else if data["status"].intValue == 4{
                  
                    let alert = UIAlertController(title: APP_NAME, message: "You are login to another device Please login to this device to continue", preferredStyle: .alert)
                    let Yes = UIAlertAction(title: "Ok", style: .destructive)
                    { (btnOkAction) in
                        
        //                self.LogoutApi()
                        
                        UserDefaults.standard.removeObject(forKey: Keys.userType)
                        UserDefaults.standard.removeObject(forKey: Keys.accessToken)
                        UserDefaults.standard.removeObject(forKey: Keys.isProfileSetUp)
                        UserDefaults.standard.removeObject(forKey: Keys.agentId)
                        UserDefaults.standard.removeObject(forKey: Keys.currentUserData)
                        UserDefaults.standard.removeObject(forKey: "isUserLogin")
                        UserDefaults.standard.removeObject(forKey: Keys.password)
                       
                        
                        
                        
                        if let viewControllers = self.navigationController?.viewControllers{
                            for controller in viewControllers{
                                if controller is UserSelectionVC{
                                    self.navigationController?.popToRootViewController(animated: true)
                                    return
                                }
                            }
                        }
                        let storyboard = UIStoryboard.init(name: "PreLogin", bundle: nil)
                        appdelegate.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "userSelection")
                        appdelegate.window?.makeKeyAndVisible()
                    }
                    alert.addAction(Yes)
                    self.present(alert, animated: true, completion: nil)
                    
                }
                else if data["status"].intValue == 1
                {
//                    showAlertWith(message: data["message"].stringValue, inView: self)
                    self.showAlertMessage(messageStr: data["message"].stringValue) { (btnaction) in
                        self.navigationController?.popViewController(animated: true)
                        self.txtForgotPassword.text = ""
                    }
                }
                
                break
            case.failure(let error):
                print(error.localizedDescription)
                break
            }
        }
        
    }
    
        func ForgotPasswordBuyerApi()
        {
            var param: [String:Any] = [:]
            param[RequestKeys.email] = self.txtForgotPassword.text
            
            APIManager.showLoader()
            APIManager.shared.callPostApi(url: APIEndpoint.forgotPassword, parameters: param) { (result) in
            APIManager.hideLoader()
                
                
                switch result
                {
                case.success(let response):
                    
                    let data = JSON.init(response)
                    print(data)
                    if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4 || data["status"].intValue == 5{
                        showAlertWith(message: data["message"].stringValue, inView: self)
                    }
                        
                    else if data["status"].intValue == 1
                    {
    //                    showAlertWith(message: data["message"].stringValue, inView: self)
                        self.showAlertMessage(messageStr: data["message"].stringValue) { (btnaction) in
                            self.navigationController?.popViewController(animated: true)
                            self.txtForgotPassword.text = ""
                        }
                    }
                    
                    break
                case.failure(let error):
                    print(error.localizedDescription)
                    break
                }
            }
            
        }

    
    
}
