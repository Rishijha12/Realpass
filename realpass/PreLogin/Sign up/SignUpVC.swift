//
//  SignUpVC.swift
//  RealPass
//
//  Created by patel chandan on 02/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import SwiftyJSON
import SkyFloatingLabelTextField

class SignUpVC: UIViewController, UITextFieldDelegate {
    
    //MARK:- OUTLATE VARIABLE
    
    @IBOutlet weak var imgLockCp: UIImageView!{
        didSet{
            imgLockCp.tintColor = UIColor.black
        }
    }
    @IBOutlet weak var imgLockp: UIImageView!{
        didSet{
            imgLockp.tintColor = UIColor.black
        }
    }
    @IBOutlet weak var imgMail: UIImageView!{
        didSet{
            imgLockp.tintColor = UIColor.black
        }
    }
    @IBOutlet weak var txtEamil: SkyFloatingLabelTextField!{
        didSet{
            txtEamil.placeholder = "Email"
            txtEamil.title = "Email"
            txtEamil.selectedTitleColor = UIColor.kTextColor()
            txtEamil.selectedLineColor = UIColor.kBtnBlueColor()
            txtEamil.titleFont = .custom(style: .Regular, size: .s9)
            txtEamil.font = .custom(style: .Regular, size: .s15)
            txtEamil.textColor = UIColor.kTextColor()
            txtEamil.titleFormatter = { $0 }
        }
    }
    @IBOutlet weak var txtPassword: SkyFloatingLabelTextField!{
        didSet{
            txtPassword.placeholder = "Password"
            txtPassword.title = "Password"
            txtPassword.selectedTitleColor = UIColor.kTextColor()
            txtPassword.selectedLineColor = UIColor.kBtnBlueColor()
            txtPassword.titleFont = .custom(style: .Regular, size: .s9)
            txtPassword.font = .custom(style: .Regular, size: .s15)
            txtPassword.textColor = UIColor.kTextColor()
            txtPassword.titleFormatter = { $0 }
        }
    }
    @IBOutlet weak var txtConformPassword: SkyFloatingLabelTextField!{
        didSet{
            txtConformPassword.placeholder = "Confirm Password"
            txtConformPassword.title = "Confirm Password"
            txtConformPassword.selectedTitleColor = UIColor.kTextColor()
            txtConformPassword.selectedLineColor = UIColor.kBtnBlueColor()
            txtConformPassword.titleFont = .custom(style: .Regular, size: .s9)
            txtConformPassword.font = .custom(style: .Regular, size: .s15)
            txtConformPassword.textColor = UIColor.kTextColor()
            txtConformPassword.titleFormatter = { $0 }
        }
    }
    @IBOutlet weak var btnSignUp: UIButton!{
        didSet{
            btnSignUp.layer.cornerRadius = 12
            btnSignUp.backgroundColor = UIColor.kBtnBlueColor()
            btnSignUp.titleLabel?.font = .custom(style: .Regular, size: .s20)
            btnSignUp.setTitleColor(UIColor.kWhiteColur(), for: .normal)
        }
    }
    @IBOutlet weak var signUpView: UIView!{
        didSet
        {
            signUpView.layer.cornerRadius = 10
            signUpView.backgroundColor = UIColor.kWhiteColur()
        }
    }
    @IBOutlet weak var btnLogin: UIButton!{
        didSet{
            btnLogin.titleLabel?.font = .custom(style: .Bold, size: .s17)
        }
    }
    
    @IBOutlet weak var lblAgentLogin: UILabel!{
        didSet{
            lblAgentLogin.font = UIFont.custom(style: .Medium, size: .s15)
        }
    }
    @IBOutlet weak var lblHaveAccount: UILabel!{
        didSet{
            lblHaveAccount.font = UIFont.custom(style: .Regular, size: .s17)
            lblHaveAccount.textColor = UIColor.kTextColor()
        }
    }
    
