//
//  ProfileVc.swift
//  RealPass
//
//  Created by patel chandan on 04/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import SwiftyJSON
import Alamofire
import SVProgressHUD
import SDWebImage

class ProfileVc: UIViewController,UITextFieldDelegate {
    
    //MARK:- OUTLATS
    
    @IBOutlet weak var lblSTDCode: UILabel!{
        didSet{
            lblSTDCode.font = UIFont.custom(style: .Regular, size: .s16)
            lblSTDCode.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet weak var imgProfile: UIImageView!{
        didSet{
            imgProfile.layer.masksToBounds = false
            imgProfile.layer.cornerRadius = ScreenSize.SCREEN_WIDTH*0.25/2
            imgProfile.clipsToBounds = true
        }
    }
    @IBOutlet weak var lblTapChangeImage: UILabel!{
        didSet{
            lblTapChangeImage.font = UIFont.custom(style: .Medium, size: .s10)
            lblTapChangeImage.textColor = UIColor.kPlaceholder2Color()
        }
    }
    
    @IBOutlet weak var profileView: UIView!{
        didSet{
            profileView.layer.cornerRadius = 10
            profileView.backgroundColor = UIColor.kWhiteColur()
        }
    }
    
    @IBOutlet weak var txtFirstName: SkyFloatingLabelTextField!{
        didSet{
            txtFirstName.titleFormatter = { $0 }
            txtFirstName.placeholder = "First Name"
            txtFirstName.title = "First Name"
            txtFirstName.placeholderFont = UIFont.custom(style: .Regular, size: .s10)
            txtFirstName.titleFont = UIFont.custom(style: .Regular, size: .s10)
            txtFirstName.selectedTitleColor = UIColor.kTextColor()
            txtFirstName.selectedLineColor = UIColor.kBtnBlueColor()
            txtFirstName.font = UIFont.custom(style: .Regular, size: .s16)
            txtFirstName.textColor = UIColor.kTextColor()
            self.txtFirstName.autocapitalizationType = .words
        }
    }
    
    @IBOutlet weak var txtLastName: SkyFloatingLabelTextField!{
        didSet{
            txtLastName.placeholder = "Last Name"
            txtLastName.title = "Last Name"
            txtLastName.placeholderFont = UIFont.custom(style: .Regular, size: .s10)
            txtLastName.titleFont = UIFont.custom(style: .Regular, size: .s10)
            txtLastName.selectedTitleColor = UIColor.kTextColor()
            txtLastName.selectedLineColor = UIColor.kBtnBlueColor()
            txtLastName.font = UIFont.custom(style: .Regular, size: .s16)
            txtLastName.textColor = UIColor.kTextColor()
            txtLastName.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var txtAgency: SkyFloatingLabelTextField!{
        didSet{
            txtAgency.placeholder = "Agency"
            txtAgency.title = "Agency"
            txtAgency.placeholderFont = UIFont.custom(style: .Regular, size: .s10)
            txtAgency.titleFont = UIFont.custom(style: .Regular, size: .s10)
            txtAgency.selectedTitleColor = UIColor.kTextColor()
            txtAgency.selectedLineColor = UIColor.kBtnBlueColor()
            txtAgency.font = UIFont.custom(style: .Regular, size: .s16)
            txtAgency.textColor = UIColor.kTextColor()
            txtAgency.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var txtMobile: SkyFloatingLabelTextField!{
        didSet{
            txtMobile.placeholder = "Mobile"
            txtMobile.title = "Mobile"
            txtMobile.placeholderFont = UIFont.custom(style: .Regular, size: .s10)
            txtMobile.titleFont = UIFont.custom(style: .Regular, size: .s10)
            txtMobile.selectedTitleColor = UIColor.kTextColor()
            txtMobile.selectedLineColor = UIColor.kBtnBlueColor()
            txtMobile.font = UIFont.custom(style: .Regular, size: .s16)
            txtMobile.textColor = UIColor.kTextColor()
            txtMobile.titleFormatter = { $0 }
//            txtMobile.setLeftPaddingPoints(35)
        }
    }
    
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!{
        didSet{
            txtEmail.placeholder = "Email"
            txtEmail.title = "Email"
            txtEmail.placeholderFont = UIFont.custom(style: .Regular, size: .s10)
            txtEmail.titleFont = UIFont.custom(style: .Regular, size: .s10)
            txtEmail.selectedTitleColor = UIColor.kTextColor()
            txtEmail.selectedLineColor = UIColor.kBtnBlueColor()
            txtEmail.font = UIFont.custom(style: .Regular, size: .s16)
            txtEmail.textColor = UIColor.kTextColor()
            txtEmail.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var btnSave: UIButton!{
        didSet{
            btnSave.layer.cornerRadius = 12
            btnSave.backgroundColor = UIColor.kBtnBlueColor()
            btnSave.titleLabel?.font = UIFont.custom(style: .Regular, size: .s20)
            btnSave.setTitleColor(UIColor.kWhiteColur(), for: .normal)
        }
    }
    
    //MARK:- VARIABLE
    
    //    var imag = UIImagePickerController()
    var imagePicker: ImagePicker!
    var isFromeEdite:Bool = false
    var isProfilePicSelected = false
    var titleFormatter: ((String) -> String) = { (text: String) -> String in
        return text.first?.uppercased() ?? ""
        return text.localizedLowercase
    }
    var number = ""
    var isEditProfile = false
    
    //MARK:- LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtMobile.delegate = self
        self.title = "AGENT PROFILE"
        self.setData()
        if isEditProfile == true
        {
            self.lblSTDCode.isHidden = false
        }
        else
        {
            self.lblSTDCode.isHidden = true
        }

        
        if let nav = self.navigationController {
            nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
            transparentNav(nav: self.navigationController!)
        }
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        //        imag.delegate = self
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        self.view.backgroundColor = UIColor.kAppBgColor()
        
        if isEditProfile == true
        {
            btnSave.layer.cornerRadius = 12
            btnSave.backgroundColor = UIColor.kBtnBlueColor()
            btnSave.setTitle("Update", for: .normal)
            btnSave.titleLabel?.font = UIFont.custom(style: .Regular, size: .s20)
            btnSave.setTitleColor(UIColor.kWhiteColur(), for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
                self.setData()
        
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = "AGENT PROFILE"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        
        if isFromeEdite == true
        {
            self.title = "MY PROFILE"
            self.navigationItem.setLeftBarButton(.init(image: #imageLiteral(resourceName: "back button"), style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
            self.navigationItem.leftBarButtonItem!.tintColor = .black
            
            self.swipeToPop()
        }
        
    }
    func setData()
    {
        self.txtLastName.text = currentUser.lastName ?? ""
        self.txtFirstName.text = currentUser.firstName ?? ""
        self.txtAgency.text = currentUser.agency ?? ""
        self.txtEmail.text = currentUser.email ?? ""
        self.txtEmail.isUserInteractionEnabled = false
        
        let setMobile = currentUser.mobile
        let num = isRemoveFormatedText(strText: setMobile)
        if isEditProfile == true
        {
            //self.txtMobile.text = setMobile //"+\(61 ) \(setMobile?.formateMobileNumber() ?? "")"
//                       self.lblSTDCode.isHidden = false
//                       self.txtMobile.text = num
                       self.txtMobile.text = (num.formateMobileNumber() )
        }
        
                if let strMobile = currentUser.mobile, strMobile.count > 0{
//                    self.txtMobile.text = (strMobile.formateMobileNumber() )
                            self.lblSTDCode.isHidden = false
                    self.txtMobile.setLeftPaddingPoints(30)
                        }
        
        
        
        
        let urllink = currentUser.profilePic
        if urllink == nil
        {
            self.imgProfile.image = UIImage(named: "user")
        }
        else
        {
            self.imgProfile.sd_setImage(with: URL(string: urllink ?? ""), placeholderImage: UIImage(named: "user"))
        }
        
        
    }
    
    //MARK:- ACTIONS
    @IBAction func btnAlertOnImage(_ sender: Any) {
        self.imagePicker.present(from: sender as! UIView)
    }
    
    @objc func backNavigationAction()
    {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func btnSaveAction(_ sender: UIButton) {
        self.validationProfile()
    }
    
    //MARK:- FUNTION
    
    func swipeToPop() {
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
    }
    
    func validationProfile()
    {
        number = isRemoveFormatedText(strText: self.txtMobile.text)
        if txtFirstName.text!.isBlank
        {
            showAlertWithFocus(message: Validation.FirstName, txtFeilds: txtFirstName, inView: self)
        }
        else if (txtFirstName.text!.count < 3) || (txtFirstName.text!.count > 20)
        {
            showAlertWithFocus(message: "First name should have at least 3 characters", txtFeilds: txtFirstName, inView: self)
        }
        else if txtFirstName.text!.isValidName() == false
        {
            showAlertWithFocus(message: Validation.FirstNameNumeric, txtFeilds: txtFirstName, inView: self)
        }
        else if txtFirstName.text!.isValidSpaceName() == false
        {
            showAlertWithFocus(message: Validation.FirstNameSpace, txtFeilds: txtFirstName, inView: self)
        }
        else if txtLastName.text!.isBlank
        {
            showAlertWithFocus(message: Validation.LastName, txtFeilds: txtLastName, inView: self)
        }
        else if (txtLastName.text!.count < 3) || (txtLastName.text!.count > 20)
        {
            showAlertWithFocus(message: "Last name should have at least 3 characters", txtFeilds: txtLastName, inView: self)
        }
        else if txtLastName.text!.isValidName() == false
        {
            showAlertWithFocus(message: Validation.LastNameNumeric, txtFeilds: txtLastName, inView: self)
        }
        else if txtLastName.text!.isValidSpaceName() == false
        {
            showAlertWithFocus(message: Validation.LastNameSpace, txtFeilds: txtLastName, inView: self)
        }
        else if txtAgency.text!.isBlank
        {
            showAlertWithFocus(message: Validation.AgencyName, txtFeilds: txtAgency, inView: self)
        }
        else if txtAgency.text!.count < 3
        {
            showAlertWithFocus(message: Validation.AgencyValidName, txtFeilds: txtAgency, inView: self)
        }
        else if txtMobile.text!.isBlank
        {
            showAlertWithFocus(message: Validation.Phone, txtFeilds: txtMobile, inView: self)
        }
        else if number.count < 10
        {
            showAlertWithFocus(message: Validation.phoneNumberLength, txtFeilds: txtMobile, inView: self)
        }
        else if number.isValidPhone() == false
        {
            showAlertWithFocus(message: Validation.PhoneValid, txtFeilds: txtMobile, inView: self)
        }
        else if txtEmail.text!.isBlank
        {
            showAlertWithFocus(message: Validation.EmailId, txtFeilds: txtEmail, inView: self)
        }
        else if txtEmail.text!.isValidEmail() == false
        {
            showAlertWithFocus(message: Validation.ValidEmailId, txtFeilds: txtEmail, inView: self)
        }
        else
        {
            if isEditProfile == true
            {
                self.editAgentProfileApi()
            }
            else
            {
                self.setUpAgentProfileApi()
            }
        }
    }
    
    func setUpAgentProfileApi()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.accessToken] = APIToken
        params[RequestKeys.agentId] = "\(agentId)"
        params[RequestKeys.agency] = self.txtAgency.text
        params[RequestKeys.firstName] = self.txtFirstName.text
        params[RequestKeys.lastName] = self.txtLastName.text
        params[RequestKeys.mobile] = "\("+61 ")\(self.txtMobile.text!)"
        
        if self.isProfilePicSelected
        {
            params[RequestKeys.profilePic] = self.imgProfile.image
        }
        
        var headers: HTTPHeaders!
        
        if APIToken == "" {
            headers = [
                "Content-type": "multipart/form-data"
            ]
        } else {
            headers = [
                "Content-type": "multipart/form-data",
                "accessToken": APIToken
            ]
        }
        DispatchQueue.main.async(execute: {
            
            APIManager.showLoader()
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                
                for (key,value) in params
                {
                    if value is String
                    {
                        multipartFormData.append(((value as Any) as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
                    else if value is Int
                    {
                        multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                    }
                    else if value is UIImage
                    {
                        var imageData :Data = Data()
                        
                        let imgProfile = value as? UIImage
                        imageData = imgProfile!.jpegData(compressionQuality: 0.75)!
                        
                        multipartFormData.append(imageData, withName: "profilePic", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
                    }
                }
                
                
            }, to: APIEndpoint.setUpAgentProfile,method: .post,headers: headers)
            { (result) in
                
                switch result
                {
                case .success(let upload,_, _):
                    
                    upload.uploadProgress(closure:
                                            { (Progress) in
                                                print("Upload Progress: \(Progress.fractionCompleted)")
                                            })
                    upload.responseJSON
                    { response in
                        
                        APIManager.hideLoader()
                        
                        if let JSONh = response.result.value
                        {
                            print("******api all sucessfully")
                            let data = JSON.init(JSONh)
                            
                            if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4 || data["status"].intValue == 5{
                                showAlertWith(message: data["message"].stringValue, inView: self)
                            }
//                            else if data["status"].intValue == 4
//                            {
//                                showAlertWith(message: data["message"].stringValue, inView: self)
//
//                                UserDefaults.standard.removeObject(forKey: Keys.userType)
//                                UserDefaults.standard.removeObject(forKey: Keys.accessToken)
//                                UserDefaults.standard.removeObject(forKey: Keys.isProfileSetUp)
//                                UserDefaults.standard.removeObject(forKey: Keys.agentId)
//                                UserDefaults.standard.removeObject(forKey: Keys.currentUserData)
//                                UserDefaults.standard.removeObject(forKey: "isUserLogin")
//                                UserDefaults.standard.removeObject(forKey: Keys.password)
//
//                                if let viewControllers = self.navigationController?.viewControllers{
//                                    for controller in viewControllers{
//                                        if controller is UserSelectionVC{
//                                            self.navigationController?.popToRootViewController(animated: true)
//                                            return
//                                        }
//                                    }
//                                }
//
//                                let storyboard = UIStoryboard.init(name: "PreLogin", bundle: nil)
//                                appdelegate.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "userSelection")
//                                appdelegate.window?.makeKeyAndVisible()
//
//                            }
                            else if data["status"].intValue == 1
                            {
                                let mydata = data["data"]
                                
                                let login = UserDataModel.init(dictionary: mydata.dictionaryObject! as NSDictionary)
                                // save dict in userdefault
                                login?.saveDictionary()
                                currentUser = login!
                                
                                UserDefaults.standard.setValue(login?.isProfileSetUp, forKey: Keys.isProfileSetUp)
                                
                                let nextVc = AgentHomeVc.instantiate(fromAppStoryboard: .Agent)
                                self.navigationController?.pushViewController(nextVc, animated: true)
                            }
                        }
                        DispatchQueue.main.async
                        {
                            SVProgressHUD.dismiss()
                        }
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
            }
        })
    }
    
    func editAgentProfileApi()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.accessToken] = APIToken
        params[RequestKeys.agentId] = "\(agentId)"
        params[RequestKeys.agency] = self.txtAgency.text
        params[RequestKeys.firstName] = self.txtFirstName.text
        params[RequestKeys.lastName] = self.txtLastName.text
        params[RequestKeys.mobile] = "\("+61 ")\(self.txtMobile.text!)"
        
        if self.isProfilePicSelected
        {
            params[RequestKeys.profilePic] = self.imgProfile.image
        }
        
        var headers: HTTPHeaders!
        
        if APIToken == "" {
            headers = [
                "Content-type": "multipart/form-data"
            ]
        } else {
            headers = [
                "Content-type": "multipart/form-data",
                "accessToken": APIToken
            ]
        }
        DispatchQueue.main.async(execute: {
            
            APIManager.showLoader()
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                
                for (key,value) in params
                {
                    if value is String
                    {
                        multipartFormData.append(((value as Any) as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
                    else if value is Int
                    {
                        multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                    }
                    else if value is UIImage
                    {
                        var imageData :Data = Data()
                        
                        let imgProfile = value as? UIImage
                        imageData = imgProfile!.jpegData(compressionQuality: 0.75)!
                        
                        multipartFormData.append(imageData, withName: "profilePic", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
                    }
                }
                
                
            }, to: APIEndpoint.editAgentProfile,method: .post,headers: headers)
            { (result) in
                
                switch result
                {
                case .success(let upload,_, _):
                    
                    upload.uploadProgress(closure:
                                            { (Progress) in
                                                print("Upload Progress: \(Progress.fractionCompleted)")
                                            })
                    upload.responseJSON
                    { response in
                        APIManager.hideLoader()
                        if let JSONh = response.result.value
                        {
                            print("******api all sucessfully")
                            let data = JSON.init(JSONh)
                            
                            if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4 || data["status"].intValue == 5{
                                showAlertWith(message: data["message"].stringValue, inView: self)
                            }
//                            else if data["status"].intValue == 4
//                            {
//                                let alert = UIAlertController(title: APP_NAME, message: data["message"].stringValue, preferredStyle: .alert)
//                                let Yes = UIAlertAction(title: "OK", style: .destructive)
//                                { (btnOkAction) in
//
//                                    goToBase(message: data["message"].stringValue)
//                                }
//
//                                alert.addAction(Yes)
//
//                                self.present(alert, animated: true, completion: nil)
//
//                            }
                            else if data["status"].intValue == 1
                            {
                                let mydata = data["data"]
                                
                                let login = UserDataModel.init(dictionary: mydata.dictionaryObject! as NSDictionary)
                                // save dict in userdefault
                                login?.saveDictionary()
                                currentUser = login!
                                
                                self.showAlertMessage(messageStr: data["message"].stringValue) { (donebtnclicked) in
                                    self.navigationController?.popViewController(animated: true)
                                }
                            }
                        }
                        DispatchQueue.main.async
                        {
                            SVProgressHUD.dismiss()
                        }
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
            }
        })
        
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        //        self.txtMobile.text = "+61 " + self.txtMobile.text!
//        self.lblSTDCode.isHidden =  false
////        if self.txtMobile.text?.count == 0
////        {
////            self.txtMobile.text = "+61 "
////        }
//    }

//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if self.txtMobile.text?.count == 0
//        {
////            self.txtMobile.text = ""
//            self.lblSTDCode.isHidden =  true
//        }
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if(txtMobile.isEditing) {
            if string.count != 0 {
                if (textField.text?.count ?? 0) <= 21 {
                    if (textField.text?.count ?? 0) == 4 {
                        let tempStr = "\(textField.text ?? "") "
                        textField.text = tempStr
                    } else if (textField.text?.count ?? 0) == 8 {
                        let tempStr = "\(textField.text ?? "") "
                        textField.text = tempStr
                    }
                    else if (textField.text?.count ?? 0) == 12 {
                        let tempStr = "\(textField.text ?? "") "
                        textField.text = tempStr
                    }
                } else {
                    return false
                }
            }
//            if self.txtMobile.text == "+61 " && string.count == 0 {
//                return false
//            }
            
                        let newLength = textField.text!.count + (string.count - range.length)
                                    if newLength > 0 {
                                        self.txtMobile.setLeftPaddingPoints(30)
                                        self.lblSTDCode.isHidden = false
                                    }
                                    else{
                                        self.txtMobile.removeLeftPaddingPoints()
                                        self.lblSTDCode.isHidden = true
                                    }
            
        }
        return true
    }
    
    
    
}
extension ProfileVc: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        self.imgProfile.image = image
        self.isProfilePicSelected = true
    }
}

