//
//  HomeVc.swift
//  Real Pass Buyer
//
//  Created by patel chandan on 09/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit
import Floaty
import Alamofire
import SwiftyJSON
protocol PassArrIndDelegate {
    func getArrInd(arrInd: [Int], arrId: [Int])
}
class MyPropertyListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //MARK:- OUTLATS
    
    @IBOutlet weak var lblDataAvailableOrNot: UILabel!{
        didSet{
            lblDataAvailableOrNot.text = "No property added yet."
            lblDataAvailableOrNot.numberOfLines = 0
            lblDataAvailableOrNot.font = .custom(style: .Regular, size: .s16)
            lblDataAvailableOrNot.textAlignment = .center
            
        }
    }
    @IBOutlet weak var lblHome: UILabel!{
        didSet{
            lblHome.text = "MY PROPERTIES"
            lblHome.font = .custom(style: .Regular, size: .s20)
        }
    }
    
    @IBOutlet weak var btnSideMenu: UIButton!{
        didSet{
            btnSideMenu.layer.masksToBounds = false
            btnSideMenu.layer.cornerRadius = ScreenSize.SCREEN_WIDTH*0.09/2
            btnSideMenu.backgroundColor = .clear
            btnSideMenu.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var viewLink: UIView!{
        didSet{
            
            viewLink.layer.cornerRadius = 10
            viewLink.clipsToBounds = true
           // viewLink.backgroundColor = .kBlueColor()
        }
    }
    
    @IBOutlet weak var btnLink: UIButton!{
        didSet{
            self.btnLink.setTitle("Link Properties", for: .normal)
            self.btnLink.setTitleColor(.white, for: .normal)
            self.btnLink.titleLabel?.font = .custom(style: .Regular, size: .s20)
            self.btnLink.backgroundColor = .kBtnBlueColor()
        }
    }
    
    @IBOutlet weak var mytblview: UITableView!{
        didSet{
            
        }
    }
    
    
    // MARK:- Local Variable
    var isTap = false
    var currentIndex = 0
    var isCallingAPI = true
    var dataArr = [ViewPropertyListModel]()
    var refreshControl = UIRefreshControl()
    var refBool:Bool!
//    var arrpropertyInd = [Int]()
    var arrPropetyId = [Int]()
    var delegate : PassArrIndDelegate?
//    let floaty = Floaty()
    var buyerId = 0
    var buyerName = ""
    //MARK:- LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.addSubview(floaty)
//        floaty.buttonColor = .kYellowColor()
//        arrpropertyInd.removeAll()
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
        
        if isFromHome == true{
            self.viewLink.isHidden = true
            self.btnLink.isHidden = true
            self.lblHome.text = "MY PROPERTIES"
            self.mytblview.allowsMultipleSelection = false
        }else{
            self.viewLink.isHidden = false
            self.btnLink.isHidden = false
            self.lblHome.text = "SELECT PROPERTIES"
            self.mytblview.allowsMultipleSelection = true
            if arrpropertyInd.count > 0 {
                self.btnLink.setTitle("Link Properties (\(arrpropertyInd.count)"+")", for: .normal)
            }
            
        }
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: false)
        arrPrtnr.removeAll()
        self.isTap = true
        
        print("mybool data \(mybool)")
        print("hiiii.....................")
        self.lblDataAvailableOrNot.isHidden = false
        self.mytblview.isHidden = true
        self.lblDataAvailableOrNot.isHidden = true
        currentIndex = 0
        isCallingAPI = true
        refBool = true
        self.dataArr.removeAll()
        self.getMyProprtyList()
//        floaty.tar
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        mytblview.refreshControl = refreshControl
        
    }
    
    @objc func linkProperties(_ sender: AnyObject){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        
        currentIndex = 0
        isCallingAPI = true
        refBool = false
        self.dataArr.removeAll()
        self.getMyProprtyList()
    }
    
    
    
    //MARK:- function
    
    func getMyProprtyList()
    {
        if isCallingAPI == true
        {
            var params: [String: Any] = [ : ]
            params[RequestKeys.pageIndex] = currentIndex
            params[RequestKeys.accessToken] = APIToken
            params[RequestKeys.agentId] = agentId

            params[RequestKeys.buyerId] = self.buyerId
//            buyerId
            if refBool == true{
                APIManager.showLoader()
            }
            
            APIManager.shared.callPostApi(url: APIEndpoint.getMyProprtyList, parameters: params) { (result) in
                
                APIManager.hideLoader()
                switch result
                {
                case.success(let response):
                    
                    let data = JSON.init(response)
                    print("data = \(response)")
                    
                    var countProperty = data["agentPropertyCount"].intValue
                    print("countProperty.. \(countProperty)")
                    
                    if data["status"].intValue == 1
                    {
                        let arr = data["data"].arrayObject as? NSArray
                        if self.currentIndex == 0
                        {
                            self.dataArr.removeAll()
                            
                        }
                        
                        for dic in arr!
                        {
                            let dict = ViewPropertyListModel.init(dictionary: dic as! NSDictionary)
                            self.dataArr.append(dict!)
                            
                        }
                        
                        print("dataArr => \(self.dataArr)")
                        self.isCallingAPI = true
                        
//                        if self.dataArr.count >= 10
//                        {
//                            self.refBool = false
//                            self.currentIndex = self.currentIndex + 1
//                            self.getMyProprtyList()
//                        }
                        
                    }
                    
                    else if data["status"].intValue == 4{
                        
                        let alert = UIAlertController(title: APP_NAME, message: "You are login to another device Please login to this device to continue", preferredStyle: .alert)
                        let Yes = UIAlertAction(title: "Ok", style: .destructive)
                        { (btnOkAction) in
                            
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
                    else if data["status"].intValue == 5
                    {
                        self.isCallingAPI = false
                    }
                    self.refreshControl.endRefreshing()
                    
                    if self.dataArr.count == 0
                    {
                        self.mytblview.isHidden = true
                        self.lblDataAvailableOrNot.isHidden = false
                        self.viewLink.isHidden = true
                        self.btnLink.isHidden = true
                        if isFromHome
                        {
                            self.lblDataAvailableOrNot.text = "You haven't added any properties yet."
                        }
                        else
                        {
                           
                              if countProperty == 0
                               {
                                   self.lblDataAvailableOrNot.text = "You haven't added any properties yet."
                               }
                            else if countProperty > 0
                            {
                                self.lblDataAvailableOrNot.text = "You don't have any properties to link."
                            }
                           
                        }
                    }
                    else
                    {
                        self.currentIndex = self.currentIndex + 1
                        self.mytblview.isHidden = false
                        self.lblDataAvailableOrNot.isHidden = true
                        if isFromHome == false{
                            self.viewLink.isHidden = false
                            self.btnLink.isHidden = false
                        }else{
                            self.viewLink.isHidden = true
                            self.btnLink.isHidden = true
                        }
                        self.mytblview.reloadData()
                    }
                    break
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func setBuyerPropertylist()
    {
        if isCallingAPI == true
        {
            var params: [String: Any] = [ : ]
            params[RequestKeys.pageIndex] = currentIndex
            params[RequestKeys.accessToken] = APIToken
            params[RequestKeys.agentId] = agentId
            params[RequestKeys.buyerId] = self.buyerId
            
//            buyerId
            if refBool == true{
                APIManager.showLoader()
            }
            
            APIManager.shared.callPostApi(url: APIEndpoint.getMyProprtyList, parameters: params) { (result) in
                
                APIManager.hideLoader()
                switch result
                {
                case.success(let response):
                    
                    let data = JSON.init(response)
                    print("data = \(response)")
                    
                    if data["status"].intValue == 1
                    {
                        let arr = data["data"].arrayObject as? NSArray
                        if self.currentIndex == 0
                        {
                            self.dataArr.removeAll()
                            
                        }
                        
                        for dic in arr!
                        {
                            let dict = ViewPropertyListModel.init(dictionary: dic as! NSDictionary)
                            self.dataArr.append(dict!)
                            
                        }
                        
                        print("dataArr => \(self.dataArr)")
                        self.isCallingAPI = true
                        
                        if self.dataArr.count >= 10
                        {
                            self.refBool = false
                            self.currentIndex = self.currentIndex + 1
                            self.getMyProprtyList()
                        }
                        
                    }
                    
                    else if data["status"].intValue == 4{
                        
                        let alert = UIAlertController(title: APP_NAME, message: "You are login to another device Please login to this device to continue", preferredStyle: .alert)
                        let Yes = UIAlertAction(title: "Ok", style: .destructive)
                        { (btnOkAction) in
                            
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
                    else if data["status"].intValue == 5
                    {
                        self.isCallingAPI = false
                    }
                    self.refreshControl.endRefreshing()
                    
                    if self.dataArr.count == 0
                    {
                        self.mytblview.isHidden = true
                        self.lblDataAvailableOrNot.isHidden = false
                        self.viewLink.isHidden = true
                        self.btnLink.isHidden = true
                    }
                    else
                    {
                        self.mytblview.isHidden = false
                        self.lblDataAvailableOrNot.isHidden = true
                        if isFromHome == false{
                            self.viewLink.isHidden = false
                            self.btnLink.isHidden = false
                        }else{
                            self.viewLink.isHidden = true
                            self.btnLink.isHidden = true
                        }
                        self.mytblview.reloadData()
                    }
                    
                    break
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    
    //MARK:- TABLEVIEW METHODS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let HomeCell = tableView.dequeueReusableCell(withIdentifier: "BuyerHomeTblCell") as! BuyerHomeTblCell
        if arrpropertyInd.contains(indexPath.row){
            HomeCell.cellView.backgroundColor = .kLightBlueColor()
        }else{
            HomeCell.cellView.backgroundColor = .white
        }
        let dict = self.dataArr[indexPath.row]
        let underLineAttribute = [NSAttributedString.Key.underlineStyle : NSUnderlineStyle.thick.rawValue]
        let underLineAttributedString = NSAttributedString(string: dict.website! , attributes: underLineAttribute)
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
        
        HomeCell.lblNumberOfStar.text = "\(dict.rating ?? 0)"
        
        
        let myurlHomePic = dict.propertyPic ?? ""
        HomeCell.imgHome_Pic.sd_setImage(with: URL(string: myurlHomePic ), placeholderImage: UIImage(named: "Property" ))
        
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
        return 280.00
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.dataArr.count % 20 == 0{
            
            print("willDisplay :\(indexPath.row)")
            print("willDisplay :\(self.dataArr.count-1)")
            print("willDisplay :\(self.currentIndex)")

            if indexPath.row == self.dataArr.count - 1 && self.currentIndex != 0
            {
                self.getMyProprtyList()
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let dict = self.dataArr[indexPath.row]
        if isFromHome == true{
            let nextVC = PropertyVisitorListVC.instantiate(fromAppStoryboard: .Agent)
            nextVC.propertyId = self.dataArr[indexPath.row].propertyId!
            nextVC.currentAddress = self.dataArr[indexPath.row].address!
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        }else{
            if arrpropertyInd.contains(indexPath.row){
                let value = arrpropertyInd.firstIndex(of: indexPath.row)
                arrpropertyInd.remove(at: value ?? 0)
//                self.arrPropetyId.remove(at: indexPath.row)
                let propId = arrPropetyId.firstIndex(of: indexPath.row)
                arrPropetyId.remove(at: propId ?? 0)
            }else{
                arrpropertyInd.append(indexPath.row)
                self.arrPropetyId.append(dict.propertyId!)
            }
            if arrpropertyInd.count > 0 {
                self.btnLink.setTitle("Link Properties (\(arrpropertyInd.count)"+")", for: .normal)
            }else{
                self.btnLink.setTitle("Link Properties", for: .normal)
            }
        }
        tableView.reloadData()
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
    //
    @IBAction func btnSideMenuAction(_ sender: UIButton) {
        isBackClick = true
        self.delegate?.getArrInd(arrInd: arrpropertyInd, arrId: self.arrPropetyId)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnClickLink(_ sender: UIButton) {
        // Implement selectable cell
        if self.buyerId == 0
        {
            isBackClick = false
            self.delegate?.getArrInd(arrInd: arrpropertyInd, arrId: self.arrPropetyId)
            self.navigationController?.popViewController(animated: true)
        }
        else
        {
            if self.arrPropetyId.count > 0
            {
                var params: [String: Any] = [ : ]
                params[RequestKeys.propertyList] = self.arrPropetyId
                params[RequestKeys.accessToken] = APIToken
                params[RequestKeys.agentId] = agentId
                params[RequestKeys.buyerId] = self.buyerId
                
                //            buyerId
                if refBool == true{
                    APIManager.showLoader()
                }
                
                APIManager.shared.callPostApi(url: APIEndpoint.setBuyerProperties, parameters: params) { (result) in
                    
                    APIManager.hideLoader()
                    switch result
                    {
                    case.success(let response):
                        
                        let data = JSON.init(response)
                        print("data = \(response)")
                        
                        if data["status"].intValue == 1
                        {
                            self.showAlertMessage(messageStr: data["message"].stringValue) { (okbtnAction) in
                                self.navigationController?.popViewController(animated: true)
                            }
                            
                        }
                        
                        else if data["status"].intValue == 4{
                            
                            let alert = UIAlertController(title: APP_NAME, message: "You are login to another device Please login to this device to continue", preferredStyle: .alert)
                            let Yes = UIAlertAction(title: "Ok", style: .destructive)
                            { (btnOkAction) in
                                
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
                        
                        break
                    case.failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        else
        {
            // pop
            self.navigationController?.popViewController(animated: true)
        }
        
    }
        
  }
}
