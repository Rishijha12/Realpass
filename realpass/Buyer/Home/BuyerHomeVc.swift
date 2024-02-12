//
//  HomeVc.swift
//  Real Pass Buyer
//
//  Created by patel chandan on 09/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BuyerHomeVc: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    //MARK:- OUTLATS

    @IBOutlet weak var lblDataAvailableOrNot: UILabel!{
        didSet{
            lblDataAvailableOrNot.text = "Scan the QR code of the properties you are viewing for it to appear in your feed"
            lblDataAvailableOrNot.numberOfLines = 0
            lblDataAvailableOrNot.font = .custom(style: .Regular, size: .s16)
            lblDataAvailableOrNot.textAlignment = .center
            
        }
    }
    @IBOutlet weak var lblHome: UILabel!{
        didSet{
            lblHome.text = "HOME"
            lblHome.font = .custom(style: .Regular, size: .s20)
        }
    }
    
    @IBOutlet weak var btnSideMenu: UIButton!{
        didSet{
//            btnSideMenu.layer.masksToBounds = false
//            btnSideMenu.layer.cornerRadius = ScreenSize.SCREEN_WIDTH*0.09/2
            btnSideMenu.backgroundColor = .clear
            btnSideMenu.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var btnProfileImg: UIButton!{
        didSet{
            btnProfileImg.layer.masksToBounds = false
            btnProfileImg.layer.cornerRadius = ScreenSize.SCREEN_WIDTH*0.09/2
            btnProfileImg.clipsToBounds = true
//            self.btnProfileImg.isSelected = true
        }
    }
    
    @IBOutlet weak var btnScan: UIButton!{
        didSet{
        
        }
    }
    
    @IBOutlet weak var mytblview: UITableView!{
        didSet{
//            self.mytblview.
        }
    }
    @IBOutlet var menuView: UIView!{
        didSet{
            self.menuView.isHidden = true
            self.menuView.backgroundColor = .white
            self.menuView.layer.cornerRadius = 10.0
            self.menuView.layer.shadowColor = UIColor.black.cgColor
            self.menuView.layer.shadowOpacity = 0.2
            self.menuView.layer.shadowRadius = 5
        }
    }
    @IBOutlet var signOut: UIButton!{
        didSet{
            self.signOut.setTitle("Logout", for: .normal)
            self.signOut.setTitleColor(.black, for: .normal)
            self.signOut.titleLabel?.font = .custom(style: .Regular, size: .s16)
            self.signOut.titleLabel?.textAlignment = .left
        }
    }
    @IBOutlet var Profile: UIButton!{
        didSet{
            self.Profile.setTitle("My Profile", for: .normal)
            self.Profile.setTitleColor(.black, for: .normal)
            self.Profile.titleLabel?.font = .custom(style: .Regular, size: .s16)
             self.Profile.titleLabel?.textAlignment = .left
        }
    }
    
    @IBOutlet var ChangePass: UIButton!{
        didSet{
            self.ChangePass.setTitle("Change Password", for: .normal)
            self.ChangePass.setTitleColor(.black, for: .normal)
            self.ChangePass.titleLabel?.font = .custom(style: .Regular, size: .s16)
             self.ChangePass.titleLabel?.textAlignment = .left
        }
    }
    @IBOutlet var btnViewBroker: UIButton!{
        didSet{
            self.btnViewBroker.setTitle("View Broker", for: .normal)
            self.btnViewBroker.setTitleColor(.black, for: .normal)
            self.btnViewBroker.titleLabel?.font = .custom(style: .Regular, size: .s16)
             self.btnViewBroker.titleLabel?.textAlignment = .left
        }
    }
    
    // MARK:- Local Variable
    var isTap = false
    var currentIndex = 0
    var isCallingAPI = true
    var dataArr = [ViewPropertyListModel]()
    var refreshControl = UIRefreshControl()
    var refBool:Bool!
    
    //MARK:- LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        fatalError()
        self.view.backgroundColor = UIColor.kAppThemeColor()
        reqParameter.removeAll()
        newPrefSubruba.removeAll()
        arrPrtnr.removeAll()
        print("reqParameter = \(reqParameter)")
        print("newPrefSubruba = \(newPrefSubruba)")
        print("arrPrtnr = \(arrPrtnr)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arrPrtnr.removeAll()
        self.isTap = true
        self.navigationController?.navigationBar.isHidden = true
       self.navigationController?.setNavigationBarHidden(true, animated: true)
        print("mybool data \(mybool)")
        if mybool == false
        {
            print("hiiii.....................")
            self.lblDataAvailableOrNot.isHidden = false
            self.mytblview.isHidden = true
            self.lblDataAvailableOrNot.isHidden = true
            currentIndex = 0
            isCallingAPI = true
            refBool = true
            self.dataArr.removeAll()
            self.visitedPropertyListAPI()
//            print("visitedPropertyListAPI data.. => \(visitedPropertyListAPI())")
        }
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        mytblview.refreshControl = refreshControl
        
    }
    
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        currentIndex = 0
        isCallingAPI = true
        refBool = false
        self.dataArr.removeAll()
        self.visitedPropertyListAPI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view != self.menuView{
            self.menuView.isHidden = true
            self.isTap = true
        }
    }
    
    func setup(){
      
    }
    
    func addNavigationBackButton(){
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(image: UIImage(named: ImageName.backButtom),style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
        self.navigationItem.leftBarButtonItem!.tintColor = .black
     self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    @objc func backNavigationAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
  
    @IBAction func btnClickChangePassword(_ sender: Any) {
        self.menuView.isHidden = true
        let nextVC = ChangePasswordVc.instantiate(fromAppStoryboard: .PreLogin)
        mybool = true
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    @IBAction func btnClickMyProfile(_ sender: Any) {
        self.menuView.isHidden = true
        let nextVC = BuyerProfileVC.instantiate(fromAppStoryboard: .Buyer)
        mybool = true
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func btnClickViewBroker(_ sender: UIButton) {
        self.menuView.isHidden = true
        let nextVC = BrokerListVc.instantiate(fromAppStoryboard: .Buyer)
        mybool = true
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func btnClickLogout(_ sender: Any) {
        let alert = UIAlertController(title: APP_NAME, message: "Are you sure you want to logout?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { (action) in
            
            self.LogoutApi()
            
            }))
               alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))//  self.present(alert, animated: true,completion: )
        self.present(alert, animated: true) {
            self.menuView.isHidden = true
            self.isTap = true
        }
    }
    
    //MARK:- function
    
    func visitedPropertyListAPI()
    {
        if isCallingAPI == true
        {
            var params: [String: Any] = [ : ]
            params[RequestKeys.pageIndex] = currentIndex
            params[RequestKeys.accessToken] = APIToken
            params[RequestKeys.buyerId] = buyerId
            
            if refBool == true{
                APIManager.showLoader()
            }
            
            APIManager.shared.callPostApi(url: APIEndpoint.visitedPropertyList, parameters: params) { (result) in
               
                APIManager.hideLoader()
                switch result
                {
                case.success(let response):
                    
                    let data = JSON.init(response)
                    print("data = \(response)")
                    
                    if data["status"].intValue == 1
                    {
                       let arr = data["data"].arrayObject as? NSArray ?? NSArray()
                       if self.currentIndex == 0
                        {
                            self.dataArr.removeAll()
                            
                        }
                        
                        for dic in arr
                        {
                            let data = dic as? NSDictionary ?? NSDictionary()
                            let dict = ViewPropertyListModel.init(dictionary: data )
                            self.dataArr.append(dict!)
                            
                        }
                        
                        print("dataArr => \(self.dataArr)")
                        self.isCallingAPI = true
                        
//                        if self.dataArr.count >= 10
//                        {
//                            self.refBool = false
//                            self.currentIndex = self.currentIndex + 1
//                            self.visitedPropertyListAPI()
//                        }
                        
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
                        self.mytblview.isHidden = true
                        self.lblDataAvailableOrNot.isHidden = true
                        return
                        
                    }
                    else if data["status"].intValue == 5
                    {
                        self.isCallingAPI = false
                    }
                    self.refreshControl.endRefreshing()
                    
                    if self.dataArr.count == 0
                    {
                        self.mytblview.isHidden = true
                        self.lblDataAvailableOrNot.isHidden = false
                    }
                    else
                    {
                        self.currentIndex = self.currentIndex + 1
                        self.mytblview.isHidden = false
                        self.lblDataAvailableOrNot.isHidden = true
                        self.mytblview.reloadData()
                    }

                    break
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func LogoutApi()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.id] = buyerId
        params[RequestKeys.accessToken] = APIToken
        params[RequestKeys.usertype] = userType
        
        APIManager.showLoader()
        APIManager.shared.callPostApi(url: APIEndpoint.logout, parameters: params) { (result) in
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
                    
                    UserDefaults.standard.removeObject(forKey: Keys.userType)
                    UserDefaults.standard.removeObject(forKey: Keys.accessToken)
                    UserDefaults.standard.removeObject(forKey: Keys.isProfileSetUp)
                    UserDefaults.standard.removeObject(forKey: Keys.buyerId)
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
                
                break
            case.failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    //MARK:- TABLEVIEW METHODS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let HomeCell = tableView.dequeueReusableCell(withIdentifier: "BuyerHomeTblCell") as! BuyerHomeTblCell
        let dict = self.dataArr[indexPath.row]
        let underLineAttribute = [NSAttributedString.Key.underlineStyle : NSUnderlineStyle.thick.rawValue]
        let underLineAttributedString = NSAttributedString(string: dict.website ?? "", attributes: underLineAttribute)
        var urlString = ""
        if let websit = dict.website {
            if websit.contains("https://"){
                urlString = websit
            }else{
                urlString = "https://\(websit)"
            }
        }
      
         
        let url = URL(string: urlString)
        HomeCell.lblAddress.text = dict.address ?? ""
        HomeCell.btnWebsite.setAttributedTitle(underLineAttributedString, for: .normal)
        HomeCell.lblName.text = "\(dict.firstName ?? "") \(dict.lastName ?? "")"
        HomeCell.lblNumberOfStar.text = "\(dict.rating ?? 0)"
        
        let mydate = dict.visitedDate ?? ""
        let stringA = convertDateFormater(mydate)
        HomeCell.lblDate.text = stringA

        
        let myurlHomePic = dict.propertyPic ?? ""
        HomeCell.imgHome_Pic.sd_setImage(with: URL(string: myurlHomePic ), placeholderImage: UIImage(named: "Property" ))
        
        let myurlProfilePic = dict.profilePic ?? ""
        HomeCell.imgProfile.sd_setImage(with: URL(string: myurlProfilePic ), placeholderImage: UIImage(named: "Property" ))
        HomeCell.buttonPressed = {
            UIApplication.shared.open(url!, completionHandler: { success in
                   if success {
                       print("opened")
                   } else {
                       print("failed")
                       // showInvalidUrlAlert()
                   }
               })
        }
        
        return HomeCell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 343.00
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 315.00
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = PropertyDetailVC.instantiate(fromAppStoryboard: .Buyer)
        nextVC.currPropertyData = self.dataArr[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
        self.menuView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if self.dataArr.count % 20 == 0{
                
                print("willDisplay :\(indexPath.row)")
                print("willDisplay :\(self.dataArr.count-1)")
                print("willDisplay :\(self.currentIndex)")

                if indexPath.row == self.dataArr.count - 1 && self.currentIndex != 0
                {
                        self.visitedPropertyListAPI()
                    
                }
            }
        }

    func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM yyyy"
        return  dateFormatter.string(from: date!)

    }
    //MARK:- ACTIONS
    
    @IBAction func btnSideMenuAction(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnProfileimgAction(_ sender: UIButton) {
     if self.isTap == true{
            self.menuView.isHidden = false
            self.isTap = false
        }else{
            self.menuView.isHidden = true
            self.isTap = true
        }
    }
    
    @IBAction func btnScanAction(_ sender: UIButton) {
        let nextVC = QRScannerController.instantiate(fromAppStoryboard: .PreLogin)
        nextVC.currentStatusPro = 2
        mybool = true
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
