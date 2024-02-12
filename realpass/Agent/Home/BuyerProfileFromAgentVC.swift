//
//  ProfileVC.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 06/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import SVProgressHUD
import MarqueeLabel


class BuyerProfileFromAgentVC: UIViewController, PassArrIndDelegate {
    // MARK:- Outlets
    
    @IBOutlet weak var btnPropertiesagent: UIButton!{
        didSet{
            self.btnPropertiesagent.layer.cornerRadius = 13
            self.btnPropertiesagent.layer.borderWidth = 1
            self.btnPropertiesagent.layer.borderColor = UIColor.kPlaceholderColor().cgColor
        }
    }
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var tbldateAndtime: UITableView!
    @IBOutlet weak var dateAndtimeView: UIView!
    @IBOutlet weak var aboutmeView: UIView!
    @IBOutlet weak var lblPreferedSubrubsEmpty: UILabel!{
        didSet{
            self.lblPreferedSubrubsEmpty.isHidden = true
            lblPreferedSubrubsEmpty.font = .custom(style: .Regular, size: .s12)
            lblPreferedSubrubsEmpty.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet weak var lblTablviewPartenerbg: UILabel!{
        didSet{
            lblTablviewPartenerbg.font = .custom(style: .Regular, size: .s12)
            lblTablviewPartenerbg.textColor = UIColor.kTextColor()
        }
    }
    
    @IBOutlet var heightQrImgView: NSLayoutConstraint!
    @IBOutlet weak var tblpartenr: UITableView!
    @IBOutlet var viewSephretor: UIView!
    @IBOutlet var lblYesOrNoFinance: UILabel!{
        didSet{
//            lblYesOrNoFinance.text = "No"
            lblYesOrNoFinance.font = .custom(style: .Regular, size: .s14)//UIFont.Font_Robot_Regular(fontsize: 12.0)
            lblYesOrNoFinance.textColor = UIColor.kLightColor()
        }
    }
    @IBOutlet var lblAreYouPreAproved: UILabel!{
        didSet{
            lblAreYouPreAproved.text = "Are you pre-approved for finance?"
            lblAreYouPreAproved.font = .custom(style: .Regular, size: .s18)//.custom(style: .Regular, size: .s14)
            lblAreYouPreAproved.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var viewContentFinanceAprove: UIView!
    @IBOutlet var lblAboutme: UILabel!{
        didSet{
//            lblAboutme.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
            lblAboutme.font = .custom(style: .Regular, size: .s14)//UIFont.Font_Robot_Medium(fontsize: 14.0)
            lblAboutme.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var lblAboutMeHeading: UILabel!{
        didSet{
            lblAboutMeHeading.text = "About Me"
            lblAboutMeHeading.font = .custom(style: .Regular, size: .s18)//UIFont.Font_Robot_Medium(fontsize: 18.0)
            lblAboutMeHeading.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var lblNoOfCars: UILabel!{
        didSet{
//            lblNoOfCars.text = "2"
            lblNoOfCars.font = .custom(style: .Regular, size: .s14)//UIFont.Font_Robot_Medium(fontsize: 14.0)
            lblNoOfCars.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var viewContentCar: UIView!
    @IBOutlet var lblNoOfBathrooms: UILabel!{
        didSet{
//            lblNoOfBathrooms.text = "4"
            lblNoOfBathrooms.font = .custom(style: .Regular, size: .s14)//UIFont.Font_Robot_Medium(fontsize: 14.0)
            lblNoOfBathrooms.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var viewContentBathroom: UIView!
    @IBOutlet var lblHeadingCar: UILabel!{
        didSet{
            lblHeadingCar.text = "Car"
            lblHeadingCar.font = .custom(style: .Regular, size: .s18)//UIFont.Font_Robot_Medium(fontsize: 18.0)
            lblHeadingCar.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var lblHeadingBathrooms: UILabel!{
        didSet{
            lblHeadingBathrooms.text = "Bathrooms"
            lblHeadingBathrooms.font = .custom(style: .Regular, size: .s18)//UIFont.Font_Robot_Medium(fontsize: 18.0)
            lblHeadingBathrooms.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var lblNoOfBedrooms: UILabel!{
        didSet{
//            lblNoOfBedrooms.text = "4"
            lblNoOfBedrooms.font = .custom(style: .Regular, size: .s14)//UIFont.Font_Robot_Medium(fontsize: 14.0)
            lblNoOfBedrooms.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var viewContentBedroom: UIView!
    @IBOutlet var lblPriseRange: UILabel!{
        didSet{
//            lblPriseRange.text = "$2000 - $3000"
            lblPriseRange.font = .custom(style: .Regular, size: .s14)//UIFont.Font_Robot_Medium(fontsize: 16.0)
            lblPriseRange.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var viewContentPriseRange: UIView!
    @IBOutlet var lblHeadingBedrooms: UILabel!{
        didSet{
            lblHeadingBedrooms.text = "Bedrooms"
            lblHeadingBedrooms.font = .custom(style: .Regular, size: .s18)//UIFont.Font_Robot_Medium(fontsize: 18.0)
            lblHeadingBedrooms.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var lblHeadingPriseRange: UILabel!{
        didSet{
            lblHeadingPriseRange.text = "Price Range"
            lblHeadingPriseRange.font = .custom(style: .Regular, size: .s18)//UIFont.Font_Robot_Medium(fontsize: 18.0)
            lblHeadingPriseRange.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var lblNameOfPreferedSubrubs: UILabel!{
        didSet{
//            lblNameOfPreferedSubrubs.text = "Fortitude Valley, QLD 4006 | Newstead"
            lblNameOfPreferedSubrubs.font = .custom(style: .Regular, size: .s16)
            lblNameOfPreferedSubrubs.numberOfLines = 0//UIFont.Font_Robot_Medium(fontsize: 16.0)
            lblNameOfPreferedSubrubs.textColor = UIColor.kTextColor()
//            lblPreferedSubrubs.text = "Preferred suburbs"
            
        }
    }
    @IBOutlet var viwContenPreferedSubrub: UIView!
    @IBOutlet var lblPreferedSubrubs: UILabel!{
        didSet{
            lblPreferedSubrubs.text = "Preferred suburbs"
            lblPreferedSubrubs.font = .custom(style: .Regular, size: .s18)//UIFont.Font_Robot_Medium(fontsize: 18.0)
            lblPreferedSubrubs.textColor = UIColor.kTextColor()
        }
    }

    @IBOutlet var labHeadingPartner: UILabel!{
        didSet{
            labHeadingPartner.text = "Partner"
            labHeadingPartner.font = .custom(style: .Regular, size: .s18)//UIFont.Font_Robot_Medium(fontsize: 18.0)
            labHeadingPartner.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var lblYesOrNoContact: UILabel!{
        didSet{
//            lblYesOrNoContact.text = "No"
            lblYesOrNoContact.font = .custom(style: .Regular, size: .s15)//.custom(style: .Regular, size: .s15)
            lblYesOrNoContact.textColor = UIColor.kLightColor()
        }
    }
    @IBOutlet var lblHaveyouContact: UILabel!{
        didSet{
            lblHaveyouContact.text = "Have you been in contact with any confirmed cases of COVID 19 in the last 2 weeks?"
            lblHaveyouContact.font = .custom(style: .Regular, size: .s14)//.custom(style: .Regular, size: .s14)
            lblHaveyouContact.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var lblYesOrNoFeltUnwell: UILabel!{
        didSet{
//            lblYesOrNoFeltUnwell.text = "Yes"
            lblYesOrNoFeltUnwell.font = .custom(style: .Regular, size: .s15)
            lblYesOrNoFeltUnwell.textColor = UIColor.kLightColor()
        }
    }
    @IBOutlet var lblFeltUnwell: UILabel!{
        didSet{
            lblFeltUnwell.text = "Have you felt unwell or had flu like symptoms in the last 2 weeks?"
            lblFeltUnwell.font = .custom(style: .Regular, size: .s14)
            lblFeltUnwell.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var viwContentQuestion: UIView!
    @IBOutlet var lblQuestion: UILabel!{
        didSet{
//            lblQuestion.text = "Questions"
            lblQuestion.font = .custom(style: .Regular, size: .s18)
            lblQuestion.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var lblCallSms: UILabel!{
        didSet{
//            lblCallSms.text = "SMS, Call"
            lblCallSms.font = .custom(style: .Regular, size: .s14)
            lblCallSms.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var viewWayOfContact: UIView!
    @IBOutlet var lblHowWouldContact: UILabel!{
        didSet{
            lblHowWouldContact.text = "How would you like to be contacted?"
            lblHowWouldContact.font = .custom(style: .Regular, size: .s18)
            lblHowWouldContact.textColor = UIColor.kTextColor()
        }
    }
    @IBOutlet var imgOfProfile: UIImageView!{
        didSet{
            //            imgOfProfile.image =  UIImage(named: ImageName.uploadPhoto)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                let profileImage = UIImage(named: "user")
                self.imgOfProfile.makeImageCircla(profileImage!)
            }
        }
    }
    @IBOutlet var lblMobile: UILabel!{
        didSet{
//            lblMobile.text = "+61 - 1234 567 890"
            lblMobile.font = .custom(style: .Regular, size: .s14)
            lblMobile.textColor = UIColor.kLightColor()
        }
    }
    @IBOutlet var lblEmail: MarqueeLabel!{
        didSet{
//            lblEmail.text = "Johndoe@gmail.com"
            lblEmail.font = .custom(style: .Regular, size: .s14)
            lblEmail.textColor = UIColor.kLightColor()
            lblEmail.speed = .duration(15.0)
        }
    }
    @IBOutlet var lblName: MarqueeLabel!{
        didSet{
//            lblName.text = "John Doe"
            lblName.font = .custom(style: .Regular, size: .s19)
            lblName.textColor = UIColor.kTextColor()
            lblName.speed = .duration(15.0)
        }
    }
    @IBOutlet var lblNoTimeDateSelected: UILabel!{
        didSet{
            lblNoTimeDateSelected.font = .custom(style: .Regular, size: .s14)
        }
    }
    @IBOutlet var ViewProfileInfo: UIView!
    @IBOutlet var imgViewQR: UIImageView!{
        didSet{
            //            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            //                self.imgViewQR.makeImageCircla(profileImage!)
//            self.imgViewQR.image = UIImage(named: "QRImage")
            
            //            }
        }
    }
    @IBOutlet var ViewQRContent: UIView!{
        didSet{
            self.ViewQRContent.backgroundColor = .clear
        }
    }
    @IBOutlet var viewContent: UIView!{
        didSet{
            self.viewContent.backgroundColor = UIColor.kAppThemeColor()
        }
    }
    
    // MARK:- VARIABLE
    
    @IBOutlet var tblPartnerHeight: NSLayoutConstraint!
    @IBOutlet var partnerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var dateAndtimeViewHight: NSLayoutConstraint!
    @IBOutlet weak var tblDateandtimehight: NSLayoutConstraint!
    
    
    @IBOutlet weak var aboutviewHight: NSLayoutConstraint!
    @IBOutlet weak var aboutviewTop: NSLayoutConstraint!
    @IBOutlet weak var lblaboutmeMainHight: NSLayoutConstraint!
    @IBOutlet weak var lblaboutmeHight: NSLayoutConstraint!
    @IBOutlet weak var preferedHeight: NSLayoutConstraint!
    
    var arrPartner = [Partners]()
    var arrTimeandDate = [AvailabilityTime]()
    var arrPreferredSuburbs = [PreferredSuburbs]()
    var tempText = ""
    var model = GetBuyerProfileModel(dictionary: NSDictionary())
    var buyerFromAgentId = 0
    var arrPropertyIndex = [Int]()
    var arrPropertyId = [Int]()
    
    
    
    // MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.kAppThemeColor()
        self.setup()
        self.addNavigationBackButton()
        self.getBuyerProfileApi()
        let yourNumber = 100000
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.groupingSeparator = ","
        let formattedNumber = numberFormatter.string(from: NSNumber(value:yourNumber))
        print("formattedNumber data => \(formattedNumber)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        arrPrtnr.removeAll()
        lblTablviewPartenerbg.isHidden = true
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(false, animated: false)
//        self.aboutmeView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = false
//        self.aboutmeView.heightAnchor.constraint(equalToConstant: 0).isActive = false
//        self.aboutmeView.isHidden = true
        
       
        
        self.addNavigationBackButton()
//        self.addEditeBuyerProfilebtn()
        self.getBuyerProfileApi()
        APIManager.showLoader()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // MARK:- Custumaize NavigationItem
    func addNavigationBackButton(){
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(image: UIImage(named: ImageName.backButtom),style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
        self.navigationItem.leftBarButtonItem!.tintColor = .black
        
    }
    
//    func addEditeBuyerProfilebtn()
//    {
//      self.navigationItem.setRightBarButton(UIBarButtonItem.init(image: #imageLiteral(resourceName: "edit"), style: .plain, target: self, action: #selector(editebtnAction)), animated: true)
//      self.navigationItem.rightBarButtonItem!.tintColor = .black
//    }
    
    @IBAction func btnPropertiesagentAction(_ sender: UIButton) {
        
        print("success......")
        
        
        isFromHome = false
        arrpropertyInd.removeAll()
        let myPropertyVC = MyPropertyListVC.instantiate(fromAppStoryboard: .Agent)
        myPropertyVC.buyerId = model?.buyerId ?? 0
        myPropertyVC.buyerName = model?.firstName ?? ""
        myPropertyVC.delegate = self
        self.navigationController?.pushViewController(myPropertyVC, animated: true)
        
    }
    
    func getArrInd(arrInd: [Int], arrId: [Int]) {
        self.arrPropertyIndex = arrInd
        self.arrPropertyId = arrId
    }
    
    
    @objc func backNavigationAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- ACTION
    
//
//    @objc func editebtnAction()
//    {
//
//        let obj = self.storyboard?.instantiateViewController(withIdentifier: "EditBuyerProfileVc") as! EditBuyerProfileVc
//        obj.getbuyerdata = self.model
////        obj.title = "Edit Profile"
////        APIManager.hideLoader()
//        self.navigationController?.pushViewController(obj, animated: true)
////        DispatchQueue.main.async(execute: {
////            APIManager.showLoader()
////        })
//
//    }
//
    // MARK:- Setup
    func setup(){
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "BUYER PROFILE"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        transparentNav(nav: self.navigationController!)
    }
    
    func getBuyerProfileApi()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.accessToken] = APIToken
        params[RequestKeys.buyerId] = buyerFromAgentId
        params[RequestKeys.agentId] = agentId
        print("agentId = \(agentId)")
        
        APIManager.showLoader()
        APIManager.shared.callPostApi(url: APIEndpoint.getBuyerProfile, parameters: params) { (result) in
            APIManager.hideLoader()
            switch result
            {
            case.success(let response):
                
                let data = JSON.init(response)
                
//                let arr = data["data"].arrayObject as? NSArray
                
                if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 5
                {
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
                    
                    self.model = GetBuyerProfileModel(dictionary: mydata.dictionaryObject! as NSDictionary)
                    print("My Data = \(mydata)")
                    
//                    self.lblAboutme.text = self.model?.aboutMe ?? ""
                    let profileImageUrl = self.model?.profilePic
                    
                    let qrImageUrl = self.model?.qrCode
                    if qrImageUrl == ""{
                        self.heightQrImgView.constant = 0
                        self.btnPropertiesagent.isHidden = false
                    }else{
                        self.heightQrImgView.constant = 269.5
                        self.btnPropertiesagent.isHidden = true
                    }
                    self.imgViewQR.sd_setImage(with: URL(string: qrImageUrl!), placeholderImage:nil)
                    self.imgOfProfile.sd_setImage(with: URL(string: profileImageUrl!), placeholderImage:UIImage(named: "user"))
                    print("profileImageUrl data => \(String(describing: profileImageUrl))")
                   
                    self.lblEmail.text = self.model?.email ?? ""
//                    self.lblYesOrNoFinance.text = self.model?.preApprovedFinance ?? ""
                     if self.model?.preApprovedFinance == "true"{
                        self.lblYesOrNoFinance.text = "Yes"
                    }
                     if self.model?.preApprovedFinance == "false"{
                        self.lblYesOrNoFinance.text = "No"
                    }
                    if self.model?.preApprovedFinance == ""{
                        self.lblYesOrNoFinance.text = "N/A"
                    }
                    
                    self.lblName.text = "\(self.model?.firstName ?? "") \(self.model?.lastName ?? "")"
                    let myNumber = self.model?.mobile ?? ""
                    self.lblMobile.text = myNumber //"+\(61 ) \(myNumber.formateMobileNumber())"
                    
                    if self.model?.hasSMS == "true" && self.model?.hasCall == "true" && self.model?.hasEmail == "true"
                    {
                       self.lblCallSms.text = "\("SMS"+", "+"Call"+", "+"Email")"
                    }
                    else if self.model?.hasSMS == "true" && self.model?.hasCall == "true"
                    {
                       self.lblCallSms.text = "\("SMS"+", "+"Call")"
                    }
                    else if self.model?.hasSMS == "true" && self.model?.hasEmail == "true"
                    {
                        self.lblCallSms.text = "\("SMS"+", "+"Email")"
                    }
                    else if self.model?.hasCall == "true" && self.model?.hasEmail == "true"
                    {
                        self.lblCallSms.text = "\("Call"+", "+"Email")"
                    }
                    else if self.model?.hasSMS == "true"
                    {
                        self.lblCallSms.text = "\("SMS")"
                    }
                    else if self.model?.hasCall == "true"
                    {
                        self.lblCallSms.text = "\("Call")"
                    }
                    else if self.model?.hasEmail == "true"
                    {
                        self.lblCallSms.text = "\("Email")"
                    }
                    else if self.model?.hasSMS == "" && self.model?.hasCall == "" && self.model?.hasEmail == ""{
                        self.lblCallSms.text = "N/A"
                    }
                    else
                    {
                        self.lblCallSms.text = ""
                    }
                    if self.model?.answer1 == "" && self.model?.answer2 == "" {
                        self.lblYesOrNoFeltUnwell.text = "N/A"
                        self.lblYesOrNoContact.text = "N/A"
                    }else{
                        self.lblYesOrNoFeltUnwell.text = self.model?.answer1 ?? ""
                        self.lblYesOrNoContact.text = self.model?.answer2 ?? ""
                    }
                   
                    let minP = self.model?.minPrice ?? "0"
                    let number1 = Int(minP.trimWhiteSpaceAndNewLine)
//                    print(number1!.delimiter) // 31,908,551,587
                    
                    let maxP = self.model?.maxPrice ?? "0"
                    let number2 = Int(maxP.trimWhiteSpaceAndNewLine)
//                    print(number2!.delimiter)
                    if maxP == "" && minP == ""{
                        self.lblPriseRange.text = "N/A"
                    }else{
                        self.lblPriseRange.text = "\("$")\(number1!.delimiter) - \("$")\(number2!.delimiter)"
                    }
                    if self.model?.qrCode == ""{
                        self.lblNoOfBedrooms.text = "N/A"
                        self.lblNoOfBathrooms.text = "N/A"
                        self.lblNoOfCars.text = "N/A"
                    }else{
                        self.lblNoOfBedrooms.text = "\(self.model?.bedrooms ?? 0)"
                        self.lblNoOfBathrooms.text = "\(self.model?.bathrooms ?? 0)"
                        self.lblNoOfCars.text = "\(self.model?.cars ?? 0)"
                    }
                    
                
                    self.arrPartner = self.model?.partners! as! [Partners]
                    self.partner()
                    
                    self.arrPreferredSuburbs = self.model?.preferredSuburbs! as! [PreferredSuburbs]
                    self.suburbs()
                    
                    self.arrTimeandDate = self.model?.availabilityTime as! [AvailabilityTime]
                    self.timeSelection()
                    
                    self.AboutView()
                }
                break
            case.failure(let error):
             print(error.localizedDescription)
            }
        }
    }
    func partner()
    {
        if arrPartner.count == 0
        {
            lblTablviewPartenerbg.isHidden = false
            self.tblpartenr.isHidden = true
//            if model?.qrCode == ""{
//                lblTablviewPartenerbg.text =
//            }else{
                lblTablviewPartenerbg.text = "N/A"
//            }
        }
        else
        {
            lblTablviewPartenerbg.isHidden = true
            self.tblpartenr.isHidden = false
            
            let tblheight = arrPartner.count * 80
            let mainPartnerViewHeight = tblheight + 25 + 10
            self.tblPartnerHeight.constant = CGFloat(tblheight)
            self.partnerViewHeight.constant = CGFloat(mainPartnerViewHeight)
            self.tblpartenr.reloadData()
        }
    }
    
    func timeSelection()
    {
        if arrTimeandDate.count == 0
        {
//            if model?.qrCode == ""{
//                lblTablviewPartenerbg.text = "N/A"
                print("Implement here....")
                self.tbldateAndtime.isHidden = true
                self.lblNoTimeDateSelected.text = "N/A"
                self.lblNoTimeDateSelected.backgroundColor = .white
//            }else{
//                self.dateAndtimeViewHight.constant = CGFloat(0)
//            }
            
        }
        else
        {
            self.tbldateAndtime.isHidden = false
            self.lblNoTimeDateSelected.isHidden = true
            let tblheight = arrTimeandDate.count * 45
            let mainPartnerViewHeight = tblheight + 25 + 9
            self.tblDateandtimehight.constant = CGFloat(tblheight)
            self.dateAndtimeViewHight.constant = CGFloat(mainPartnerViewHeight)
            self.tbldateAndtime.reloadData()
        }
    }
    
    func suburbs()
    {
        if arrPreferredSuburbs.count == 0
        {
            self.lblPreferedSubrubsEmpty.isHidden = false
            self.lblNameOfPreferedSubrubs.isHidden = true
            self.lblNameOfPreferedSubrubs.font = .custom(style: .Regular, size: .s12)
//            if model?.qrCode == ""{
                self.lblPreferedSubrubsEmpty.text = "N/A"
//            }else{
//                self.lblPreferedSubrubsEmpty.text = "You don't have any seleceted suburbs yet"
//            }
 
        }
        else
        {
            self.lblPreferedSubrubsEmpty.isHidden = true
            self.lblNameOfPreferedSubrubs.isHidden = false
            self.lblNameOfPreferedSubrubs.text = ""
            for i in 0..<arrPreferredSuburbs.count
            {
                print("arrPreferredSuburbs.count data =>>> \(arrPreferredSuburbs.count)")
                if  self.lblNameOfPreferedSubrubs.text == ""
                {
                    self.lblNameOfPreferedSubrubs.text = arrPreferredSuburbs[i].address ?? ""
                    print(lblNameOfPreferedSubrubs.text)
                    print(arrPreferredSuburbs[i].address)
//                    let lblNameOfPrefSubHeight = self.lblNameOfPreferedSubrubs.bounds.height
//                    self.preferedHeight.constant = (lblNameOfPrefSubHeight + 20)
                }
                else
                {
                    self.lblNameOfPreferedSubrubs.text = lblNameOfPreferedSubrubs.text! + " | " + arrPreferredSuburbs[i].address!
                    print("\(self.lblNameOfPreferedSubrubs.text)")
                    print(arrPreferredSuburbs[i].address)
                  
                }
                
            }
        }
    }
    
    func AboutView()
    {
        var abotdata = model?.aboutMe ?? ""
        let font = UIFont.custom(style: .Regular, size: .s16)
        if abotdata == ""{
            abotdata = "N/A"
        }
        lblAboutme.sizeToFit()
        let height = heightForView(text: abotdata, font: font, width: self.aboutmeView.frame.width)
        
        print("height = \(height)")
//        self.aboutviewHight.constant = height + 30
//        if abotdata == ""{
//                self.lblaboutmeHight.constant = height
//                self.lblaboutmeMainHight.constant = height + 20
//                self.aboutviewHight.constant = height + 20 + 35
//                self.lblAboutme.text = "N/A"
//                self.aboutviewTop.constant = 20
//
//                self.lblAboutme.font = UIFont.custom(style: .Regular, size: .s16)
//                self.lblAboutme.numberOfLines = 0
//                self.lblAboutme.lineBreakMode = .byWordWrapping
//        }else{
            self.lblaboutmeHight.constant = height
            self.lblaboutmeMainHight.constant = height + 20
            self.aboutviewHight.constant = height + 20 + 35
            self.lblAboutme.text = abotdata
            self.aboutviewTop.constant = 20
            
            self.lblAboutme.font = UIFont.custom(style: .Regular, size: .s16)
            self.lblAboutme.numberOfLines = 0
            self.lblAboutme.lineBreakMode = .byWordWrapping
            
//        }
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text

        label.sizeToFit()
        return label.frame.height
    }

   
        
}

extension BuyerProfileFromAgentVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var count = 0
        if tableView == tblpartenr
        {
            return arrPartner.count
        }
        else
        {
            return arrTimeandDate.count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tblpartenr
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "partnerCell") as! PartenerProfileTabCell
            if indexPath.row == arrPartner.count - 1{
                cell.viewSephretor.isHidden = true
            }else{
                cell.viewSephretor.isHidden = false
            }
            cell.lblname.text =  "\(arrPartner[indexPath.row].firstName ?? "")" + " \( arrPartner[indexPath.row].lastName ?? "")"
            cell.lblemail.text = arrPartner[indexPath.row].email ?? ""
            let num = arrPartner[indexPath.row].phone?.replacingOccurrences(of: "+61", with: "", options: .literal, range: nil)
            cell.lblnumber.text = "\("+61 ")\(num?.formateMobileNumber() ?? "")"
            
            
            
            return cell
        }
        else
        {
            let celldate = tableView.dequeueReusableCell(withIdentifier: "timecell") as! Date_and_Time_BuyerProfileTabCell
            celldate.lblday.text = arrTimeandDate[indexPath.row].day
            celldate.lbltime.text = "\(arrTimeandDate[indexPath.row].startTime ?? "")"+" - "+"\(arrTimeandDate[indexPath.row].endTime ?? "")"
            return celldate
        }
    }
    
    
}


