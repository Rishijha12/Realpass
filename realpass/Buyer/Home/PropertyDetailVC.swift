//
//  PropertyDetailVC.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 15/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit
import RangeSeekSlider
import SDWebImage
import Alamofire
import SwiftyJSON


class PropertyDetailVC: UIViewController,RangeSeekSliderDelegate {
    // MARK:- Outlets
    
    var currPropertyData = ViewPropertyListModel(dictionary: NSDictionary())
    var rating = 1.0
    var min = Int()
    var max = Int()
    
    @IBOutlet var viewSliderContainer: UIView!{
        didSet{
            self.viewSliderContainer.backgroundColor = .kAppThemeColor()
        }
    }
    @IBOutlet var viewInitialThumb: UIView!{
        didSet{
            self.viewInitialThumb.layer.cornerRadius = 5.0
            self.viewInitialThumb.layer.masksToBounds = false
            self.viewInitialThumb.clipsToBounds = true
        }
    }
    
    @IBOutlet var slidRating: RangeSeekSlider!
    
    @IBOutlet var imgViewQR: UIImageView!{
        didSet{
            self.imgViewQR.image = UIImage(named: "QRImage")
        }
    }
    @IBOutlet var lblType: UILabel!{
        didSet{
            self.lblType.text = "Agent"
            self.lblType.font = .custom(style: .Regular, size: .s12)
            self.lblType.textColor = .kLightColor()
        }
    }
    @IBOutlet var lblMobile: UILabel!{
        didSet{
            self.lblMobile.text = "0456 789 456"
            self.lblMobile.font = .custom(style: .Regular, size: .s14)
            self.lblMobile.textColor = .black
        }
    }
    @IBOutlet var lblGmail: UILabel!{
        didSet{
            self.lblGmail.text = "Samjones@gmail.com"
            self.lblGmail.font = .custom(style: .Regular, size: .s14)
            self.lblGmail.textColor = .black
        }
    }
    @IBOutlet var lblNameProperty: UILabel!{
        didSet{
            self.lblNameProperty.text = "John property"
            self.lblNameProperty.font = .custom(style: .Regular, size: .s14)
            self.lblNameProperty.textColor = .black
        }
    }
    @IBOutlet var lblName: UILabel!{
        didSet{
            self.lblName.text = "Sam Jones"
            self.lblName.font = .custom(style: .Medium, size: .s20)
            self.lblName.textColor = .black
            
        }
    }
    @IBOutlet var imgViewProfile: UIImageView!{
        didSet{
            
        }
    }
    @IBOutlet var viewAgentProfileContainer: UIView!{
        didSet{
            self.viewAgentProfileContainer.backgroundColor = .white
        }
    }
    @IBOutlet var lblUrl: UILabel!{
        didSet{
            self.lblUrl.text = "www.johnproperty.com"
            self.lblUrl.font = .custom(style: .Regular, size: .s12)
            self.lblUrl.textColor = .kLightColor()
        }
    }
    @IBOutlet var btnUrl: UIButton!{
        didSet{
            self.btnUrl.setTitleColor(.kLightColor(), for: .normal)
            self.btnUrl.titleLabel?.font = .custom(style: .Regular, size: .s12)
        }
    }
    
