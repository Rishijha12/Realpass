//
//  HomeVc.swift
//  RealPass
//
//  Created by patel chandan on 05/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import SwiftyJSON

class AgentHomeVc: UIViewController,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate,PassArrIndDelegate {
    
    //MARK:- OUTLATS
    
    
    @IBOutlet weak var btnSerch: UIButton!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var lblDataNotAVailaible: UILabel!
    @IBOutlet weak var btnSidemenuHideShow: UIButton!
    @IBOutlet weak var lblHomeTitle: UILabel!{
        didSet{
            lblHomeTitle.text = "HOME"
            lblHomeTitle.font = UIFont.custom(style: .Regular, size: .s17)
        }
    }
    
    @IBOutlet weak var btnScanQR: UIButton!{
        didSet{
            btnScanQR.layer.cornerRadius = 12
            btnScanQR.titleLabel?.font = UIFont.custom(style: .Medium, size: .s16)
            btnScanQR.titleLabel?.textColor = UIColor.kWhiteColur()
        }
    }
    
    @IBOutlet weak var btnCreateBuyerProfile: UIButton!{
        didSet{
            btnCreateBuyerProfile.layer.cornerRadius = 12
            btnCreateBuyerProfile.titleLabel?.font = UIFont.custom(style: .Regular, size: .s16)
            btnCreateBuyerProfile.titleLabel?.textColor = UIColor.kTextColor()
        }
    }
    
    @IBOutlet weak var homeTblView: UITableView!{
        didSet{
            homeTblView.layer.cornerRadius = 20
            homeTblView.separatorInset.right = 15
        }
    }
    @IBOutlet weak var btnEdit: UIButton!{
        didSet{
            
        }
    }
    
    @IBOutlet weak var sideMenuView: UIView!{
        didSet{
            self.sideMenuView.layer.cornerRadius = 12
            sideMenuView.layer.shadowColor = UIColor.black.cgColor;
            sideMenuView.layer.shadowOffset = .zero;
            sideMenuView.layer.shadowRadius = 3.0;
            sideMenuView.layer.shadowOpacity = 0.3;
            sideMenuView.layer.masksToBounds = false;
        }
    }
    
    @IBOutlet weak var btnMyProfile: UIButton!{
        didSet{
            btnMyProfile.titleLabel?.font = UIFont.custom(style: .Regular, size: .s16)
        }
    }
    
