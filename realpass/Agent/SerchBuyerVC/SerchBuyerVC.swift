//
//  SerchBuyerVC.swift
//  realpass
//
//  Created by patel chandan on 30/07/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class SerchBuyerVC: UIViewController,UITableViewDelegate,UITableViewDataSource, PassArrIndDelegate,UISearchBarDelegate {
    
    
    //MARK:- OUTLATS
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var mySerchBar: UISearchBar!
    @IBOutlet weak var homeTblView: UITableView!{
        didSet{
            homeTblView.layer.cornerRadius = 20
            homeTblView.separatorInset.right = 15
        }
    }
    @IBOutlet weak var lblDataNotAVailaible: UILabel!
    
    //MARK:- VARIABLE DECLAIRATION
    var dataArr = [GetUserDataModel]()
    var dddd = [GetUserDataModel]()
    var arrPropertyIndex = [Int]()
    var arrPropertyId = [Int]()
    
    var currentIndex = 0
    var isCallingAPI = true
    var refreshControl = UIRefreshControl()
    var refBool:Bool!
    var searcharr = [String]()
    var searchActive : Bool = false

    //MARK:- LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.lblDataNotAVailaible.isHidden = false
        self.homeTblView.isHidden = true
//        isCallingAPI = true
//        refBool = true
//        currentIndex = 0
//        self.dataArr.removeAll()
//        self.searchBuyerAPI()
        
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        homeTblView.refreshControl = refreshControl
    }
    
    //MARK:- BUTTON ACTIONS
    
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        isCallingAPI = true
        refBool = false
        currentIndex = 0
        self.searchBuyerAPI()
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
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
    
    //MARK:- TABLE_VIEW DELEGET METHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTblCell
//        cell.img.image = self.arrdata[indexPath.row]
        cell.btnImageCell.addTarget(self, action: #selector(openProfileImage), for: .touchUpInside)
        cell.btnImageCell.tag = indexPath.row
        
        let dict = self.dataArr[indexPath.row]
//        print("dictdata\(String(describing: dict))")
        
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
            
//            print("willDisplay :\(indexPath.row)")
//            print("willDisplay :\(self.dataArr.count-1)")
//            print("willDisplay :\(self.currentIndex)")

            if indexPath.row == self.dataArr.count - 1 && self.currentIndex != 0
            {
                self.searchBuyerAPI()
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    //MARK:- SERCHBAR DELEGET METHODS
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
            searchActive = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        
        if mySerchBar.text?.count != 0
        {
            APIManager.showLoader()
            let delay = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + delay)
            {
                self.currentIndex = 0
                self.isCallingAPI = true
                self.dataArr.removeAll()
                print("search data array => \(self.dataArr)")
//                let task = URLSessionDataTask()
//               task.cancel()
                        // Make your API call here
                    self.searchBuyerAPI()
                
                
                
            }
         
        }
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar)
    {
        searchActive = false
        mySerchBar.text = ""
        homeTblView.reloadData()
    }
    
    
    //MARK:- API ACLL
    func searchBuyerAPI()
    {
        if isCallingAPI == true
        {
            var params: [String: Any] = [ : ]
            params[RequestKeys.pageIndex] = currentIndex
            params[RequestKeys.accessToken] = APIToken
            params[RequestKeys.agentId] = agentId
            params[RequestKeys.searchText] = mySerchBar.text
            
            
            if refBool == true{
                APIManager.showLoader()
            }
            APIManager.shared.callPostApi(url: APIEndpoint.searchBuyer, parameters: params) { (result) in
                
                APIManager.hideLoader()
                
                
                switch result
                {
                case.success(let response):
                    
                    
                    let data = JSON.init(response)
                    
                    if data["status"].intValue == 1
                    {
                       let arr = data["data"].arrayObject as? NSArray
//                       if self.currentIndex == 0
//                        {
//                            self.dataArr.removeAll()
//
//                        }
                        self.dataArr.removeAll()
                        for dic in arr!
                        {
                            let dict = GetUserDataModel.init(dictionary: dic as! NSDictionary)
                            self.dataArr.append(dict!)
                            
                        }
                        
//                        print("dataArr => \(self.dataArr)")
//                        print(self.dataArr)
                        self.isCallingAPI = true
                        
//                        if self.dataArr.count >= 10
//                        {
//                            self.refBool = false
//                            self.currentIndex = self.currentIndex + 1
//                            self.searchBuyerAPI()
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
                        self.lblDataNotAVailaible.isHidden = true
                        self.homeTblView.isHidden = false
                        self.homeTblView.reloadData()
                    }
//                    self.refreshControl.endRefreshing()
                    
                    break
                case.failure(let error):
                    print(error.localizedDescription)
                }//chan
            }
            
        }
    }
    
    
}