    //MARK:- LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEamil.delegate = self
        txtPassword.delegate = self
        txtConformPassword.delegate = self
        self.title = "SIGN UP"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        self.view.backgroundColor = UIColor.kAppBgColor()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.swipeToPop()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.lblAgentLogin.isHidden = true
    }
    
    //MARK:- BTN ACTION
    
    @IBAction func btnSignUpAction(_ sender: UIButton) {
        self.validatioSignUp()
    }
    
    @IBAction func btnLoginAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Text field DELEGET METHODS
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if txtEamil.isEditing == true
        {
            imgMail.tintColor = UIColor.kBtnBlueColor()
        }
        else if txtPassword.isEditing == true
        {
            imgLockp.tintColor = UIColor.kBtnBlueColor()
        }
        else
        {
            imgLockCp.tintColor = UIColor.kBtnBlueColor()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        imgMail.tintColor = UIColor.kTextColor()
        imgLockp.tintColor = UIColor.kTextColor()
        imgLockCp.tintColor = UIColor.kTextColor()
    }
    
    func swipeToPop() {
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
    }
    
    //MARK:- FUNCTION
    
    func validatioSignUp(){

        if self.txtEamil.text!.isBlank
        {
            showAlertWithFocus(message: Validation.EmailId, txtFeilds: self.txtEamil, inView: self)
        }
        else if (self.txtEamil.text?.isValidEmail() == false)
        {
            showAlertWithFocus(message: Validation.ValidEmailId, txtFeilds: self.txtEamil, inView: self)
        }
        else if self.txtPassword.text!.isBlank
        {
            showAlertWithFocus(message: Validation.Password, txtFeilds: self.txtPassword, inView: self)
        }
        else if self.txtPassword.text!.containsEmoji
        {
            showAlertWithFocus(message: Validation.passwordEmoji, txtFeilds: self.txtPassword, inView: self)
        }
        else if (self.txtPassword.text?.isValidPassword() == false)
        {
            showAlertWithFocus(message: Validation.validPassword, txtFeilds: self.txtPassword, inView: self)
        }
        else if self.txtConformPassword.text!.isBlank
        {
            showAlertWithFocus(message: Validation.ConfirmPassword, txtFeilds: self.txtConformPassword, inView: self)
        }
        else if self.txtConformPassword.text != self.txtPassword.text
        {
            showAlertWithFocus(message: Validation.PasswordConfirmPswNotMatch, txtFeilds: self.txtConformPassword, inView: self)
        }
        else
        {
            // Agent Signup
            if userType == 1 {
                self.APICallAgentSignUp()
            }
            // Buyer Signup
            else if userType == 2{
                self.apiCallBuyerSignup()
            }
        }
    }
    
    func APICallAgentSignUp()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.email] = self.txtEamil.text
        params[RequestKeys.password] = self.txtPassword.text
        params[RequestKeys.deviceType] = 1
        params[RequestKeys.deviceToken] = "strFCMToken"
        
        APIManager.showLoader()
        APIManager.shared.callPostApi(url: APIEndpoint.signUpAgent, parameters: params) { (result) in
        APIManager.hideLoader()
            switch result
            {
                
            case.success(let myresponse):
 
                let data = JSON.init(myresponse)
                
                if data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4{
                    //goToBase(message: data["message"].stringValue)
                    showAlertWith(message: data["message"].stringValue, inView: self)
                }
                else if data["status"].intValue == 5
                {
                    showAlertWith(message: data["message"].stringValue, inView: self)
                }
                else {
                    if data["status"].intValue == 0 {
                        showAlertWith(message: data["message"].stringValue, inView: self)
                    }
                    else if data["status"].intValue == 1 {
                        
                        self.txtEamil.text = ""
                        self.txtPassword.text = ""
                        self.txtConformPassword.text = ""
                        
                        let mydata = data["data"]
                        let login = UserDataModel.init(dictionary: mydata.dictionaryObject! as NSDictionary)
                        
                        APIToken = login?.accessToken ?? ""
                        
                        login?.saveDictionary()
                        currentUser = login!
                        
                        UserDefaults.standard.set(self.txtPassword.text!, forKey: Keys.password)
                        UserDefaults.standard.set(true, forKey: "isUserLogin")
                        UserDefaults.standard.set(login?.agentId, forKey: Keys.agentId)
                        UserDefaults.standard.set(login?.accessToken, forKey: Keys.accessToken)
                        UserDefaults.standard.set(login?.isProfileSetUp, forKey: Keys.isProfileSetUp)
                        
                            agentId = login?.agentId ?? 0
                            if UserDefaults.standard.bool(forKey: Keys.isProfileSetUp) == false
                            {
                                
                                let objpro = ProfileVc.instantiate(fromAppStoryboard: .Agent)
                                self.navigationController?.pushViewController(objpro, animated: true)
                            }
                            else
                            {
                               
                                let objagen = AgentHomeVc.instantiate(fromAppStoryboard: .Agent)
                                self.navigationController?.pushViewController(objagen, animated: true)
                            }
                      }
                }
                break
            case.failure:
                break
            }
        }
    }
    
    func apiCallBuyerSignup()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.email] = self.txtEamil.text
        params[RequestKeys.password] = self.txtPassword.text
        params[RequestKeys.deviceType] = 1
        params[RequestKeys.deviceToken] = "strFCMToken"
        
        APIManager.showLoader()
        APIManager.shared.callPostApi(url: APIEndpoint.SignupBuyer, parameters: params) { (result) in
            APIManager.hideLoader()
            switch result
            {
            case.success(let myresponse):
                let data = JSON.init(myresponse)
                if data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4
                {
                    showAlertWith(message: data["message"].stringValue, inView: self)
                }
                else if data["status"].intValue == 5{
                    showAlertWith(message: data["message"].stringValue, inView: self)
                }
                else
                {
                    if data["status"].intValue == 0 {
                        showAlertWith(message: data["message"].stringValue, inView: self)
                    }
                    else if data["status"].intValue == 1 {
                        
                        self.txtEamil.text = ""
                        self.txtPassword.text = ""
                        self.txtConformPassword.text = ""
                        let mydata = data["data"]
                        print("Signup Data : \(mydata)")
                        // Convert UserDataModel to Dictionary
                        let signup = UserDataModel.init(dictionary: mydata.dictionaryObject! as NSDictionary)
                        APIToken = signup?.accessToken ?? ""
                        // Save Dictionary
                        signup?.saveDictionary()
                        currentUser = signup!
                        UserDefaults.standard.set(self.txtPassword.text!, forKey: Keys.password)
                        UserDefaults.standard.set(true, forKey: "isUserLogin")
                        UserDefaults.standard.set(signup?.buyerId, forKey: Keys.buyerId)
                        UserDefaults.standard.set(signup?.accessToken, forKey: Keys.accessToken)
                        UserDefaults.standard.set(signup?.isProfileSetUp, forKey: Keys.isProfileSetUp)
                        //  sign in buyer
                        buyerId = signup?.buyerId ?? 0
                        arrPrtnr.removeAll()
                        newPrefSubruba.removeAll()
                        reqParameter.removeAll()
                        if UserDefaults.standard.bool(forKey: Keys.isProfileSetUp) == false
                        {
                            
                            let objSetupProfile = ProfilePersonlaInfoVC.instantiate(fromAppStoryboard: .Buyer)
                            //                                objSetupProfile.txtEmail.text = UserDefaults.standard.string(forKey: Keys.buyerId)
                            self.navigationController?.pushViewController(objSetupProfile, animated: true)
                        }
                        //                                objSetupProfile.txtEmail.text = UserDefaults.standard.string(forKey: Keys.buyerId)
                        
                        else{
                            let objHome = BuyerHomeVc.instantiate(fromAppStoryboard: .Buyer)
                            self.navigationController?.pushViewController(objHome, animated: true)
                        }
                    }
                    
                }
                break
            case.failure:
                break
            }
        }
    }
    
    
}