    @IBOutlet weak var btnChangePassword: UIButton!{
        didSet{
            btnChangePassword.titleLabel?.font = UIFont.custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var btnMyProperties: UIButton!{
        didSet{
            btnMyProperties.titleLabel?.font = UIFont.custom(style: .Regular, size: .s16)
        }
    }
    
    @IBOutlet weak var btnLogout: UIButton!{
        didSet{
            btnLogout.titleLabel?.font = UIFont.custom(style: .Regular, size: .s16)
        }
    }
    
    //MARK:- VARIABLE DECLRATION
    
    var arrdata = [#imageLiteral(resourceName: "user"),#imageLiteral(resourceName: "user"),#imageLiteral(resourceName: "user"),#imageLiteral(resourceName: "user"),#imageLiteral(resourceName: "user"),#imageLiteral(resourceName: "user"),#imageLiteral(resourceName: "user"),#imageLiteral(resourceName: "user"),#imageLiteral(resourceName: "user"),#imageLiteral(resourceName: "user")]
    
    var dataArr = [GetUserDataModel]()
    
    var sideMenuOpen = false
    var gesture : UITapGestureRecognizer?
    var currentIndex = 0
    var isCallingAPI = true
    var refreshControl = UIRefreshControl()
    var refBool:Bool!
    var arrPropertyIndex = [Int]()
    var arrPropertyId = [Int]()
    
    
    //MARK:- LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let nav = self.navigationController {
            nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
            transparentNav(nav: self.navigationController!)
        }

        navigationController?.setNavigationBarHidden(true, animated: true)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(scannerNotification),
            name: NSNotification.Name("rawValue: userKey.scanner"),
            object: nil)
        
        self.sideMenuView.isHidden = true
        self.btnEdit.isSelected = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.swipeToPop()
        self.btnSidemenuHideShow.isHidden = true
        
        if mybool == false
        {
            self.lblDataNotAVailaible.isHidden = true
            self.homeTblView.isHidden = true
            isCallingAPI = true
            refBool = true
            currentIndex = 0
            self.dataArr.removeAll()
            btnFilter.isSelected = false
            self.GetBuyerListApi(alpha: false)
        }
        

        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        homeTblView.refreshControl = refreshControl
    }
    
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        isCallingAPI = true
        refBool = false
        currentIndex = 0
//        self.dataArr.removeAll()
        self.GetBuyerListApi(alpha: btnFilter.isSelected)
    }
    
    @objc func btnPropertiesAction(_ sender: AnyObject)
    {
        print("success......")
        let index = sender.tag ?? 0
        isFromHome = false
        arrpropertyInd.removeAll()
        let dict = self.dataArr[index] //self.dataArr[index] as? GetUserDataModel()
        let myPropertyVC = MyPropertyListVC.instantiate(fromAppStoryboard: .Agent)
        myPropertyVC.buyerId = dict.buyerId ?? 0
        myPropertyVC.buyerName = dict.firstName ?? ""
        myPropertyVC.delegate = self
        self.navigationController?.pushViewController(myPropertyVC, animated: true)
    }
    func getArrInd(arrInd: [Int], arrId: [Int]) {
        self.arrPropertyIndex = arrInd
        self.arrPropertyId = arrId
    }
    //MARK:- ACTIONS
    
    @IBAction func btnFilterAction(_ sender: UIButton) {
        
        btnFilter.isSelected = !btnFilter.isSelected
        isCallingAPI = true
        refBool = false
        currentIndex = 0
        
        if btnFilter.isSelected
        {
            GetBuyerListApi(alpha: true)
        }
        else
        {
            GetBuyerListApi(alpha: false)
        }
    }
    
    @IBAction func btnSerchAction(_ sender: UIButton) {
        let serchBuyerVC = SerchBuyerVC.instantiate(fromAppStoryboard: .Agent)
        navigationController?.pushViewController(serchBuyerVC, animated: false)
    }
    
    @IBAction func btnSidemenuHideShowAction(_ sender: UIButton) {
        arrpropertyInd.removeAll()
        btnSidemenuHideShow.isSelected = !btnSidemenuHideShow.isSelected
        
        if btnSidemenuHideShow.isSelected
        {
            self.sideMenuView.isHidden = true
            self.btnEdit.isSelected = false
            self.btnSidemenuHideShow.isHidden = true
            self.btnSidemenuHideShow.isSelected = false
        }
        
    }
    @IBAction func btnScanQRAction(_ sender: UIButton) {
        let nextVc = QRScannerController.instantiate(fromAppStoryboard: .PreLogin)
        self.sideMenuView.isHidden = true
        self.btnEdit.isSelected = false
        nextVc.currentStatusBuye = 1
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @IBAction func btnCreateBuyerAction(_ sender: UIButton) {
        arrpropertyInd.removeAll()
        let nextVc = CreateBuyerVc.instantiate(fromAppStoryboard: .Agent)
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @IBAction func btnEditAction(_ sender: UIButton)
    {
        self.btnEdit.isSelected = !self.btnEdit.isSelected
        if btnEdit.isSelected == true
        {
            self.sideMenuView.isHidden = false
            self.btnSidemenuHideShow.isHidden = false
        }
        else
        {
            self.sideMenuView.isHidden = true
            self.btnSidemenuHideShow.isHidden = true
        }
    }
    
    @IBAction func btnMyProfileAction(_ sender: UIButton)
    {
        let nextVc = ProfileVc.instantiate(fromAppStoryboard: .Agent)
        nextVc.isFromeEdite = true
        self.sideMenuView.isHidden = true
        nextVc.isEditProfile = true
        mybool = true
        self.navigationController?.pushViewController(nextVc, animated: true)
        self.btnEdit.isSelected = false
        self.btnSidemenuHideShow.isHidden = true
        
    }
    
    @IBAction func btnChangePasswordAction(_ sender: UIButton)
    {
        let obj = ChangePasswordVc.instantiate(fromAppStoryboard: .PreLogin)
        self.sideMenuView.isHidden = true
        self.btnEdit.isSelected = false
        mybool = true
        self.navigationController?.pushViewController(obj, animated: true)
        
        self.btnSidemenuHideShow.isHidden = true
    }
    @IBAction func btnMyProperties(_ sender: UIButton){
        print("Call my Properties Api")
        arrpropertyInd.removeAll()
        isFromHome = true
        let myPropertyVC = MyPropertyListVC.instantiate(fromAppStoryboard: .Agent)
        self.sideMenuView.isHidden = true
        self.btnEdit.isSelected = false
        mybool = true
        self.navigationController?.pushViewController(myPropertyVC, animated: true)
      
    }
    
    @IBAction func btnLogoutAction(_ sender: UIButton)
    {
        
        let alert = UIAlertController(title: APP_NAME, message: "Are you sure you want to logout?", preferredStyle: .alert)
        let Yes = UIAlertAction(title: "Logout", style: .destructive)
        { (btnOkAction) in
            
            self.LogoutApi()
            
        }
        let No = UIAlertAction(title: "Cancel", style: .cancel) { (btnCancelAction) in
            self.dismiss(animated: false, completion: nil)
            self.sideMenuView.isHidden = true
            self.btnEdit.isSelected = false
        }
        alert.addAction(Yes)
        alert.addAction(No)
        self.present(alert, animated: true, completion: nil)
        
        self.sideMenuView.isHidden = true
        self.btnEdit.isSelected = false
        
        self.btnSidemenuHideShow.isHidden = true
        
    }
    
    @objc func scannerNotification()
    {
        print("notification")
        
//        isFromHome = false
//        let myPropertyVC = MyPropertyListVC.instantiate(fromAppStoryboard: .Agent)
//        myPropertyVC.delegate = self
//        myPropertyVC.arrPropetyId = self.arrPropertyId
//        self.navigationController?.pushViewController(myPropertyVC, animated: true)
    }
    
    @objc func openProfileImage(_ Sender : UIButton)
    {
        let index = Sender.tag
        let obj = ProfilimageVc.instantiate(fromAppStoryboard: .PreLogin)
        let url = self.dataArr[index].profilePic
        obj.strUrl = url ?? ""
        mybool = true
        obj.modalPresentationStyle = .fullScreen
        self.navigationController?.present(obj, animated: true, completion: nil)
    }
    

    
    //MARK:- FUNCTION
    
    func swipeToPop()
    {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.sideMenuView.isHidden = true
        self.btnEdit.isSelected = false
    }
    
    func LogoutApi()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.id] = agentId
        params[RequestKeys.accessToken] = APIToken
        params[RequestKeys.usertype] = userType
        
        APIManager.showLoader()
        APIManager.shared.callPostApi(url: APIEndpoint.logout, parameters: params) { (result) in
            APIManager.hideLoader()
            switch result
            {
            case.success(let response):
                
                let data = JSON.init(response)
                
                if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4 || data["status"].intValue == 5{
                    showAlertWith(message: data["message"].stringValue, inView: self)
                }
                else if data["status"].intValue == 1
                {
                    
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
                
                break
            case.failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    func GetBuyerListApi(alpha : Bool)
    {
        if isCallingAPI == true
        {
            var params: [String: Any] = [ : ]
            params[RequestKeys.pageIndex] = currentIndex
            params[RequestKeys.accessToken] = APIToken
            params[RequestKeys.agentId] = agentId
            params[RequestKeys.isAlphabetFilter] = alpha
            
            if refBool == true{
                APIManager.showLoader()
            }
            APIManager.shared.callPostApi(url: APIEndpoint.getBuyerList, parameters: params) { (result) in
                
                APIManager.hideLoader()
                
                switch result
                {
                case.success(let response):
                    print("hiichandan")
                    
                    let data = JSON.init(response)
                    
                    if data["status"].intValue == 1
                    {
                       let arr = data["data"].arrayObject as? NSArray
                       if self.currentIndex == 0
                        {
                            self.dataArr.removeAll()
                            
                        }
                        
                        for dic in arr!
                        {
                            let dict = GetUserDataModel.init(dictionary: dic as! NSDictionary)
                            self.dataArr.append(dict!)
                            
                        }
                        
                        print("dataArr => \(self.dataArr)")
//                        print(self.dataArr)
                        self.isCallingAPI = true
                        
//                        if self.dataArr.count >= 20
//                        {
//                            self.refBool = false
//                            self.currentIndex = self.currentIndex + 1
//                            self.GetBuyerListApi(alpha: alpha)
//                        }
                    }
                    else if data["status"].intValue == 4
                    {
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
                    else if data["status"].intValue == 5
                    {
                        self.isCallingAPI = false
                    }
                    
                    self.refreshControl.endRefreshing()
                    
                    if self.dataArr.count == 0
                    {
                        self.homeTblView.isHidden = true
                        self.lblDataNotAVailaible.isHidden = false
                    }
                    else
                    {
                        self.currentIndex = self.currentIndex + 1
                        print("done")
                        self.lblDataNotAVailaible.isHidden = true
                        self.homeTblView.isHidden = false
                        self.homeTblView.reloadData()
                    }
//                    self.refreshControl.endRefreshing()
                    
                    break
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
        //MARK:- TABLE_VIEW DELEGET METHODS
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            if dataArr.count == 0
//            {
//                self.homeTblView.isHidden = true
//                return 0
//            }
//            else
//            {
               return dataArr.count
//            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTblCell
    //        cell.img.image = self.arrdata[indexPath.row]
            cell.btnImageCell.addTarget(self, action: #selector(openProfileImage), for: .touchUpInside)
            cell.btnImageCell.tag = indexPath.row
            
            let dict = self.dataArr[indexPath.row]
            print("dictdata\(String(describing: dict))")
            
            cell.lblName.text = "\(dict.firstName ?? "") \(dict.lastName ?? "")"
            cell.lblEmail.text = dict.email ?? ""
            
            if dict.qrCode == ""
            {
                cell.btnProperties.isHidden = false
                cell.btnProperties.addTarget(self, action: #selector(btnPropertiesAction), for: .touchUpInside)
                cell.btnProperties.tag = indexPath.row
                
            }
            else
            {
                cell.btnProperties.isHidden = true
            }
            
            let number = dict.mobile ?? ""
            cell.lblNumber.text = number //"+\(61 ) \(number.formateMobileNumber())"

            let myurl = dict.profilePic ?? ""
            cell.img.sd_setImage(with: URL(string: myurl ?? ""), placeholderImage: UIImage(named: "user" ?? ""))
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let dict = self.dataArr[indexPath.row]
            let buyerList = BuyerProfileFromAgentVC.instantiate(fromAppStoryboard: .Agent)
            buyerList.buyerFromAgentId = dict.buyerId!
            self.navigationController?.pushViewController(buyerList, animated: true)
        }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if self.dataArr.count % 20 == 0{
                
                print("willDisplay :\(indexPath.row)")
                print("willDisplay :\(self.dataArr.count-1)")
                print("willDisplay :\(self.currentIndex)")

                if indexPath.row == self.dataArr.count - 1 && self.currentIndex != 0
                {
                        self.GetBuyerListApi(alpha: btnFilter.isSelected)
                    
                }
            }
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 85
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            self.sideMenuView.isHidden = true
            self.btnEdit.isSelected = false
        }
        
        
        //MARK:- GestureRecognizerDelegate DELEGETE METHODS
        
        func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
            
            if gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer {
                return false
            }
            return true
        }
    
}
