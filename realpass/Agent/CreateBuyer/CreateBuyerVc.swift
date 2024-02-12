//
//  CreateBuyerVc.swift
//  RealPass
//
//  Created by patel chandan on 12/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import SwiftyJSON
import Alamofire
import SVProgressHUD

class CreateBuyerVc: UIViewController,UITextFieldDelegate,PassArrIndDelegate {
    
    //MARK:- OUTLATS
    @IBOutlet weak var lblSTDCode: UILabel!{
        didSet{
            lblSTDCode.font = UIFont.custom(style: .Regular, size: .s14)
            lblSTDCode.textColor = UIColor.kTextColor()
        }
    }
    
    @IBOutlet weak var img: UIImageView!{
        didSet{
            img.layer.masksToBounds = false
            img.layer.cornerRadius = ScreenSize.SCREEN_WIDTH * 0.25 / 2
            //            img.layer.cornerRadius = img.frame.size.width/2
            img.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var lblTaptoChange: UILabel!{
        didSet{
            lblTaptoChange.font = UIFont.custom(style: .Medium, size: .s10)
            lblTaptoChange.textColor = UIColor.kPlaceholder2Color()
        }
    }
    
    @IBOutlet weak var createBuyerView: UIView!{
        didSet{
            createBuyerView.layer.cornerRadius = 10
            createBuyerView.backgroundColor = UIColor.kWhiteColur()
        }
    }
    
    @IBOutlet weak var txtFirstName: SkyFloatingLabelTextField!{
        didSet{
            txtFirstName.placeholder = "First Name"
            txtFirstName.title = "First Name"
            txtFirstName.placeholderFont = UIFont.custom(style: .Regular, size: .s10)
            txtFirstName.titleFont = UIFont.custom(style: .Regular, size: .s9)
            txtFirstName.selectedTitleColor = UIColor.kTextColor()
            txtFirstName.selectedLineColor = UIColor.kBtnBlueColor()
            txtFirstName.font = UIFont.custom(style: .Regular, size: .s14)
            txtFirstName.textColor = UIColor.kTextColor()
            txtFirstName.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var txtLastname: SkyFloatingLabelTextField!{
        didSet{
            txtLastname.placeholder = "Last Name"
            txtLastname.title = "Last Name"
            txtLastname.placeholderFont = UIFont.custom(style: .Regular, size: .s10)
            txtLastname.titleFont = UIFont.custom(style: .Regular, size: .s9)
            txtLastname.selectedTitleColor = UIColor.kTextColor()
            txtLastname.selectedLineColor = UIColor.kBtnBlueColor()
            txtLastname.font = UIFont.custom(style: .Regular, size: .s14)
            txtLastname.textColor = UIColor.kTextColor()
            txtLastname.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var txtMobile: SkyFloatingLabelTextField!{
        didSet{
            txtMobile.placeholder = "Mobile"
            txtMobile.title = "Mobile"
            txtMobile.placeholderFont = UIFont.custom(style: .Regular, size: .s10)
            txtMobile.titleFont = UIFont.custom(style: .Regular, size: .s9)
            txtMobile.selectedTitleColor = UIColor.kTextColor()
            txtMobile.selectedLineColor = UIColor.kBtnBlueColor()
            txtMobile.font = UIFont.custom(style: .Regular, size: .s14)
            txtMobile.textColor = UIColor.kTextColor()
            txtMobile.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!{
        didSet{
            txtEmail.placeholder = "Email"
            txtEmail.title = "Email"
            txtEmail.placeholderFont = UIFont.custom(style: .Regular, size: .s10)
            txtEmail.titleFont = UIFont.custom(style: .Regular, size: .s9)
            txtEmail.selectedTitleColor = UIColor.kTextColor()
            txtEmail.selectedLineColor = UIColor.kBtnBlueColor()
            txtEmail.font = UIFont.custom(style: .Regular, size: .s14)
            txtEmail.textColor = UIColor.kTextColor()
            txtEmail.titleFormatter = { $0 }
        }
    }
    
    @IBOutlet weak var btnCreateProfile: UIButton!{
        didSet{
            btnCreateProfile.setTitle("Create Buyer Profile", for: .normal)
            btnCreateProfile.layer.cornerRadius = 12
            btnCreateProfile.backgroundColor = UIColor.kBtnBlueColor()
            btnCreateProfile.titleLabel?.font = UIFont.custom(style: .Regular, size: .s20)
            
            btnCreateProfile.setTitleColor(UIColor.kWhiteColur(), for: .normal)
        }
    }
    
    @IBOutlet weak var btnLinkProperties: UIButton!{
        didSet{
            btnLinkProperties.setTitle("Link Properties", for: .normal)
            btnLinkProperties.layer.cornerRadius = 12
            btnLinkProperties.backgroundColor = UIColor.kYellowColor()
            btnLinkProperties.titleLabel?.font = UIFont.custom(style: .Regular, size: .s20)
            
            btnLinkProperties.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    //MARK:- VARIABLE DECLARATION
    
    var imagePickerBuyer: ImagePicker!
    var number = ""
    var isProfilePicSelected = false
    var arrPropertyIndex = [Int]()
    var arrPropertyId = [Int]()
    
    //MARK:- LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblSTDCode.isHidden = true
        self.txtMobile.delegate = self
        self.view.backgroundColor = UIColor.kAppBgColor()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.title = "BUYER PROFILE"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        self.navigationItem.setLeftBarButton(.init(image: #imageLiteral(resourceName: "back button"), style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
        self.navigationItem.leftBarButtonItem!.tintColor = .black
        
        self.imagePickerBuyer = ImagePicker(presentationController: self, delegate: self)
        
        self.swipeToPop()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "BUYER PROFILE"
        if arrpropertyInd.count > 0{
            self.btnLinkProperties.setTitle("Link Properties (\(arrpropertyInd.count)"+")", for: .normal)
        }else{
            self.btnLinkProperties.setTitle("Link Properties", for: .normal)
        }
            
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        self.navigationItem.setLeftBarButton(.init(image: #imageLiteral(resourceName: "back button"), style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
        self.navigationItem.leftBarButtonItem!.tintColor = .black
        self.swipeToPop()
    }
    
    //MARK:- ACTIONS
    
    
    @IBAction func btnImagePickerAction(_ sender: UIButton) {
        self.imagePickerBuyer.present(from: sender as UIView)
        
    }
    
    @objc func backNavigationAction()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnCreateProfileAction(_ sender: UIButton) {
        self.validationCreateBuyer()
//        print(self.arrPropertyId)
    }
    
    @IBAction func btnClickLinkProperties(_ sender: UIButton) {
        isFromHome = false
        let myPropertyVC = MyPropertyListVC.instantiate(fromAppStoryboard: .Agent)
        myPropertyVC.delegate = self
        myPropertyVC.arrPropetyId = self.arrPropertyId
        self.navigationController?.pushViewController(myPropertyVC, animated: true)
    }
    
}

extension CreateBuyerVc: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        self.img.image = image
        self.isProfilePicSelected = true
    }
    
    
    //MARK:- FUNCTION
    
    func swipeToPop() {
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
    }
    
    
    func validationCreateBuyer()
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
        else if txtLastname.text!.isBlank
        {
            showAlertWithFocus(message: Validation.LastName, txtFeilds: txtLastname, inView: self)
        }
        else if (txtLastname.text!.count < 3) || (txtLastname.text!.count > 20)
        {
            showAlertWithFocus(message: "Last name should have at least 3 characters", txtFeilds: txtLastname, inView: self)
        }
        else if txtLastname.text!.isValidName() == false
        {
            showAlertWithFocus(message: Validation.LastNameNumeric, txtFeilds: txtLastname, inView: self)
        }
        else if txtLastname.text!.isValidSpaceName() == false
        {
            showAlertWithFocus(message: Validation.LastNameSpace, txtFeilds: txtLastname, inView: self)
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
            
            self.CreateBuyerApi()
        }
    }
    
    
    
    func CreateBuyerApi()
    {
        arrpropertyInd.removeAll()
        if isBackClick == true{
            self.arrPropertyId.removeAll()
        }
        var params: [String: Any] = [ : ]
        params[RequestKeys.email] = self.txtEmail.text
        params[RequestKeys.agentId] = agentId
        params[RequestKeys.firstName] = self.txtFirstName.text
        params[RequestKeys.lastName] = self.txtLastname.text
        params[RequestKeys.mobile] = "\("+61 ")\(self.txtMobile.text!)"
        params[RequestKeys.accessToken] = APIToken
        params["propertyList"] = self.arrPropertyId
        params[RequestKeys.isScan] = 0
        print("Parms = \(params)")
        if self.isProfilePicSelected
        {
            params[RequestKeys.profilePic] = self.img.image
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
                    }else if key == "propertyList"{
                        let tmg = try! JSONSerialization.data(withJSONObject:value, options: [])
                        multipartFormData.append(tmg, withName: key)
                    }
                    else if value is UIImage
                    {
                        var imageData :Data = Data()
                        
                        let imgProfile = value as? UIImage
                        imageData = imgProfile!.jpegData(compressionQuality: 0.75)!
                        
                        multipartFormData.append(imageData, withName: "profilePic", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
                    }
                }
                
                
            }, to: APIEndpoint.createBuyerProfile,method: .post,headers: headers)
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
                            arrpropertyInd.removeAll()
                            let data = JSON.init(JSONh)
                            
                            if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4 || data["status"].intValue == 5{
                                showAlertWith(message: data["message"].stringValue, inView: self)
                            }
                            else if data["status"].intValue == 1
                            {
                                createdByAgent = true
                                self.showAlertMessage(messageStr: data["message"].stringValue) { (donebtnclicked) in
                                    mybool = false
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
    
    func getArrInd(arrInd: [Int], arrId: [Int]) {
        self.arrPropertyIndex = arrInd
        self.arrPropertyId = arrId
    }
    
}
