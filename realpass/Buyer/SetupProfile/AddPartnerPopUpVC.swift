//
//  AddPartnerPopUpVC.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 17/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

protocol AddPartnerDelegate{
    func addArr(partner: Partner, isSelect: Bool)
}

class AddPartnerPopUpVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var lblSTDCode: UILabel!{
        didSet{
            lblSTDCode.font = UIFont.custom(style: .Medium, size: .s14)
            lblSTDCode.textColor = UIColor.kTextColor()
        }
    }
    
    
    @IBOutlet var btnClose: UIButton!{
        didSet{
            self.btnClose.imageView?.contentMode = .scaleAspectFill
            //            self.btnClose.backgroundColor = .kAppThemeColor()
            self.btnClose.layer.cornerRadius = 20.0
            self.btnClose.clipsToBounds = true
            self.btnClose.layer.masksToBounds = false
        }
    }
    @IBOutlet var viewPartnerDetailContainer: UIView!{
        didSet{
            self.viewPartnerDetailContainer.backgroundColor = .white
            self.viewPartnerDetailContainer.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    @IBOutlet var txtFirstName: SkyFloatingLabelTextField!{
        didSet{
            self.txtFirstName.textColor = UIColor.black
            self.txtFirstName.font = .custom(style: .Medium, size: .s14)
            self.txtFirstName.titleFont = .custom(style: .Medium, size: .s14)
            self.txtFirstName.placeholder = "First Name"
            self.txtFirstName.title = "First Name"
            self.txtFirstName.convertFirstLetter()
            self.txtFirstName.titleColor = UIColor.kTextRedColor()
            self.txtFirstName.placeholderColor = UIColor.kRadioLabelColor()
            self.txtFirstName.lineColor = UIColor.kUnselectedLine()
            self.txtFirstName.lineHeight = 2.0
            self.txtFirstName.selectedLineColor = UIColor.kBlueColor()
            self.txtFirstName.keyboardType = .default
            self.txtFirstName.autocapitalizationType = .words
            self.txtFirstName.textContentType = .name
        }
    }
    @IBOutlet var txtLastName: SkyFloatingLabelTextField!{
        didSet{
            self.txtLastName.textColor = UIColor.black
            self.txtLastName.font = .custom(style: .Medium, size: .s14)
            self.txtLastName.titleFont = .custom(style: .Medium, size: .s14)
            self.txtLastName.placeholder = "Last Name"
            self.txtLastName.title = "Last Name"
            self.txtLastName.convertFirstLetter()
            self.txtLastName.titleColor = UIColor.kTextRedColor()
            self.txtLastName.placeholderColor = UIColor.kRadioLabelColor()
            self.txtLastName.lineColor = UIColor.kUnselectedLine()
            self.txtLastName.lineHeight = 2.0
            self.txtLastName.selectedLineColor = UIColor.kBlueColor()
            self.txtLastName.keyboardType = .default
            self.txtLastName.autocapitalizationType = .words
            self.txtLastName.textContentType = .name
        }
    }
    @IBOutlet var txtMobile: SkyFloatingLabelTextField!{
        didSet{
            self.txtMobile.textColor = UIColor.black
            self.txtMobile.font = .custom(style: .Medium, size: .s14)
            self.txtMobile.titleFont = .custom(style: .Medium, size: .s14)
            self.txtMobile.placeholder = "Mobile"
            self.txtMobile.title = "Mobile"
            self.txtMobile.convertFirstLetter()
            self.txtMobile.titleColor = UIColor.kTextRedColor()
            self.txtMobile.placeholderColor = UIColor.kRadioLabelColor()
            self.txtMobile.lineColor = UIColor.kUnselectedLine()
            self.txtMobile.lineHeight = 1.0
            self.txtMobile.selectedLineColor = UIColor.kBlueColor()
            self.txtMobile.keyboardType = .phonePad
        }
    }
    @IBOutlet var txtEmail: SkyFloatingLabelTextField!{
        didSet{
            self.txtEmail.textColor = UIColor.black
            self.txtEmail.font = .custom(style: .Medium, size: .s14)
            self.txtEmail.titleFont = .custom(style: .Medium, size: .s14)
            self.txtEmail.placeholder = "Email"
            self.txtEmail.title = "Email"
            self.txtEmail.convertFirstLetter()
            self.txtEmail.titleColor = UIColor.kTextRedColor()
            self.txtEmail.placeholderColor = UIColor.kRadioLabelColor()
            self.txtEmail.lineColor = UIColor.kUnselectedLine()
            self.txtEmail.lineHeight = 1.0
            self.txtEmail.selectedLineColor = UIColor.kBlueColor()
            self.txtEmail.keyboardType = .emailAddress
        }
    }
    @IBOutlet var btnSubmit: UIButton!{
        didSet{
            self.btnSubmit.setTitle("Add", for: .normal)
            self.btnSubmit.titleLabel?.font = .custom(style: .Medium, size: .s20)
            self.btnSubmit.setTitleColor(.black, for: .normal)
            self.btnSubmit.backgroundColor = .kSplashColor()
            self.btnSubmit.layer.cornerRadius = 10.0
            //            self.btnSubmit.layer.shadowOpacity = 0.1
            //            self.btnSubmit.layer.shadowColor = UIColor.black.cgColor
        }
    }
    @IBOutlet var ViewContainer: UIView!{
        didSet{
            self.ViewContainer.backgroundColor = .white
            self.ViewContainer.layer.cornerRadius = 10.0
            self.ViewContainer.clipsToBounds = true
            self.ViewContainer.layer.masksToBounds = false
            self.ViewContainer.layer.shadowRadius = 5.0
            self.ViewContainer.layer.shadowOpacity = 0.1
            self.ViewContainer.layer.shadowColor = UIColor.black.cgColor
        }
    }
    @IBOutlet var viewTitle: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var lblTitleAddPartner: UILabel!{
        didSet{
            self.lblTitleAddPartner.text = "Add Partner"
            self.lblTitleAddPartner.font = .custom(style: .Medium, size: .s18)
        }
    }
    
    
    // MARK:- Local properties
    var delegate: AddPartnerDelegate?
    var isSelect = false
    var number = ""
    var parr = [Partners]()
    var objPartner = Partners()
    var isFromEditVC = Bool()
    var dismisPartnerPopup : ((Partners) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtMobile.delegate = self
        self.lblSTDCode.isHidden = true
    }
    func setup(){
        
    }
    
    func clearTextFiels(){
        self.txtFirstName.text = ""
        self.txtLastName.text = ""
        self.txtEmail.text = ""
        self.txtMobile.text = ""
    }
    
    func validatePartner(){
        
        number = isRemoveFormatedText(strText: self.txtMobile.text)
        
        guard self.txtFirstName.text! != "" else {
            return self.showAlertMessage(messageStr: Validation.FirstName) { (action) in
                self.txtFirstName.becomeFirstResponder()
            }
        }
        guard self.txtFirstName.text!.isValidName() == true else {
            return self.showAlertMessage(messageStr: Validation.FirstNameNumeric) { (action) in
                self.txtFirstName.becomeFirstResponder()
            }
        }
        guard self.txtFirstName.text!.trimmingCharacters(in: .whitespaces).count >= 3 else {
            return self.showAlertMessage(messageStr: "First name should have at least 3 characters") { (action) in
                self.txtFirstName.becomeFirstResponder()
            }
        }
        guard self.txtFirstName.text!.isValidSpaceName() == true else {
            return self.showAlertMessage(messageStr: Validation.FirstNameSpace) { (action) in
                self.txtFirstName.becomeFirstResponder()
            }
        }
        
        guard self.txtLastName.text! != "" else {
            return self.showAlertMessage(messageStr: Validation.LastName) { (action) in
                self.txtLastName.becomeFirstResponder()
            }
        }
        guard self.txtLastName.text!.isValidName() == true else  {
            return self.showAlertMessage(messageStr: Validation.LastNameNumeric) { (action) in
                self.txtLastName.becomeFirstResponder()
            }
        }
        guard self.txtLastName.text!.trimmingCharacters(in: .whitespaces).count >= 3 else {
            return self.showAlertMessage(messageStr: "Last name should have at least 3 characters") { (action) in
                self.txtLastName.becomeFirstResponder()
            }
        }
        guard self.txtLastName.text!.isValidSpaceName() == true else  {
           return self.showAlertMessage(messageStr: Validation.LastNameSpace) { (action) in
                self.txtLastName.becomeFirstResponder()
            }
        }
        
        guard self.txtMobile.text! != "" else {
            return self.showAlertMessage(messageStr: Validation.phoneNumber) { (action) in
                self.txtMobile.becomeFirstResponder()
            }
        }
        guard self.number.count >= 10 else {
            return self.showAlertMessage(messageStr: Validation.phoneNumberLength) { (action) in
                self.txtMobile.becomeFirstResponder()
            }
        }
        guard self.number.isValidPhone() == true else {
            return self.showAlertMessage(messageStr: "Please Enter valid Phone Number") { (action) in
                self.txtMobile.becomeFirstResponder()
            }
        }
       
        guard self.txtEmail.text! != "" else {
            return self.showAlertMessage(messageStr: Validation.EmailId) { (action) in
                self.txtEmail.becomeFirstResponder()
            }
        }
        
        guard self.txtEmail.text!.isValidEmail() == true else {
            return self.showAlertMessage(messageStr: Validation.ValidEmailId) { (action) in
                self.txtEmail.becomeFirstResponder()
            }
        }
        if self.isFromEditVC
        {
            let emptyDictionary = ["firstName":self.txtFirstName.text!,"lastName":self.txtLastName.text!,"email":self.txtEmail.text!,"phone":self.txtMobile.text!]
            let data = Partners.init(dictionary: emptyDictionary as NSDictionary)
            
            if let temp = data
            {
                self.dismisPartnerPopup!(temp)
            }
            self.dismiss(animated: true, completion: nil)
        }
        else
        {
            let partner = Partner(fName: self.txtFirstName.text!, lName: self.txtLastName.text!, mobile: self.txtMobile.text!, email: self.txtEmail.text!)
            
            self.dismiss(animated: true) {
                self.delegate?.addArr(partner: partner, isSelect: self.isSelect)
                print("Prtner From Popup \(partner)")
            }
        }
        
        
        
    }
    
    @IBAction func btnClickSubmit(_ sender: UIButton) {
        self.validatePartner()
    }
    
    
    @IBAction func btnClickClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        //        self.txtMobile.text = "+61 " + self.txtMobile.text!
//
//        if self.txtMobile.text?.count == 0
//        {
//            self.txtMobile.text = "+61 "
//        }
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if self.txtMobile.text == "+61 "
//        {
//            self.txtMobile.text = ""
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
            
//            let currentText = textField.text ?? ""
//            guard let stringRange = Range(range, in: currentText) else { return false }
//            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
//            return updatedText.count <= 12
        }
        return true
    }
    
    
}

struct Partner
{
    var fName = String()
    var lName = String()
    var mobile = String()
    var email = String()
    init(fName:String,lName:String,mobile:String,email:String) {
        self.fName = fName
        self.lName = lName
        self.mobile = mobile
        self.email = email
    }
}