    @IBOutlet var lblSubrub: UILabel!{
        didSet{
            self.lblSubrub.text = "26/38 Brougham Street, Fairfield, Qld 410326/38, Qld 4103"
            self.lblSubrub.font = .custom(style: .Medium, size: .s16)
            self.lblSubrub.numberOfLines = 0
            
        }
    }
    @IBOutlet var imgProperty: UIImageView!{
        didSet{
            self.imgProperty.image = UIImage(named: "Property")
            self.imgProperty.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet var viewPropertyContainer: UIView!{
        didSet{
            self.viewPropertyContainer.backgroundColor = .white
        }
    }
    @IBOutlet var lblTen: UILabel!{
        didSet{
            self.lblTen.text = "10"
            self.lblTen.font = .custom(style: .Medium, size: .s14)
        }
    }
    @IBOutlet var lblNine: UILabel!{
        didSet{
            self.lblNine.text = "9"
            self.lblNine.font = .custom(style: .Medium, size: .s14)
        }
    }
    @IBOutlet var lblEight: UILabel!{
        didSet{
            self.lblEight.text = "8"
            self.lblEight.font = .custom(style: .Medium, size: .s14)
        }
    }
    @IBOutlet var lblSeven: UILabel!{
        didSet{
            self.lblSeven.text = "7"
            self.lblSeven.font = .custom(style: .Medium, size: .s14)
        }
    }
    @IBOutlet var lblSix: UILabel!{
        didSet{
            self.lblSix.text = "6"
            self.lblSix.font = .custom(style: .Medium, size: .s14)
        }
    }
    @IBOutlet var lblFive: UILabel!{
        didSet{
            self.lblFive.text = "5"
            self.lblFive.font = .custom(style: .Medium, size: .s14)
        }
    }
    @IBOutlet var lblFour: UILabel!{
        didSet{
            self.lblFour.text = "4"
            self.lblFour.font = .custom(style: .Medium, size: .s14)
        }
    }
    @IBOutlet var lblThree: UILabel!{
        didSet{
            self.lblThree.text = "3"
            self.lblThree.font = .custom(style: .Medium, size: .s14)
        }
    }
    @IBOutlet var lblTwo: UILabel!{
        didSet{
            self.lblTwo.text = "2"
            self.lblTwo.font = .custom(style: .Medium, size: .s14)
        }
    }
    @IBOutlet var lblone: UILabel!{
        didSet{
            self.lblone.text = "1"
            self.lblone.font = .custom(style: .Medium, size: .s14)
        }
    }
    @IBOutlet var lblZero: UILabel!{
        didSet{
            self.lblZero.text = "0"
            self.lblZero.font = .custom(style: .Medium, size: .s14)
        }
    }
    @IBOutlet var stkViewRange: UIStackView!{
        didSet{
            self.stkViewRange.backgroundColor = .kAppThemeColor()
        }
    }
    @IBOutlet var viewContainerRange: UIView!{
        didSet{
            self.viewContainerRange.backgroundColor = .kAppThemeColor()
        }
    }
    @IBOutlet var lblRateThisApp: UILabel!{
        didSet{
            self.lblRateThisApp.text = "Rate this home"
            self.lblRateThisApp.font = .custom(style: .Medium, size: .s20)
            
        }
    }
    @IBOutlet var viewOuterContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var btnUpdateRating: UIButton!{
        didSet{
            self.btnUpdateRating.setTitle("Update Rating", for: .normal)
            self.btnUpdateRating.setTitleColor(.black, for: .normal)
            self.btnUpdateRating.titleLabel?.font = .custom(style: .Regular, size: .s18)
            self.btnUpdateRating.backgroundColor = .kYellowColor()
            self.btnUpdateRating.layer.cornerRadius = 5.0
        }
    }
    
    // MARK:- Local variable
    
    
    // MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .kAppThemeColor()
        self.addEditeBuyerProfilebtn()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setPropertyData()
        self.slidRating.delegate = self
        super.viewWillAppear(animated)
        self.addNavigationBackButton()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //MARK:- Function
    
    func addEditeBuyerProfilebtn()
    {
      self.navigationItem.setRightBarButton(UIBarButtonItem.init(image: #imageLiteral(resourceName: "delete"), style: .plain, target: self, action: #selector(editebtnAction)), animated: true)
      self.navigationItem.rightBarButtonItem!.tintColor = .black
    }
    
    @objc func editebtnAction()
    {
        let alert = UIAlertController(title: APP_NAME, message: "Are you sure you want to remove this property?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "YES", style: .destructive, handler: { (action) in
            self.deleteProperty()
               }))
               alert.addAction(UIAlertAction(title: "NO", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    
    func setPropertyData()
    {
        let underLineAttribute = [NSAttributedString.Key.underlineStyle : NSUnderlineStyle.thick.rawValue]
        let underLineAttributedString = NSAttributedString(string: currPropertyData?.website ?? "", attributes: underLineAttribute)
        self.lblName.text = "\(currPropertyData!.firstName!) \(currPropertyData!.lastName!)"
        self.lblSubrub.text = currPropertyData?.address
        self.btnUrl.setAttributedTitle(underLineAttributedString, for: .normal)
        self.lblNameProperty.text = currPropertyData?.agencyName
        self.lblMobile.text = currPropertyData?.mobile
        self.lblGmail.text = currPropertyData?.email
        
        let qrImageUrl = currPropertyData?.propertyQrCode
        self.imgViewQR.sd_setImage(with: URL(string: qrImageUrl!), placeholderImage:nil)
        
        let propertyPicUrl = currPropertyData?.propertyPic
        self.imgProperty.sd_setImage(with: URL(string: propertyPicUrl!), placeholderImage:nil)
        
        let profilePicUrl = currPropertyData?.profilePic ?? ""
        self.imgViewProfile.sd_setImage(with: URL(string: profilePicUrl), placeholderImage:UIImage(named: "user" ))
        
        self.slidRating.selectedMinValue = CGFloat((currPropertyData?.rating?.rounded())!)
        if self.slidRating.selectedMinValue == 0{
            slidRating.initialColor = .kSliderColor()
        }
    }
    
    func addNavigationBackButton(){
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(image: UIImage(named: ImageName.backButtom),style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
        self.navigationItem.leftBarButtonItem!.tintColor = .black
     self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {

        min = Int(Double(minValue))
        max = Int(Double(maxValue))
        if min == 0{
            slider.initialColor = .kSliderColor()
        }else{
            slider.initialColor = .kSelectedColor()
        }
        print(minValue)
        print(maxValue)
        }
    
    @objc func backNavigationAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        let profileImage = UIImage(named: "profilePlaceholder")
//        self.imgViewProfile.makeImageCircla(profileImage!)
    }
    

    @IBAction func changeSlider(_ sender: RangeSeekSlider) {
//        self.rating = Double(sender.selectedMaxValue)
//        print(self.rating)
        
        
        
    }
    @IBAction func btnClickUpdateRating(_ sender: UIButton) {
        
        print(self.slidRating.selectedMaxValue)
        print(self.slidRating.maxValue)
        
        print(self.slidRating.selectedMinValue)
        print(self.slidRating.minValue)

        
        print("mymin => \(self.min) ")
        print("mymax => \(self.max) ")
        rating = Double(self.min)
        self.updateRatingAPI()
    }
    
    @IBAction func btnClickUrl(_ sender: UIButton) {
        var urlString = ""
        if let websit = currPropertyData?.website {
            if websit.contains("https://"){
                urlString = websit
            }else{
                urlString = "https://\(websit)"
            }
        }else{
            print("Found Nil")
        }
//        let urlString = "https://\(currPropertyData?.website ?? "www.google.com")"
        let url = URL(string: urlString)
        UIApplication.shared.open(url!, completionHandler: { success in
               if success {
                   print("opened")
               } else {
                   print("failed")
                   // showInvalidUrlAlert()
               }
           })
    }
    // MARK:- API FUNCTION
    
    func updateRatingAPI()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.buyerId] = buyerId
        params[RequestKeys.accessToken] = APIToken
        params[RequestKeys.propertyId] = currPropertyData?.propertyId
        params[RequestKeys.rating] = rating
        
        APIManager.showLoader()
        APIManager.shared.callPostApi(url: APIEndpoint.updateRating, parameters: params) { (result) in
            APIManager.hideLoader()
            switch result
            {
            case.success(let response):
                
                let data = JSON.init(response)
                print("data = \(response)")
                
                if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4 || data["status"].intValue == 5{
                    showAlertWith(message: data["message"].stringValue, inView: self)
                }
                else if data["status"].intValue == 1
                {
                    self.showAlertMessage(messageStr: data["message"].stringValue) { (btnClicked) in
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                break
            case.failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    func deleteProperty()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.buyerId] = buyerId
        params[RequestKeys.accessToken] = APIToken
        params[RequestKeys.propertyId] = currPropertyData?.propertyId
        
        
        APIManager.showLoader()
        APIManager.shared.callPostApi(url: APIEndpoint.deleteProperty, parameters: params) { (result) in
            APIManager.hideLoader()
            switch result
            {
            case.success(let response):
                
                let data = JSON.init(response)
                print("data = \(response)")
                
                if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4 || data["status"].intValue == 5{
                    showAlertWith(message: data["message"].stringValue, inView: self)
                }
                else if data["status"].intValue == 1
                {
                    self.showAlertMessage(messageStr: data["message"].stringValue) { (btnClicked) in
                        self.navigationController?.popViewController(animated: true)
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
