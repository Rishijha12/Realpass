//
//  ViewController.swift
//  RealPass
//
//  Created by patel chandan on 01/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SkyFloatingLabelTextField
class LoginVc: UIViewController,UITextFieldDelegate,UIGestureRecognizerDelegate,UINavigationControllerDelegate
{
    
    //MARK:- OUTLATE VARIABLE
    
    @IBOutlet weak var imgLock: UIImageView!
    @IBOutlet weak var imgMail: UIImageView!{
        didSet{
            imgMail.tintColor = UIColor.black
        }
    }
    @IBOutlet weak var loginView: UIView!
    {
        didSet
        {
            loginView.layer.cornerRadius = 10
            loginView.backgroundColor = UIColor.kWhiteColur()
        }
    }
    
    @IBOutlet weak var btnLogin: UIButton!
    {
        didSet
        {
            btnLogin.layer.cornerRadius = 12
            btnLogin.backgroundColor = UIColor.kBtnBlueColor()
            //            btnLogin.titleLabel?.font = UIFont.custom(style: .Regular, size: .s20)
            
            btnLogin.titleLabel?.font = .custom(style: .Regular, size: .s20)
            btnLogin.setTitleColor(UIColor.kWhiteColur(), for: .normal)
        }
    }
    
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!{
        didSet{
            txtEmail.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.kPlaceholderColor()])
            txtEmail.placeholder = "Email"
            txtEmail.title = "Email"
            //            txtEmail.titleFont = UIFont.Roboto_regular(fontsize: 9.0)
//            self.txtEmail.text = "jon@gmail.com"
            txtEmail.titleFont = .custom(style: .Regular, size: .s9)
            txtEmail.selectedTitleColor = UIColor.kTextColor()
            txtEmail.selectedLineColor = UIColor.kBtnBlueColor()
            //            txtEmail.font = UIFont.Roboto_regular(fontsize: 16.0)
            txtEmail.font = .custom(style: .Regular, size: .s16)
            txtEmail.textColor = UIColor.kTextColor()
            txtEmail.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var txtPassword: SkyFloatingLabelTextField!{
        didSet{
            txtPassword.attributedPlaceholder = NSAttributedString(string: "password",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.kPlaceholderColor()])
            txtPassword.placeholder = "Password"
            txtPassword.title = "Password"
            //            txtPassword.titleFont = UIFont.Roboto_regular(fontsize: 9.0)
//            self.txtPassword.text = "Jon@2020"
            txtPassword.titleFont = .custom(style: .Regular, size: .s9)
            txtPassword.selectedTitleColor = UIColor.kTextColor()
            txtPassword.selectedLineColor = UIColor.kBtnBlueColor()
            //            txtPassword.font = UIFont.Roboto_regular(fontsize: 16.0)
            txtPassword.font = .custom(style: .Regular, size: .s16)
            txtPassword.textColor = UIColor.kTextColor()
            txtPassword.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var btnFotgotPassword: UIButton!{
        didSet{
            btnFotgotPassword.setTitleColor(UIColor.kTextColor(), for: .normal)
            //            btnFotgotPassword.titleLabel?.font = UIFont.Roboto_regular(fontsize: 12.0)
            btnFotgotPassword.titleLabel?.font = .custom(style: .Regular, size: .s14)
        }
    }
    
    @IBOutlet weak var btnSignUp: UIButton!{
        didSet{
            //            btnSignUp.titleLabel?.font = UIFont.Roboto_Bold(fontsize: 12.0)
            btnSignUp.titleLabel?.font = .custom(style: .Bold, size: .s17)
            btnSignUp.setTitleColor(UIColor.kTextColor(), for: .normal)
        }
    }
    @IBOutlet weak var lblhavenotAccount: UILabel!{
        didSet{
            //            lblhavenotAccount.font = UIFont.Roboto_regular(fontsize: 12.0)
            lblhavenotAccount.font = .custom(style: .Regular, size: .s17)
            lblhavenotAccount.textColor = UIColor.kTextColor()
        }
    }
    
    @IBOutlet weak var lblAgentLogin: UILabel!{
        didSet{
            //            lblAgentLogin.font = UIFont.Roboto_Medium(fontsize: 15.0)
            lblAgentLogin.font = .custom(style: .Medium, size: .s15)
        }
    }
    
    
    //MARK:- LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.delegate = self
        txtPassword.delegate = self
        self.title = "LOGIN"
        
        if let nav = self.navigationController {
            nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
            transparentNav(nav: self.navigationController!)
        }
        
        if userType == 1
        {
            self.view.backgroundColor = UIColor.kAppBgColor()
        }
        else
        {
//            self.view.backgroundColor = UIColor.kYellowColor()
            self.view.backgroundColor = UIColor.kAppBgColor()
            lblAgentLogin.text = "BUYER LOGIN"
            lblAgentLogin.font = .custom(style: .Medium, size: .s15)
//            self.txtEmail.text = "jon@gmail.com"
//            self.txtPassword.text = "Jon@2020"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        txtEmail.text = ""
//        txtPassword.text = ""
        self.lblAgentLogin.isHidden = true
        self.title = "LOGIN"
        self.swipeToPop()
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.setLeftBarButton(.init(image: #imageLiteral(resourceName: "back button"), style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
        self.navigationItem.leftBarButtonItem!.tintColor = .black
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    //MARK:- BTN ACTION
    
    @IBAction func btnForgotPasswordAction(_ sender: UIButton) {
        let nextVc = ForgotPasswordVc.instantiate(fromAppStoryboard: .PreLogin)
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @IBAction func btnloginAction(_ sender: UIButton) {
        self.validateLogin()
        
        
    }
    
    @IBAction func btnSignUpAction(_ sender: UIButton) {
        let nextVc = SignUpVC.instantiate(fromAppStoryboard: .PreLogin)
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @objc func backNavigationAction()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Text field DELEGET METHODS
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == txtEmail
        {
            imgMail.tintColor = UIColor.kBtnBlueColor()
            imgLock.tintColor = UIColor.kTextColor()
        }
        else if textField == txtPassword
        {
            imgMail.tintColor = UIColor.kTextColor()
            imgLock.tintColor = UIColor.kBtnBlueColor()
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        imgMail.tintColor = .black
        imgLock.tintColor = .black
    }
    
    func swipeToPop() {
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer {
            return false
        }
        return true
    }
    
    func validateLogin()
    {
        if txtEmail.text!.isBlank
        {
            showAlertWithFocus(message: Validation.EmailId, txtFeilds: txtEmail, inView: self)
        }
        else if txtEmail.text?.isValidEmail() == false
        {
            showAlertWithFocus(message: Validation.ValidEmailId, txtFeilds: txtEmail, inView: self)
        }
        else if txtPassword.text!.isBlank
        {
            showAlertWithFocus(message: Validation.Password, txtFeilds: txtPassword, inView: self)
        }
        else if txtPassword.text!.isValidPassword() == false
        {
            showAlertWithFocus(message: Validation.validPassword, txtFeilds: txtPassword, inView: self)
        }
        else
        {
            self.APICallSignIn()
           
        }
        
    }
    
    func APICallSignIn()
    {
        var token = ""
        token = UserDefaults.standard.string(forKey: Keys.FCMToken) ?? ""  //(forKeyPath: Keys.FCMToken)
        var params: [String: Any] = [ : ]
        params[RequestKeys.email] = self.txtEmail.text
        params[RequestKeys.password] = self.txtPassword.text
        params[RequestKeys.deviceType] = 1
        params[RequestKeys.usertype] = userType
        if token == ""
        {
            params[RequestKeys.deviceToken] = "realpass"
        }
        else
        {
            params[RequestKeys.deviceToken] = token
        }
        
        
        APIManager.showLoader()
        
        APIManager.shared.callPostApi(url: APIEndpoint.login, parameters: params) { (result) in
            APIManager.hideLoader()
            
            switch result
            {
            case.success(let myresponse):
                
                let data = JSON.init(myresponse)
                
                //                let cc = data as? NSDictionary
                
                if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 ||  data["status"].intValue == 5{
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
                    
                    let mydata = data["data"]
                    let login = UserDataModel.init(dictionary: mydata.dictionaryObject! as NSDictionary)
                    // save dict in userdefault
                    login?.saveDictionary()
                    currentUser = login!
                    
                    print("currentUserdata -> \(currentUser)")
                    
                    APIToken = login?.accessToken ?? ""
                    
                    
                    UserDefaults.standard.set(self.txtPassword.text!, forKey: Keys.password)
                    UserDefaults.standard.set(true, forKey: "isUserLogin")
                    UserDefaults.standard.set(login?.agentId, forKey: Keys.agentId)
                    UserDefaults.standard.set(login?.buyerId, forKey: Keys.buyerId)
                    UserDefaults.standard.set(login?.accessToken, forKey: Keys.accessToken)
                    UserDefaults.standard.set(login?.isProfileSetUp, forKey: Keys.isProfileSetUp)
                    if userType == 1
                    {
                        agentId = login?.agentId ?? 0
                        if UserDefaults.standard.bool(forKey: Keys.isProfileSetUp) == false
                        {
                            
                            let objpro = ProfileVc.instantiate(fromAppStoryboard: .Agent)
                            self.navigationController?.pushViewController(objpro, animated: true)
                        }
                        else
                        {
                            let objagen = AgentHomeVc.instantiate(fromAppStoryboard: .Agent)
                            mybool = false
                            self.navigationController?.pushViewController(objagen, animated: true)
                            
                        }
                    }
                    else
                    {
                        //  sign in buyer
                        arrPrtnr.removeAll()
                        newPrefSubruba.removeAll()
                        reqParameter.removeAll()
                        buyerId = login?.buyerId ?? 0
                        if UserDefaults.standard.bool(forKey: Keys.isProfileSetUp) == false
                        {

                            let objpro = ProfilePersonlaInfoVC.instantiate(fromAppStoryboard: .Buyer)
                            self.navigationController?.pushViewController(objpro, animated: true)
                        }
                        else
                        {
                            let objagen = BuyerHomeVc.instantiate(fromAppStoryboard: .Buyer)
                            mybool = false
                            self.navigationController?.pushViewController(objagen, animated: true)
                            
                        }
                    }
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
}

