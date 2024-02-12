//
//  ChangePasswordVc.swift
//  RealPass
//
//  Created by patel chandan on 10/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import SwiftyJSON
import SkyFloatingLabelTextField

class ChangePasswordVc: UIViewController,UITextFieldDelegate {
    
    //MARK:- OUTLATS
    @IBOutlet weak var changePasswordView: UIView!
    
    @IBOutlet weak var lblChangePassword: UILabel!{
        didSet{
            lblChangePassword.text = "CHANGE PASSWORD"
            lblChangePassword.font = UIFont.custom(style: .Regular, size: .s17)
        }
    }
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var textfieldView: UIView!{
        didSet{
            self.textfieldView.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var txtCurrentPassword: SkyFloatingLabelTextField!{
        didSet{
            txtCurrentPassword.attributedPlaceholder = NSAttributedString(string: "Current Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.kPlaceholderColor()])
            txtCurrentPassword.placeholder = "Current Password"
            txtCurrentPassword.title = "Current Password"
            txtCurrentPassword.titleFont = UIFont.custom(style: .Regular, size: .s9)
            txtCurrentPassword.selectedTitleColor = UIColor.kTextColor()
            txtCurrentPassword.selectedLineColor = UIColor.kBtnBlueColor()
            txtCurrentPassword.font = UIFont.custom(style: .Regular, size: .s16)
            txtCurrentPassword.textColor = UIColor.kTextColor()
            txtCurrentPassword.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var txtNewPassword: SkyFloatingLabelTextField!{
        didSet{
            txtNewPassword.attributedPlaceholder = NSAttributedString(string: "New Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.kPlaceholderColor()])
            txtNewPassword.placeholder = "New Password"
            txtNewPassword.title = "New Password"
            txtNewPassword.titleFont = UIFont.custom(style: .Regular, size: .s9)
            txtNewPassword.selectedTitleColor = UIColor.kTextColor()
            txtNewPassword.selectedLineColor = UIColor.kBtnBlueColor()
            txtNewPassword.font = UIFont.custom(style: .Regular, size: .s16)
            txtNewPassword.textColor = UIColor.kTextColor()
            txtNewPassword.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var txtConformPassword: SkyFloatingLabelTextField!{
        didSet{
            txtConformPassword.attributedPlaceholder = NSAttributedString(string: "Confirm Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.kPlaceholderColor()])
            txtConformPassword.placeholder = "Confirm Password"
            txtConformPassword.title = "Confirm Password"
            txtConformPassword.titleFont = UIFont.custom(style: .Regular, size: .s9)
            txtConformPassword.selectedTitleColor = UIColor.kTextColor()
            txtConformPassword.selectedLineColor = UIColor.kBtnBlueColor()
            txtConformPassword.font = UIFont.custom(style: .Regular, size: .s16)
            txtConformPassword.textColor = UIColor.kTextColor()
            txtConformPassword.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var imgCurentPass: UIImageView!
    @IBOutlet weak var imgNewPass: UIImageView!
    @IBOutlet weak var imgConformPass: UIImageView!
    
    @IBOutlet weak var btnSave: UIButton!{
        didSet{
            btnSave.layer.cornerRadius = 12
            btnSave.backgroundColor = UIColor.kBtnBlueColor()
            btnSave.titleLabel?.font = UIFont.custom(style: .Regular, size: .s20)
            btnSave.setTitleColor(UIColor.kWhiteColur(), for: .normal)
        }
    }
    
    //MARK:- LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCurrentPassword.delegate = self
        txtNewPassword.delegate = self
        txtConformPassword.delegate = self
        self.view.backgroundColor = UIColor.kAppBgColor()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.swipeToPop()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.swipeToPop()
    }
    
    //MARK:- ACTIONS
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func btnSaveAction(_ sender: UIButton) {
        self.validationChangePassword()
    }
    
    //MARK:- FUNCTION
    
    func validationChangePassword()
    {
        let currPw = UserDefaults.standard.object(forKey: Keys.password) as? String ?? ""
        
        if txtCurrentPassword.text!.isBlank
        {
            showAlertWithFocus(message: Validation.CurrentPassword, txtFeilds: txtCurrentPassword, inView: self)
        }
        else if txtCurrentPassword.text?.isValidPassword() == false
        {
            showAlertWithFocus(message: Validation.validPassword, txtFeilds: txtCurrentPassword, inView: self)
        }
        else if currPw != txtCurrentPassword.text!
        {
            showAlertWithFocus(message: Validation.currentPasswordNotMatch, txtFeilds: txtNewPassword, inView: self)
        }
        else if txtNewPassword.text!.isBlank
        {
            showAlertWithFocus(message: Validation.NewPassword, txtFeilds: txtNewPassword, inView: self)
        }
       
        else if txtCurrentPassword.text == txtNewPassword.text
        {
            showAlertWithFocus(message: Validation.CurrentNewPswValidation, txtFeilds: txtNewPassword, inView: self)
        }
        else if txtNewPassword.text?.isValidPassword() == false
        {
            showAlertWithFocus(message: Validation.validPassword, txtFeilds: txtNewPassword, inView: self)
        }
        else if txtConformPassword.text!.isBlank
        {
            showAlertWithFocus(message: Validation.ConfirmPassword, txtFeilds: txtConformPassword, inView: self)
        }
        else if txtConformPassword.text != txtNewPassword.text
        {
            showAlertWithFocus(message: Validation.NewConfirmPasswordNotMatch, txtFeilds: txtConformPassword, inView: self)
        }
        else
        {
//                self.navigationController?.popViewController(animated: true)
            if userType == 1
            {
               self.ChangePasswordApi()
            }
            else
            {
               self.ChangePasswordBuyerApi()
            }
             
        }
    }
    
    //MARK:- TEXTFIELD DELEGET METHOD
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == txtCurrentPassword
        {
            imgCurentPass.tintColor = UIColor.kBtnBlueColor()
        }
        else if textField == txtNewPassword
        {
            imgNewPass.tintColor = UIColor.kBtnBlueColor()
        }
        else if textField == txtConformPassword
        {
            imgConformPass.tintColor = UIColor.kBtnBlueColor()
        }
      
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        imgCurentPass.tintColor = .black
        imgNewPass.tintColor = .black
        imgConformPass.tintColor = .black
    }
    
    func swipeToPop() {

        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
    }
    
    func ChangePasswordApi()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.newPassword] = self.txtNewPassword.text
        params[RequestKeys.id] = agentId
        params[RequestKeys.usertype] = userType
        
        APIManager.showLoader()
        APIManager.shared.callPostApi(url: APIEndpoint.changePassword, parameters: params) { (result) in
        APIManager.hideLoader()
            
            switch result
            {
            case.success(let response):
                
                let data = JSON.init(response)
                
                
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
                    
                    self.showAlertMessage(messageStr: data["message"].stringValue) { (btnchangeclicked) in
                        self.txtNewPassword.text = ""
                        self.txtCurrentPassword.text = ""
                        self.txtConformPassword.text = ""
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                
                UserDefaults.standard.set(self.txtNewPassword.text!, forKey: Keys.password)
                
                break
            case.failure(let error):
                print(error.localizedDescription)
                break
            }
        }
        
    }
    
    func ChangePasswordBuyerApi()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.newPassword] = self.txtNewPassword.text
        params[RequestKeys.id] = buyerId
        params[RequestKeys.usertype] = userType
        
        APIManager.showLoader()
        APIManager.shared.callPostApi(url: APIEndpoint.changePassword, parameters: params) { (result) in
        APIManager.hideLoader()
            
            switch result
            {
            case.success(let response):
                
                let data = JSON.init(response)
                
                
                if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4 || data["status"].intValue == 5{
                    showAlertWith(message: data["message"].stringValue, inView: self)
                }
                else if data["status"].intValue == 1
                {
                    
                    self.showAlertMessage(messageStr: data["message"].stringValue) { (btnchangeclicked) in
                        self.txtNewPassword.text = ""
                        self.txtCurrentPassword.text = ""
                        self.txtConformPassword.text = ""
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                
                UserDefaults.standard.set(self.txtNewPassword.text!, forKey: Keys.password)
                
                break
            case.failure(let error):
                print(error.localizedDescription)
                break
            }
        }
        
    }
}
