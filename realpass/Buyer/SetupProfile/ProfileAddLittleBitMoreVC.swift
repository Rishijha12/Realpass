//
//  ProfileAddLittleBitMoreVC.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 10/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Alamofire
import SVProgressHUD
import SwiftyJSON
class ProfileAddLittleBitMoreVC: UIViewController,UITextViewDelegate,viewPopupDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate,SubrubsVCDelegate{
    
    // MARK:- OUtlets
    @IBOutlet var viewAddlittleBitMoreContainer: UIView!{
        didSet{
            
            self.viewAddlittleBitMoreContainer.layer.cornerRadius = 10.0
            self.viewAddlittleBitMoreContainer.layer.masksToBounds = false
            self.viewAddlittleBitMoreContainer.clipsToBounds = true
            self.viewAddlittleBitMoreContainer.backgroundColor = .white
            
        }
    }
    @IBOutlet var lblTitleTaleUsLittleBitMore: UILabel!{
        didSet{
            self.lblTitleTaleUsLittleBitMore.text = "Please tell us a little bit more about you "
            self.lblTitleTaleUsLittleBitMore.textColor = .black
            self.lblTitleTaleUsLittleBitMore.font = .custom(style: .Regular, size: .s20)
        }
    }
    @IBOutlet var lblInfoThisInfoOnlyforAgent: UILabel!{
        didSet{
            self.lblInfoThisInfoOnlyforAgent.text = "This information will be shared with agents. Only fill out information you’re comfortable sharing."
            self.lblInfoThisInfoOnlyforAgent.numberOfLines = 0
            self.lblInfoThisInfoOnlyforAgent.textColor = .black
            self.lblInfoThisInfoOnlyforAgent.font = .custom(style: .Regular, size: .s14)
        }
    }
    @IBOutlet var btnSaveAndNext: UIButton!{
        didSet{
            self.btnSaveAndNext.setTitle("Save", for: .normal)
            self.btnSaveAndNext.layer.cornerRadius = 5.0
            self.btnSaveAndNext.layer.masksToBounds = false
            self.btnSaveAndNext.clipsToBounds = true
            self.btnSaveAndNext.titleLabel?.textColor = UIColor.kTextColorBuyer() 
            self.btnSaveAndNext.backgroundColor = UIColor.kSplashColor()
            self.btnSaveAndNext.titleLabel?.font = .custom(style: .Medium, size: .s16)
        }
    }
    @IBOutlet var lblSelectPreferedSubrubs: UILabel!{
        didSet{
            self.lblSelectPreferedSubrubs.text = "Select your preferred suburbs"
            self.lblSelectPreferedSubrubs.textColor = UIColor.kRadioLabelColor()
            self.lblSelectPreferedSubrubs.font = .custom(style: .Regular, size: .s14)
        }
    }
    @IBOutlet var viewPlaceContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var txtFieldSubrubs: SkyFloatingLabelTextField!{
        didSet{
            self.txtFieldSubrubs.text = ""
            self.txtFieldSubrubs.textColor = .black
            self.txtFieldSubrubs.title = "select your preferred suburbs"
            self.txtFieldSubrubs.convertFirstLetter()
            self.txtFieldSubrubs.titleFont = .custom(style: .Regular, size: .s14)
            self.txtFieldSubrubs.titleColor = .kRadioLabelColor()
            //            self.txtFieldSubrubs.title = ""
            self.txtFieldSubrubs.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var imgViewDown: UIImageView!{
        didSet{
            self.imgViewDown.image = UIImage(named: ImageName.downArrow)
        }
    }
    @IBOutlet var btnAddSubrubs: UIButton!{
        didSet{
            
        }
    }
    @IBOutlet var viewSeparator: UIView!{
        didSet{
            self.viewSeparator.backgroundColor = UIColor.kBorderColorAddLittleBitMore()
        }
    }
    @IBOutlet var lblPrizeRange: UILabel!{
        didSet{
            self.lblPrizeRange.text = "Price Range"
            self.lblPrizeRange.textColor = .black
            self.lblPrizeRange.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var stkViewPrizeConainer: UIStackView!{
        didSet{
            
        }
    }
    @IBOutlet var viewMinimumPrizeContainer: UIView!{
        didSet{
            self.viewMinimumPrizeContainer.layer.cornerRadius = 10.0
            self.viewMinimumPrizeContainer.layer.masksToBounds = false
            self.viewMinimumPrizeContainer.clipsToBounds = true
        }
    }
    @IBOutlet var imgViewDollerSignMin: UIImageView!{
        didSet{
            self.imgViewDollerSignMin.image = UIImage(named: ImageName.doller)
            self.imgViewDollerSignMin.backgroundColor = UIColor.kDolorImgViewColor()
            self.imgViewDollerSignMin.contentMode = .center
        }
    }
    @IBOutlet var txtMinPrize: UITextField!{
        didSet{
            // self.txtMinPrize.setCustomPropertyTextFeilds("Min Price", txtColor: UIColor.kInstructionColor(), alignMent: .left, keybordType: .numberPad, fontType: .custom(style: .Medium, size: .s16), tintColor: .blue)
            self.txtMinPrize.text = "0"
            self.txtMinPrize.backgroundColor = UIColor.kAppThemeColor()
            self.txtMinPrize.setLeftPaddingPoints(10.0)
            self.txtMinPrize.borderStyle = .none
            self.txtMinPrize.delegate = self
        }
    }
    @IBOutlet var viewMaxPrizeConainer: UIView!{
        didSet{
            self.viewMaxPrizeConainer.layer.cornerRadius = 10.0
            self.viewMaxPrizeConainer.layer.masksToBounds = false
            self.viewMaxPrizeConainer.clipsToBounds = true
        }
    }
    @IBOutlet var imgViewDollerSignMax: UIImageView!{
        didSet{
            self.imgViewDollerSignMax.image = UIImage(named: ImageName.doller)
            self.imgViewDollerSignMax.backgroundColor = UIColor.kDolorImgViewColor()
            self.imgViewDollerSignMax.contentMode = .center
            
        }
    }
    @IBOutlet var txtMaxPrize: UITextField!{
        didSet{
            //            self.txtMaxPrize.setCustomPropertyTextFeilds("Max Price", txtColor: UIColor.kInstructionColor(), alignMent: .left, keybordType: .numberPad, fontType: .custom(style: .Medium, size: .s16), tintColor: .blue)
            self.txtMaxPrize.text = "1,000,000"
            
            self.txtMaxPrize.backgroundColor = UIColor.kAppThemeColor()
            self.txtMaxPrize.setLeftPaddingPoints(10.0)
            self.txtMaxPrize.borderStyle = .none
            self.txtMaxPrize.delegate = self
        }
    }
    @IBOutlet var viewBedroomContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var stprBedroom: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var lblBedrooms: UILabel!{
        didSet{
            self.lblBedrooms.text = "Bedrooms"
            self.lblBedrooms.textColor = .black
            self.lblBedrooms.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var viewBathroomsContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var stprBathrooms: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var lblBathrooms: UILabel!{
        didSet{
            self.lblBathrooms.text = "Bathrooms"
            self.lblBathrooms.textColor = .black
            self.lblBathrooms.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var viewCarConainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var stprCar: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var lblTextviewCout: UILabel!{
        didSet{
            self.lblTextviewCout.text = "(0/250)"
            self.lblTextviewCout.font = .custom(style: .Regular, size: .s16)
            self.lblTextviewCout.textColor = .kPlaceholderColor()
        }
    }
    @IBOutlet var stprBedroomAddContainer: UIView!
    @IBOutlet var btnAddBedroom: UIButton!{
        didSet{
            self.btnAddBedroom.setTitle("+", for: .normal)
            self.btnAddBedroom.titleLabel?.font = .custom(style: .Regular, size: .s24)
            self.btnAddBedroom.setTitleColor(.kInstructionColor(), for: .normal)
            self.btnAddBedroom.backgroundColor = .kAppThemeColor()
            self.btnAddBedroom.layer.cornerRadius = 4.0
            self.btnAddBedroom.clipsToBounds = true
        }
    }
    @IBOutlet var lblNumberOfbedroom: UILabel!{
        didSet{
            self.lblNumberOfbedroom.font = .custom(style: .Regular, size: .s24)
            self.lblNumberOfbedroom.textColor = .kInstructionColor()
        }
    }
    @IBOutlet var stprBedroomRemoveContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var btnRemoveBedroom: UIButton!{
        didSet{
            self.btnRemoveBedroom.setTitle("-", for: .normal)
            self.btnRemoveBedroom.titleLabel?.font = .custom(style: .Regular, size: .s30)
            self.btnRemoveBedroom.setTitleColor(.kInstructionColor(), for: .normal)
            self.btnRemoveBedroom.backgroundColor = .kAppThemeColor()
            self.btnRemoveBedroom.layer.cornerRadius = 4.0
            self.btnRemoveBedroom.clipsToBounds = true
        }
    }
    
    @IBOutlet var stprBathroomAddContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var btnAddBathroom: UIButton!{
        didSet{
            self.btnAddBathroom.setTitle("+", for: .normal)
            self.btnAddBathroom.titleLabel?.font = .custom(style: .Regular, size: .s24)
            self.btnAddBathroom.setTitleColor(.kInstructionColor(), for: .normal)
            self.btnAddBathroom.backgroundColor = .kAppThemeColor()
            self.btnAddBathroom.layer.cornerRadius = 4.0
            self.btnAddBathroom.clipsToBounds = true
        }
    }
    @IBOutlet var lblNumberOfBathroom: UILabel!{
        didSet{
            self.lblNumberOfBathroom.font = .custom(style: .Regular, size: .s24)
            self.lblNumberOfBathroom.textColor = .kInstructionColor()
        }
    }
    @IBOutlet var stprBathroomRemoveContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var btnRemoveBathroom: UIButton!{
        didSet{
            self.btnRemoveBathroom.setTitle("-", for: .normal)
            self.btnRemoveBathroom.titleLabel?.font = .custom(style: .Regular, size: .s30)
            self.btnRemoveBathroom.setTitleColor(.kInstructionColor(), for: .normal)
            self.btnRemoveBathroom.backgroundColor = .kAppThemeColor()
            self.btnRemoveBathroom.layer.cornerRadius = 4.0
            self.btnRemoveBathroom.clipsToBounds = true
        }
    }
    
    @IBOutlet var stprCarAddContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var btnAddCar: UIButton!{
        didSet{
            self.btnAddCar.setTitle("+", for: .normal)
            self.btnAddCar.titleLabel?.font = .custom(style: .Regular, size: .s24)
            self.btnAddCar.setTitleColor(.kInstructionColor(), for: .normal)
            self.btnAddCar.backgroundColor = .kAppThemeColor()
            self.btnAddCar.layer.cornerRadius = 4.0
            self.btnAddCar.clipsToBounds = true
        }
    }
    @IBOutlet var lblNumberOfCar: UILabel!{
        didSet{
            self.lblNumberOfCar.font = .custom(style: .Regular, size: .s24)
            self.lblNumberOfCar.textColor = .kInstructionColor()
        }
    }
    @IBOutlet var stprCarRemoveContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var btnRemoveCar: UIButton!{
        didSet{
            self.btnRemoveCar.setTitle("-", for: .normal)
            self.btnRemoveCar.titleLabel?.font = .custom(style: .Regular, size: .s30)
            self.btnRemoveCar.setTitleColor(.kInstructionColor(), for: .normal)
            self.btnRemoveCar.backgroundColor = .kAppThemeColor()
            self.btnRemoveCar.layer.cornerRadius = 4.0
            self.btnRemoveCar.clipsToBounds = true
        }
    }
    
    @IBOutlet var lblCars: UILabel!{
        didSet{
            self.lblCars.text = "Cars"
            self.lblCars.textColor = .black
            self.lblCars.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var lblAboutMe: UILabel!{
        didSet{
            self.lblAboutMe.text = "About Me"
            self.lblAboutMe.textColor = .black
            self.lblAboutMe.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var txtViewAboutMe: UITextView!{
        didSet{
            
        }
    }
    @IBOutlet var lblPreAprovedFinance: UILabel!{
        didSet{
            self.lblPreAprovedFinance.text = "Are you pre-approved for finance?"
            self.lblPreAprovedFinance.numberOfLines = 0
            self.lblPreAprovedFinance.textColor = .black
            self.lblPreAprovedFinance.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var lblPreAprovedFinanceYes: UILabel!{
        didSet{
            self.lblPreAprovedFinanceYes.text = "Yes"
            self.lblPreAprovedFinanceYes.textColor = .black
            self.lblPreAprovedFinanceYes.font = .custom(style: .Medium, size: .s16)
        }
    }
    @IBOutlet var btnPreAprovedFinanceYes: UIButton!{
        didSet{
            self.btnPreAprovedFinanceYes.backgroundColor = .clear
        }
    }
    @IBOutlet var lblPreAprovedFinanceNo: UILabel!{
        didSet{
            self.lblPreAprovedFinanceNo.text = "No"
            self.lblPreAprovedFinanceNo.textColor = .black
            self.lblPreAprovedFinanceNo.font = .custom(style: .Medium, size: .s16)
        }
    }
    @IBOutlet var btnPreAprovedFinanceNo: UIButton!{
        didSet{
            self.btnPreAprovedFinanceNo.backgroundColor = .clear
        }
    }
    
    //MARK:- --------Local Variable------- -
    var arrNewSuburb = [PreferredSuburbs]()
    var numOfBathrooms = 0
    var numOfBedrooms = 0
    var numOfCar = 0
    var minPrice = 0.0
    var maxPrice = 0.0
    var txtviewCharCount = 0
    //    var arrSelectedSubrubs = [String]()
    var arrSelectedLatLong = [Subrubs]()
    var parmSelectedSubrbs : [String : String] = [:]
    var strpreAprovedFinance = "false"
    var textViewStr = ""
    var minPric = ""
    var maxPric = ""
    var boolPreAprovedFinance = false
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.addNavigationBackButton()
        //        self.addSubrubsToLabel()
        self.prefillLittlebitMore()
    }
    
    // MARK:- Setup View
    func setupView(){
        // Set Title
        self.title = "MY PROFILE"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.custom(style: .Regular, size: .s17),NSAttributedString.Key.foregroundColor : UIColor.black]
        
        self.view.backgroundColor = UIColor.kAppThemeColor()
        self.txtViewAboutMe.backgroundColor = UIColor.kAppThemeColor()
        self.txtViewAboutMe.attributedText = NSAttributedString(string: "Tell us about your situation", attributes: [NSAttributedString.Key.font : UIFont.custom(style: .Regular, size: .s14),NSAttributedString.Key.foregroundColor : UIColor.kTextViewPlaceholderColor()])
        
        self.txtViewAboutMe.delegate = self
        // default PreAprovedFinance is NO
        self.lblPreAprovedFinanceNo.textColor = .kBlueColor()
        self.lblPreAprovedFinanceYes.textColor = .black
        self.strpreAprovedFinance = "false"
    }
    
    func addNavigationBackButton(){
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(image: UIImage(named: ImageName.backButtom),style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
        self.navigationItem.leftBarButtonItem!.tintColor = .black
        
    }
    
    @objc func backNavigationAction(){
        self.setParameter()
        self.navigationController?.popViewController(animated: true)
    }
    
    func prefillLittlebitMore(){
        let bathroom = reqParameter.getStringValue(key: "bathrooms")
        let bedroom = reqParameter.getStringValue(key: "bedrooms")
        let car = reqParameter.getStringValue(key: "cars")
        let minP = reqParameter.getStringValue(key: "minPrice")
        let maxP = reqParameter.getStringValue(key: "maxPrice")
        let aboutMe = reqParameter.getStringValue(key: "aboutMe")
        let finance = reqParameter.getStringValue(key: "preApprovedFinance")
        let prefSub = reqParameter["preferredSuburbs"] as? [PreferredSuburbs]
        
//        let number1 = Int(minP) ?? 0
//        let number1 = Int(getbuyerdata?.minPrice ?? "0") ?? 0
//        print(number1.delimiter) // 31,908,551,587

//        let number2 = Int(maxP) ?? 0
//        print(number2.delimiter)
        if finance == "true"{
            self.lblPreAprovedFinanceNo.textColor = .black
            self.lblPreAprovedFinanceYes.textColor = .kBlueColor()
            self.strpreAprovedFinance = "true"
//            self.lblPreAprovedFinanceNo.text = "Yes"
            self.boolPreAprovedFinance = true
        }
        else{
            self.lblPreAprovedFinanceNo.textColor = .kBlueColor()
            self.lblPreAprovedFinanceYes.textColor = .black
            self.strpreAprovedFinance = "false"
//            self.lblPreAprovedFinanceNo.text = "No"
            self.boolPreAprovedFinance = false
        }
        if bedroom != ""{
            self.numOfBedrooms = Int(bedroom) ?? 0
            self.lblNumberOfbedroom.text = bedroom
        }else{
            self.lblNumberOfbedroom.text = "0"
        }
        if bathroom != ""{
            self.numOfBathrooms = Int(bathroom) ?? 0
            self.lblNumberOfBathroom.text = bathroom
        }else{
            
            self.lblNumberOfBathroom.text = "0"
        }
        if car != ""{
            self.numOfCar = Int(car) ?? 0
            self.lblNumberOfCar.text = car
        }else{
            self.lblNumberOfCar.text = "0"
        }

        if minP != ""{
            let number1 = Int(minP)
            self.minPric = "\(number1!.delimiter)"
            self.txtMinPrize.text = "\(self.minPric)"
            
        }else{
            
            self.txtMinPrize.text = "0"
        }
        if maxP != ""{
            let number2 = Int(maxP)
            self.maxPric = "\(number2!.delimiter)"
            self.txtMaxPrize.text = "\(self.maxPric)"
        }else{
            self.txtMaxPrize.text = "1,000,000"
        }

        self.txtViewAboutMe.text = aboutMe
        if aboutMe != ""{
            self.textViewStr = aboutMe
            self.txtViewAboutMe.text = aboutMe
            self.txtViewAboutMe.textColor = .black
            self.txtviewCharCount = self.txtViewAboutMe.text.count
            self.lblTextviewCout.text = "(\(self.txtviewCharCount)/250)"
        }
        else
        {
            self.textViewStr = aboutMe
            self.txtViewAboutMe.text = "Tell us about your situation"
            self.txtViewAboutMe.textColor = .kTextViewPlaceholderColor()
            self.txtviewCharCount = 0
            self.lblTextviewCout.text = "(\(self.txtviewCharCount)/250)"
        }
//        self.arrNewSuburb = prefSub ?? []
        var arrTemp = [parmSelectedSubrbs]
        arrTemp.removeAll()
        for i in 0..<newPrefSubruba.count{
            let dict = newPrefSubruba[i]
            let add = dict.address ?? ""//["address"] as? String ?? ""
            let lat = "\(dict.lattitude ?? 0.0)"//["lattitude"] as? String ?? ""
            let long = "\(dict.longitude ?? 0.0)" //["longitude"] as? String ?? ""
            if  self.txtFieldSubrubs.text?.trimWhiteSpaceAndNewLine == ""{
                self.txtFieldSubrubs.text = add
                self.parmSelectedSubrbs["address"] = add
                self.parmSelectedSubrbs["lattitude"] = lat
                self.parmSelectedSubrbs["longitude"] = long
                arrTemp.append(self.parmSelectedSubrbs)
                
                reqParameter["preferredSuburbs"] = arrTemp
            }
            else{
                self.txtFieldSubrubs.text = txtFieldSubrubs.text! + " | " + add
                self.parmSelectedSubrbs["address"] = add
                self.parmSelectedSubrbs["lattitude"] = lat
                self.parmSelectedSubrbs["longitude"] = long
                arrTemp.append(self.parmSelectedSubrbs)
                reqParameter["preferredSuburbs"] = arrTemp
            }
            
            
        }
//
//        reqParameter["minPrice"] = minPric//self.txtMinPrize.text
//        reqParameter["maxPrice"] = maxPric//self.txtMaxPrize.text
//        reqParameter["bedrooms"] = self.numOfBedrooms
//        reqParameter["bathrooms"] = self.numOfBathrooms
//        reqParameter["cars"] = self.numOfCar
//        reqParameter["aboutMe"] = self.textViewStr//self.txtViewAboutMe.text
//        reqParameter["preApprovedFinance"] = self.strpreAprovedFinance
//        //        reqParameter["buyerId"] = buyerId
//        reqParameter["accessToken"] = APIToken
//        print("reqParameter[] = \(reqParameter)")
    }
    
    func setParameter(){
        print("Max Prise = \(txtMaxPrize)\n Min Prise = \(txtMinPrize)")
        
        self.minPric = txtMinPrize.text!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        self.maxPric = txtMaxPrize.text!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        print("Max Prise = \(maxPric)\n Min Prise = \(minPric)")
        if self.txtMinPrize.text?.count == 0 || self.txtMaxPrize.text?.count == 0{
            self.txtMinPrize.text = "0"
            self.txtMaxPrize.text = "1,000,000"
        }
        
        guard Double(self.txtMinPrize.text ?? "0") ?? 0 >= 0 else {
            return self.showAlertMessage(messageStr: "Please Enter Positive value") { (action) in
                self.txtMinPrize.becomeFirstResponder()
            }
        }
//        guard Double(self.txtMaxPrize.text ?? "1,000,000") ?? 1000000 <= 1000000 else {
//            return self.showAlertMessage(messageStr: "Please Enter Less then 1,000,000") { (action) in
//                self.txtMinPrize.becomeFirstResponder()
//            }
//        }
        print("Max Prise = \(txtMaxPrize.text)\n Min Prise = \(txtMinPrize.text)")
        guard Double(minPric) ?? 0 < Double(maxPric) ?? 1000000 else {
            return self.showAlertMessage(messageStr: "Maximum price should be greater than minimum price.") { (action) in
                print("Please Enter More then Min Price")
                self.txtMaxPrize.becomeFirstResponder()
            }
        }
        
        // Add parameter to reqParameter
        reqParameter["minPrice"] = minPric//self.txtMinPrize.text
        reqParameter["maxPrice"] = maxPric//self.txtMaxPrize.text
        reqParameter["bedrooms"] = self.numOfBedrooms
        reqParameter["bathrooms"] = self.numOfBathrooms
        reqParameter["cars"] = self.numOfCar
        reqParameter["aboutMe"] = self.textViewStr//self.txtViewAboutMe.text
        reqParameter["preApprovedFinance"] = self.strpreAprovedFinance
        //        reqParameter["buyerId"] = buyerId
        reqParameter["accessToken"] = APIToken
        print("reqParameter[] = \(reqParameter)")
        // Call buyer Setup Api
        
    }
    func finalSetParameter(){
        print("Max Prise = \(txtMaxPrize)\n Min Prise = \(txtMinPrize)")
        
        self.minPric = txtMinPrize.text!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        self.maxPric = txtMaxPrize.text!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        print("Max Prise = \(maxPric)\n Min Prise = \(minPric)")
        if self.txtMinPrize.text?.count == 0 || self.txtMaxPrize.text?.count == 0{
            self.txtMinPrize.text = "0"
            self.txtMaxPrize.text = "1,000,000"
        }
        
        guard Double(self.txtMinPrize.text ?? "0") ?? 0 >= 0 else {
            return self.showAlertMessage(messageStr: "Please Enter Positive value") { (action) in
                self.txtMinPrize.becomeFirstResponder()
            }
        }
//        guard Double(self.txtMaxPrize.text ?? "1,000,000") ?? 1000000 <= 1000000 else {
//            return self.showAlertMessage(messageStr: "Please Enter Less then 1,000,000") { (action) in
//                self.txtMinPrize.becomeFirstResponder()
//            }
//        }
        print("Max Prise = \(txtMaxPrize.text)\n Min Prise = \(txtMinPrize.text)")
        guard Double(minPric) ?? 0 < Double(maxPric) ?? 1000000 else {
            return self.showAlertMessage(messageStr: "Maximum price should be greater than minimum price.") { (action) in
                print("Please Enter More then Min Price")
                self.txtMaxPrize.becomeFirstResponder()
            }
        }
        
        // Add parameter to reqParameter
        reqParameter["minPrice"] = minPric//self.txtMinPrize.text
        reqParameter["maxPrice"] = maxPric//self.txtMaxPrize.text
        reqParameter["bedrooms"] = self.numOfBedrooms
        reqParameter["bathrooms"] = self.numOfBathrooms
        reqParameter["cars"] = self.numOfCar
        reqParameter["aboutMe"] = self.textViewStr//self.txtViewAboutMe.text
        reqParameter["preApprovedFinance"] = self.strpreAprovedFinance
        //        reqParameter["buyerId"] = buyerId
        reqParameter["accessToken"] = APIToken
        print("reqParameter[] = \(reqParameter)")
        self.callSetUpBuyerProfileApi()
    }
    
    // MARK:- Button Action
    @IBAction func btnClickAddSubrubs(_ sender: UIButton) {
        let subRubsPopup = self.storyboard?.instantiateViewController(withIdentifier: "SubrubsVC") as! SubrubsVC
        subRubsPopup.modalPresentationStyle = .overCurrentContext
        subRubsPopup.transitioningDelegate = self
        subRubsPopup.delegate = self
        subRubsPopup.arrNewSuburb = newPrefSubruba//self.arrNewSuburb
        self.present(subRubsPopup, animated: true, completion: nil)
    }
    
    @IBAction func btnClickSaveAndNext(_ sender: UIButton) {
        self.finalSetParameter()
    }
    
    @IBAction func btnClickFinanceYes(_ sender: UIButton) {
        
        self.lblPreAprovedFinanceNo.textColor = .black
        self.lblPreAprovedFinanceYes.textColor = .kBlueColor()
        self.strpreAprovedFinance = "true"
        self.boolPreAprovedFinance = true
        
    }
    
    @IBAction func btnClickFinanceNo(_ sender: UIButton) {
        self.lblPreAprovedFinanceNo.textColor = .kBlueColor()
        self.lblPreAprovedFinanceYes.textColor = .black
        self.strpreAprovedFinance = "false"
        self.boolPreAprovedFinance = false
    }
    
    @IBAction func BtnClickAddBedroom(_ sender: UIButton) {
        if numOfBedrooms < 99{
            self.numOfBedrooms = self.numOfBedrooms + 1
            
        }
        self.lblNumberOfbedroom.text = "\(self.numOfBedrooms)"
        
    }
    @IBAction func BtnClickRemoveBedroom(_ sender: UIButton) {
        if self.numOfBedrooms > 0{
            self.numOfBedrooms = self.numOfBedrooms - 1
            self.lblNumberOfbedroom.text = "\(self.numOfBedrooms)"
        }else{
            self.lblNumberOfbedroom.text = "0"
        }
    }
    
    @IBAction func BtnClickAddBathroom(_ sender: UIButton) {
        if numOfBathrooms < 99{
            self.numOfBathrooms = self.numOfBathrooms + 1
            
        }
        self.lblNumberOfBathroom.text = "\(self.numOfBathrooms)"
    }
    @IBAction func BtnClickRemoveBathroom(_ sender: UIButton) {
        if self.numOfBathrooms > 0{
            self.numOfBathrooms = self.numOfBathrooms - 1
            self.lblNumberOfBathroom.text = "\(self.numOfBathrooms)"
        }else{
            self.lblNumberOfBathroom.text = "0"
        }
    }
    
    @IBAction func BtnClickAddCar(_ sender: UIButton) {
        if numOfCar < 99{
            self.numOfCar = self.numOfCar + 1
        }
        //        self.numOfCar = self.numOfCar + 1
        self.lblNumberOfCar.text = "\(self.numOfCar)"
    }
    @IBAction func BtnClickRemoveCar(_ sender: UIButton) {
        if self.numOfCar > 0{
            self.numOfCar = self.numOfCar - 1
            self.lblNumberOfCar.text = "\(self.numOfCar)"
        }else{
            self.lblNumberOfCar.text = "0"
        }
    }
    
    
    
    // MARK:- Custom Methods
    
    func openBrokerList(){
        let nextVc = BrokerListVc.instantiate(fromAppStoryboard: .Buyer)
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    func isButtonClicked(_ isClicked: Bool) -> Bool {
        return isClicked
    }
    
    // Just added for temp use
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func isRemoveFormatedText(strText: String?) -> String {
        let result = strText!.replacingOccurrences(of: "(", with: "", options: .literal, range: nil)
        let result1 = result.replacingOccurrences(of: ")", with: "", options: .literal, range: nil)
        let result2 = result1.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        let result3 = result2.replacingOccurrences(of: "+61", with: "", options: .literal, range: nil)
        //    let result4 = result3.replacingOccurrences(of: "61", with: "", options: .literal, range: nil)
        return result3.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
    }
    
    //MARK:- --------Api Call------- -
    
    func callSetUpBuyerProfileApi(){
        // Get All Parameter in variable
        let params = reqParameter
        // create object of header
        var headers: HTTPHeaders!
        // if ApiToken is black then
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
            // Upload Image
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                // take all value by key from Parameter
                for (key,value) in params{
                    
                    if value is String{
                        multipartFormData.append(((value as Any) as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
                    else if value is Int{
                        multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                    }else if key == "availabilityTime" || key == "preferredSuburbs" || key == "partners"{
                        let tmg = try! JSONSerialization.data(withJSONObject:value, options: [])
                        multipartFormData.append(tmg, withName: key)
                    }else if value is UIImage{
                        
                        var imageData :Data = Data()
                        
                        let imgProfile = value as? UIImage
                        imageData = imgProfile!.jpegData(compressionQuality: 0.75)!
                        
                        multipartFormData.append(imageData, withName: "profilePic", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
                    }
                }
                
                
            }, to: APIEndpoint.setUpBuyerProfile,method: .post,headers: headers)
            { (result) in
                
                switch result
                {
                case .success(let upload,_, _):
                    
                    upload.uploadProgress(closure:
                                            { (Progress) in
                                                print("Upload Progress: \(Progress.fractionCompleted)")
                                            })
                    upload.responseString
                    { [self] response in
                        APIManager.hideLoader()
                        print("print \(response)")
                        
                        if let JSONh = response.result.value
                        {
                            print("******api Call sucessfully")
                            let dict = self.convertToDictionary(text: JSONh)
                            let data = JSON.init(dict as Any)
                            
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
                                let mydata = data["data"]
                                print(mydata)
                                let login = UserDataModel.init(dictionary: mydata.dictionaryObject! as NSDictionary)
                                // save dict in userdefault
                                login?.saveDictionary()
                                currentUser = login!
                                
                                UserDefaults.standard.setValue(login?.isProfileSetUp, forKey: Keys.isProfileSetUp)
                                //                                    self.showAlertMessage(messageStr: data["message"].stringValue) { (donebtnclicked) in
                                
                                if self.boolPreAprovedFinance == true{
                                    let nxtVc = BuyerHomeVc.instantiate(fromAppStoryboard: .Buyer)
                                    self.navigationController?.pushViewController(nxtVc, animated: true)
                                }else{
                                    let popupVc = PopupVC.instantiate(fromAppStoryboard: .Buyer)//self.storyboard?.instantiateViewController(withIdentifier: "PopupVC") as! PopupVC
                                    popupVc.modalPresentationStyle = .overCurrentContext
                                    self.definesPresentationContext = true
                                    popupVc.del = self
                                    self.present(popupVc, animated: true, completion: nil)
                                }
                                //                                    }
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
                print("Outside the scope , Api not call")
            }
        })
    }
    
    
    
    // MARK:- Delegate method of TextView
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == .kTextViewPlaceholderColor(){// == "Tell us about your situation" {
            textView.text = ""
            self.textViewStr = textView.text
            textView.textColor = .black
        }else{
            if textView.text == "Tell us about your situation"{
                textView.textColor = .kTextViewPlaceholderColor()
                self.textViewStr = ""
            }else{
                textView.textColor = .black
                self.textViewStr = textView.text
            }
            
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == ""{
            textView.attributedText = NSAttributedString(string: "Tell us about your situation", attributes: [NSAttributedString.Key.font : UIFont.custom(style: .Regular, size: .s14)])
            textView.textColor = .kTextViewPlaceholderColor()
            self.textViewStr = ""
            textView.font = .custom(style: .Regular, size: .s14)
        }else{
            textView.textColor = .black
            self.textViewStr = textView.text
        }
    }
    
    //MARK:- --------Delegate Method of TextField------- -
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (textView == txtViewAboutMe)
        {
            self.txtviewCharCount = textView.text.count + (text.count - range.length)
            if self.txtviewCharCount <= 250
            {
                print("Count => \(self.txtviewCharCount)")
                self.lblTextviewCout.text = "(\(self.txtviewCharCount) /250)"
                print("test count => (\(self.txtviewCharCount)/250)")
                return textView.text.count + (text.count - range.length) <= 250
            }
            else
            {
                return false
            }
            
        }
        return true
    }
    
    //    func textFieldDidBeginEditing(_ textField: UITextField) {
    //
    //        if textField == self.txtMinPrize{
    //            if self.txtMinPrize.text?.count == 0{
    //                self.txtMinPrize.text = "0"
    //            }
    //        }else if textField == self.txtMaxPrize{
    //            if self.txtMaxPrize.text?.count == 0{
    //                self.txtMaxPrize.text = "1000000"
    //            }
    //        }
    //    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0
        let newLength = textField.text!.count + (string.count - range.length)
        if newLength <= 9{
        if let groupingSeparator = formatter.groupingSeparator {
            
            if string == groupingSeparator {
                return true
            }
            
            
            if let textWithoutGroupingSeparator = textField.text?.replacingOccurrences(of: groupingSeparator, with: "") {
                var totalTextWithoutGroupingSeparators = textWithoutGroupingSeparator + string
                if string.isEmpty { // pressed Backspace key
                    totalTextWithoutGroupingSeparators.removeLast()
                }
                if let numberWithoutGroupingSeparator = formatter.number(from: totalTextWithoutGroupingSeparators),
                   let formattedText = formatter.string(from: numberWithoutGroupingSeparator) {
                    
                    textField.text = formattedText
                    return false
                }
            }
        }
            return ((textField.text!.count + (string.count - range.length)) <= 9)
        }else{
            return false
        }
        
        return true
    }
    
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    //MARK:- --------SubrubsVC delgate methods ------- -
    func sendArrSubrubs(arrSubrubs: [PreferredSuburbs]) {
        self.txtFieldSubrubs.text = ""
        //        self.arrNewSuburb.removeAll()
        var arrTemp = [parmSelectedSubrbs]
        arrTemp.removeAll()
//        self.arrNewSuburb = arrSubrubs
        newPrefSubruba = arrSubrubs
        
        for i in 0..<newPrefSubruba.count{
            if  self.txtFieldSubrubs.text?.trimWhiteSpaceAndNewLine == ""{
                self.txtFieldSubrubs.text = newPrefSubruba[i].address
                self.parmSelectedSubrbs["address"] = newPrefSubruba[i].address
                self.parmSelectedSubrbs["lattitude"] = "\(newPrefSubruba[i].lattitude ?? 0.0)"
                self.parmSelectedSubrbs["longitude"] = "\(newPrefSubruba[i].longitude ?? 0.0)"
                arrTemp.append(self.parmSelectedSubrbs)
                reqParameter["preferredSuburbs"] = arrTemp
            }
            else{
                self.txtFieldSubrubs.text = txtFieldSubrubs.text! + " | " + newPrefSubruba[i].address!
                self.parmSelectedSubrbs["address"] = newPrefSubruba[i].address
                self.parmSelectedSubrbs["lattitude"] = "\(newPrefSubruba[i].lattitude ?? 0.0)"
                self.parmSelectedSubrbs["longitude"] = "\(newPrefSubruba[i].longitude ?? 0.0)"
                arrTemp.append(self.parmSelectedSubrbs)
                reqParameter["preferredSuburbs"] = arrTemp
            }
        }
        
        //        for i in 0..<self.arrSelectedSubrubs.count{
        //            if  self.txtFieldSubrubs.text == ""
        //            {
        ////                self.txtFieldSubrubs.text = arrSubrubs[i]
        //                self.parmSelectedSubrbs["addressId"] = "\(i)"
        //                self.parmSelectedSubrbs["address"] = self.arrSelectedSubrubs[i]
        //                self.parmSelectedSubrbs["lattitude"] = self.arrSelectedLatLong[i].latitude
        //                self.parmSelectedSubrbs["longitude"] = self.arrSelectedLatLong[i].longitude
        //                arrTemp.append(self.parmSelectedSubrbs)
        //                reqParameter["preferredSuburbs"] = arrTemp
        //                print("reqParameter = \(reqParameter)")
        //            }
        //            else{
        //                //self.lblSubrubs.text = "\(self.lblSubrubs.text) \(arrSubrubs[i]) \(" |")"
        ////                self.txtFieldSubrubs.text = self.txtFieldSubrubs.text! + " | " + arrSubrubs[i]
        //                self.parmSelectedSubrbs["addressId"] = "\(i)"
        //                self.parmSelectedSubrbs["address"] = self.arrSelectedSubrubs[i]//self.txtFieldSubrubs.text
        //                self.parmSelectedSubrbs["lattitude"] = self.arrSelectedLatLong[i].latitude
        //                self.parmSelectedSubrbs["longitude"] = self.arrSelectedLatLong[i].longitude
        //                arrTemp.append(self.parmSelectedSubrbs)
        //                reqParameter["preferredSuburbs"] = arrTemp
        //            }
        //            print("reqParameter[PreferedSubrubs] = \(reqParameter)")
        //        }
    }
    
}
extension ProfileAddLittleBitMoreVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
