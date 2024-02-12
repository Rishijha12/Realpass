//
//  ViewController.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 01/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import AVFoundation
import CropViewController
import SDWebImage
class ProfilePersonlaInfoVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate{
    
    // MARK:- Outlets
    // SkyFloat Outles
    
    @IBOutlet weak var lblSTDCode: UILabel!{
        didSet{
            lblSTDCode.font = UIFont.custom(style: .Medium, size: .s14)
            lblSTDCode.textColor = UIColor.kTextColor()
        }
    }
    
    @IBOutlet var txtFirstName: SkyFloatingLabelTextField!{
        didSet{
            
            self.txtFirstName.attributedPlaceholder =
                NSAttributedString(string: "First Name",
                                   attributes: [
                                    NSAttributedString.Key.font : UIFont.custom(style: .Regular, size: .s14),
                                    NSAttributedString.Key.foregroundColor : UIColor.kRadioLabelColor()
                                   ])
            
            self.txtFirstName.title = "First Name"
//            self.txtFirstName.text = "Jon"
            self.txtFirstName.convertFirstLetter()
            self.txtFirstName.font = .custom(style: .Medium, size: .s14)
            self.txtFirstName.titleFont = .custom(style: .Medium, size: .s14)
            self.txtFirstName.titleColor = UIColor.kTextRedColor()
            self.txtFirstName.placeholderColor = UIColor.kRadioLabelColor()
            self.txtFirstName.lineColor = UIColor.kRadioLabelColor()
            self.txtFirstName.lineHeight = 1.0
            self.txtFirstName.selectedLineColor = UIColor.kCellSelectedColor()
            //            self.txtFirstName.keyboardType = .namePhonePad
            self.txtFirstName.textContentType = .name
            self.txtFirstName.autocapitalizationType = .words
            
        }
    }
    @IBOutlet var txtLastName: SkyFloatingLabelTextField!{
        didSet{
            
            self.txtLastName.attributedPlaceholder =
                NSAttributedString(string: "Last name",
                                   attributes: [
                                    NSAttributedString.Key.font : UIFont.custom(style: .Regular, size: .s14),
                                    NSAttributedString.Key.foregroundColor : UIColor.kRadioLabelColor()
                                   ])
            
            self.txtLastName.title = "Last Name"
//            self.txtLastName.text = "Doe"
            self.txtLastName.convertFirstLetter()
            self.txtLastName.font = .custom(style: .Medium, size: .s14)
            self.txtLastName.titleFont = .custom(style: .Medium, size: .s14)
            self.txtLastName.titleColor = UIColor.kTextRedColor()
            self.txtLastName.placeholderColor = UIColor.kRadioLabelColor()
            self.txtLastName.lineColor = UIColor.kRadioLabelColor()
            self.txtLastName.lineHeight = 1.0
            self.txtLastName.selectedLineColor = UIColor.kCellSelectedColor()
            //            self.txtLastName.keyboardType = .namePhonePad
            self.txtLastName.autocapitalizationType = .words
            
        }
    }
    @IBOutlet var txtMobile: SkyFloatingLabelTextField!{
        didSet{
            
            self.txtMobile.attributedPlaceholder =
                NSAttributedString(string: "Mobile",
                                   attributes: [
                                    NSAttributedString.Key.font : UIFont.custom(style: .Regular, size: .s14),
                                    NSAttributedString.Key.foregroundColor : UIColor.kRadioLabelColor()
                                   ])
            
            self.txtMobile.title = "Mobile"
//            self.txtMobile.text = "+61474747474"
            self.txtMobile.convertFirstLetter()
            self.txtMobile.font = .custom(style: .Medium, size: .s14)
            self.txtMobile.titleFont = .custom(style: .Medium, size: .s14)
            self.txtMobile.titleColor = UIColor.kTextRedColor()
            self.txtMobile.placeholderColor = UIColor.kRadioLabelColor()
            self.txtMobile.lineColor = UIColor.kRadioLabelColor()
            self.txtMobile.lineHeight = 1.0
            self.txtMobile.selectedLineColor = UIColor.kCellSelectedColor()
            self.txtMobile.keyboardType = .phonePad
            self.txtMobile.textContentType = .telephoneNumber
            
        }
    }
    @IBOutlet var txtEmail: SkyFloatingLabelTextField!{
        didSet{
            self.txtEmail.attributedPlaceholder =
                NSAttributedString(string: "Email",
                                   attributes: [
                                    NSAttributedString.Key.font : UIFont.custom(style: .Regular, size: .s14),
                                    NSAttributedString.Key.foregroundColor : UIColor.kRadioLabelColor()
                                   ])
            
            self.txtEmail.title = "Email"
//            self.txtEmail.text = "jon@gmail.com"
            self.txtEmail.font = .custom(style: .Medium, size: .s14)
            self.txtEmail.convertFirstLetter()
            self.txtEmail.titleFont = .custom(style: .Medium, size: .s14)
            self.txtEmail.titleColor = UIColor.kTextRedColor()
            self.txtEmail.placeholderColor = UIColor.kRadioLabelColor()
            self.txtEmail.lineColor = UIColor.kRadioLabelColor()
            self.txtEmail.lineHeight = 1.0
            self.txtEmail.selectedLineColor = UIColor.kCellSelectedColor()
            self.txtEmail.keyboardType = .emailAddress
            self.txtEmail.textContentType = .emailAddress
        }
    }
    
    
    @IBOutlet var btnSaveandNext: UIButton!{
        didSet{
            self.btnSaveandNext.titleLabel?.textColor = UIColor.kTextColorBuyer() 
            self.btnSaveandNext.titleLabel?.text = "Save & Next"
            self.btnSaveandNext.titleLabel?.font = .custom(style: .Medium, size: .s16)
            self.btnSaveandNext.backgroundColor = UIColor.kSplashColor()
            self.btnSaveandNext.layer.cornerRadius = 5.0
            
        }
    }
    @IBOutlet var imgviewDashSelect: UIImageView!{
        didSet{
            
        }
    }
    @IBOutlet var imgviewDashUnselect1: UIImageView!{
        didSet{
            
        }
    }
    @IBOutlet var imgviewDashUnselect2: UIImageView!{
        didSet{
            
        }
    }
    @IBOutlet var imgviewDashUnselect3: UIImageView!{
        didSet{
            
        }
    }
    @IBOutlet var viewNextPageMove: UIView!
    
    @IBOutlet var viewFormContent: UIView!{
        didSet{
            self.viewFormContent.layer.cornerRadius = 10.0
            self.viewFormContent.clipsToBounds = true
        }
    }
    @IBOutlet var lblAddProfile: UILabel!{
        didSet{
            self.lblAddProfile.text = "Tap to change image"
            self.lblAddProfile.textColor = UIColor.kTaptoChangeProfile()
            self.lblAddProfile.font = .custom(style: .Medium, size: .s12)
        }
    }
    @IBOutlet var imgView: UIImageView!{
        didSet{
            
        }
    }
    @IBOutlet var view_ImageConten: UIView!
    @IBOutlet var contentView: UIView!{
        didSet{
            
            
        }
    }
    @IBOutlet var scrlView: UIScrollView!
    //MARK:- --------Local Variable------- -
    var profileImage = UIImage()
    var isSelectImagePicker = false
    var arrSetupData = NSMutableArray()
    var number = ""
    let imagePicker = UIImagePickerController()//ImagePicker!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblSTDCode.isHidden = true
        self.setup()
        self.setData()
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.addNavigationBackButton()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imgView.layer.masksToBounds = false
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = ScreenSize.SCREEN_WIDTH*0.28/2
        imgView.clipsToBounds = true
//        let Url = currentUser.profilePic
////        let url = URL(string: Url!)
//        if isSelectImagePicker == true{
////            let userImage = UIImage(named: "user")
//            self.imgView.makeImageCircla(self.profileImage)
//        }else{
//            if Url == "" || Url == nil{
//                self.imgView.makeImageCircla(UIImage(named: "user")!)
//            }else{
//                imgView.layer.masksToBounds = false
//                imgView.layer.cornerRadius = ScreenSize.SCREEN_WIDTH*0.48/2
//                imgView.clipsToBounds = true
////                let Url = currentUser.profilePic
//                self.imgView.sd_setImage(with: URL(fileURLWithPath: Url ?? ""))
//
//                let url = URL(string: Url ?? "")
//                if let data = try? Data(contentsOf: url!)
//                {
//                    let image: UIImage = UIImage(data: data)!
//                    self.imgView.makeImageCircla(image)
//                }
//            }
//        }
//        if isSelectImagePicker == true{
////            let userImage = UIImage(named: "user")
//            self.imgView.makeImageCircla(self.profileImage)
//        }else{
//            
//            self.imgView.makeImageCircla(UIImage(named: "user")!)
//        }
        
       
    }
    
    func addNavigationBackButton(){
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(image: UIImage(named: ImageName.backButtom),style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
        self.navigationItem.leftBarButtonItem!.tintColor = .black
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    @objc func backNavigationAction(){
        self.navigationController?.popViewController(animated: true)
    }
    // MARK:- Support method
    func setup(){
        self.navigationController?.isNavigationBarHidden = false
        self.title = "MY PROFILE"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        transparentNav(nav: (self.navigationController!))
        self.view.backgroundColor = UIColor.kAppThemeColor()
        self.imagePicker.delegate = self
        self.imagePicker.allowsEditing = true
        self.txtMobile.delegate = self
        
    }
    
    // MARK:- Action
    
    @IBAction func btnClickAddProfielPic(_ sender: UIButton) {
        // call Alert custom method
        self.showAlert()
        
    }
    func validatePersonalInfo(){
        
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
            return self.showAlertMessage(messageStr: Validation.PhoneValid) { (action) in
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
        let Url = currentUser.profilePic
        let url = URL(string: Url ?? "")
        if isProfilePicSelected{
            reqParameter["profilePic"] = self.profileImage
        }
        else{
            if currentUser.profilePic == "" || currentUser.profilePic == nil{
                self.imgView.image = UIImage(named: "user")
            }else{
                if let data = try? Data(contentsOf: url!){
                    let image: UIImage = UIImage(data: data)!
                    reqParameter["profilePic"] = image
            }
        }

    }
//        reqParameter["profilePic"] = self.profileImage
        reqParameter["buyerId"] =  buyerId
        reqParameter["firstName"]  = self.txtFirstName.text!
        reqParameter["lastName"]   = self.txtLastName.text!
        reqParameter["mobile"]     = "\("+61 ")\(self.txtMobile.text!)"
        reqParameter["email"]      = self.txtEmail.text!
//        print("reqParameter : \(reqParameter)")
        let nextVC = ProfileContactDetailVC.instantiate(fromAppStoryboard: .Buyer)
        self.navigationController?.pushViewController(nextVC, animated: true)
        
}
    
    @IBAction func btnClickNext(_ sender: UIButton) {
        self.validatePersonalInfo()
    }
    
    
    // MARK:- Imagepicker Delgate method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
//            return
//        }
        let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        self.isSelectImagePicker = true
        self.profileImage = pickedImage ?? UIImage()
        isProfilePicSelected = true
        self.imgView.image = pickedImage
        dismiss(animated: true, completion: nil)
        
    }
    
    
    // MARK:- Custom funcion
    
    func setData(){
        createdByAgent = false
        self.txtFirstName.text = currentUser.firstName ?? ""
        self.txtLastName.text = currentUser.lastName ?? ""
//        self.txtMobile.text = currentUser.mobile ?? ""
        
        let setMobile = currentUser.mobile ?? ""
        print("setMobile = \(setMobile)")
        let num = isRemoveFormatedText(strText: setMobile)
        print("num = \(num)")
        self.txtMobile.text = (num.formateMobileNumber() )
        
        if let strMobile = currentUser.mobile, strMobile.count > 0{
                self.lblSTDCode.isHidden = false
            print("lblSTDCode = \(self.lblSTDCode.isHidden)")
                self.txtMobile.setLeftPaddingPoints(30)
                }
        
        self.txtEmail.text = currentUser.email ?? ""
//        let urllink = currentUser.profilePic ?? ""
        self.txtEmail.isUserInteractionEnabled = false
        if currentUser.profilePic == "" || currentUser.profilePic == nil
        {
            self.imgView.makeImageCircla(UIImage(named: "user")!)
        }
        else
        {
            let Url = currentUser.profilePic ?? ""
            self.imgView.sd_setImage(with: URL(string: Url), placeholderImage: UIImage(named: "user"))
            
//            let url = URL(string: Url!)
//            if let data = try? Data(contentsOf: url!)
//            {
//                let image: UIImage = UIImage(data: data)!
//                self.imgView.makeImageCircla(image)
//            }
        }
//
    }
    
//    func authorization(){
//        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
//        switch authStatus {
//        
//        case .denied, .restricted:
//            
//            let dialog = UIAlertController(title: "Unable to access the Camera", message: "To enable access, go to Settings > Privacy > Camera and turn on Camera access for this app.", preferredStyle: UIAlertController.Style.alert)
//            
//            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
//            
//            dialog.addAction(okAction)
//            self.present(dialog, animated:true, completion:nil)
//        case .notDetermined:
//            
//            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (grantd) in
//                
//                if grantd {
//                    self.imagePicker.sourceType = .camera
//                }
//            })
//        case .authorized:
//            
//            self.imagePicker.sourceType = .camera
//        @unknown default:
//            break;
//        }
//    }
    
    func showAlert(){
        // Add AlertView Controller
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Photo library", style: .default, handler: { (button) in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.modalPresentationStyle = .overCurrentContext
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (button) in
            if (UIImagePickerController.availableMediaTypes(for: UIImagePickerController.SourceType.camera) != nil) {
                self.imagePicker.sourceType = .camera
                self.imagePicker.modalPresentationStyle = .overCurrentContext
                self.present(self.imagePicker, animated: true, completion: nil)
                
            }else{
                self.noCamera()
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func openCameraApp() {
        if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
            imagePicker.allowsEditing = true
            self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
            self.imagePicker.cameraCaptureMode = .photo
            self.imagePicker.modalPresentationStyle = .overCurrentContext
            present(imagePicker,
                    animated: true,
                    completion: nil)
        } else {
            self.noCamera()
        }
    }
    func noCamera(){
        let alertVC = UIAlertController(
            title: "RealPass",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    
    // MARK: Photos Albums
    
    func showImagePicker() {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        //        picker.modalPresentationStyle = .Popover
        present(imagePicker,
                animated: true,
                completion: nil)
        imagePicker.popoverPresentationController?.sourceView = self.view
    }
    
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//    //        self.txtMobile.text = "+61 " + self.txtMobile.text!
//
//            if self.txtMobile.text?.count == 0
//            {
//               self.txtMobile.text = "+61 "
//            }
//        }
//
//        func textFieldDidEndEditing(_ textField: UITextField) {
//            if self.txtMobile.text == "+61 "
//            {
//                self.txtMobile.text = ""
//            }
//        }
        
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
//                if self.txtMobile.text == "+61 " && string.count == 0 {
//                    return false
//                }
                    
                    let newLength = textField.text!.count + (string.count - range.length)
                                if newLength > 0 {
                                    self.txtMobile.setLeftPaddingPoints(30)
                                    self.lblSTDCode.isHidden = false
                                }
                                else{
                                    self.txtMobile.removeLeftPaddingPoints()
                                    self.lblSTDCode.isHidden = true
                                }
                    
//                    let currentText = textField.text ?? ""
//                    guard let stringRange = Range(range, in: currentText) else { return false }
//                    let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
//                    return updatedText.count <= 12
            }
            return true
        }
}





