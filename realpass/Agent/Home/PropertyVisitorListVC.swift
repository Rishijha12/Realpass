//
//  PropertyVisitorListVC.swift
//  realpass
//
//  Created by i-Verve on 01/07/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MarqueeLabel

class PropertyVisitorListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //Outlets
    @IBOutlet weak var lblDataAvailableOrNot: UILabel!{
        didSet{
            lblDataAvailableOrNot.text = "Nobody has visited this property yet."
            lblDataAvailableOrNot.numberOfLines = 0
            lblDataAvailableOrNot.font = .custom(style: .Regular, size: .s16)
            lblDataAvailableOrNot.textAlignment = .center
            
        }
    }
    @IBOutlet weak var lblHome: MarqueeLabel!{
        didSet{
            lblHome.text = "MY PROPERTIES"
            lblHome.font = .custom(style: .Regular, size: .s20)
            lblHome.speed = .duration(12.0)


        }
    }
    @IBOutlet weak var mytblview: UITableView!{
        didSet{
            //            self.mytblview.
        }
    }
    @IBOutlet weak var buyerTableView: UITableView!
    @IBOutlet var btnBack: UIButton!
    var isTap = false
    var currentIndex = 0
    var isCallingAPI = true
    var dataArr = [PropertyBuyerListModel]()
    var refreshControl = UIRefreshControl()
    var refBool:Bool!
    var propertyId = 0
    var currentAddress = ""
    var buyerList = [BuyerList]()
    var aDateArray = NSMutableArray()
    var hiddenSections = Set<Int>()
    var selectedIndex = -99
    let dateformator = DateFormatter()
    var subTblCellHeight = 80
    var mainTblDateHeight = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.kAppThemeColor()
        self.mytblview.backgroundColor = .kAppThemeColor()
        if currentAddress == ""{
            self.lblHome.text = "MY PROPERTIES"
        }else{
            self.lblHome.text = self.currentAddress
        }
        self.getPropertyBuyerList()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func getPropertyBuyerList()
    {
        if isCallingAPI == true
        {
            var params: [String: Any] = [ : ]
            params[RequestKeys.pageIndex] = currentIndex
            params[RequestKeys.accessToken] = APIToken
            params[RequestKeys.agentId] = agentId
            params[RequestKeys.propertyId] = self.propertyId
            
            if refBool == true{
                APIManager.showLoader()
            }
            APIManager.shared.callPostApi(url: APIEndpoint.propertyBuyerList, parameters: params) { (result) in
                
                APIManager.hideLoader()
                
                
                switch result
                {
                case.success(let response):
                    
                    
                    let data = JSON.init(response)
                    
                    if data["status"].intValue == 1
                    {
                        //                        var arrPropetrtyBuyerListArr = [PropertyBuyerListModel]()
                        
                        //                        let someArray = data["data"].arrayObject
                        //                        let  _ = PropertyBuyerListModel.init(dictionary: data["data"].arrayValue)
                        let arr = data["data"].arrayObject as? NSArray
                        let buyerList = data["buyerList"].arrayObject as? NSArray
                        if self.currentIndex == 0
                        {
                            self.aDateArray.removeAllObjects()
                            
                        }
                        
                        for dic in arr!
                        {
                            
                            let aDataDict = dic as! NSDictionary
                            print(aDataDict)
                            self.aDateArray.add(aDataDict)
                        }
                        
                        
                        print("date Array => \(self.aDateArray)")
                        print(self.aDateArray.count)
                        self.isCallingAPI = true
                        
//                        if self.aDateArray.count >= 10
//                        {
//                            self.refBool = false
//                            self.currentIndex = self.currentIndex + 1
//                            self.getPropertyBuyerList()
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
                    
                    if self.aDateArray.count == 0
                    {
                        self.mytblview.isHidden = true
                        self.lblDataAvailableOrNot.isHidden = false
                    }
                    else
                    {
                        self.currentIndex = self.currentIndex + 1
                        self.lblDataAvailableOrNot.isHidden = true
                        self.mytblview.isHidden = false
                        self.mytblview.reloadData()
                    }
                    //                    self.refreshControl.endRefreshing()
                    
                    break
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.mytblview
        {
            let dict = self.aDateArray[indexPath.row] as! NSDictionary
            
            let buyerList = dict["buyerList"] as? NSArray ?? NSArray()
            let height = (buyerList.count * subTblCellHeight) + self.mainTblDateHeight
            print("height = \(height)")
            if selectedIndex == indexPath.row
            {
                return CGFloat(height)
            }
            else
            {
                return CGFloat(self.mainTblDateHeight)
            }
        }
        else
        {
            return CGFloat(self.subTblCellHeight)
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == mytblview
        {
            return self.aDateArray.count
        }
        else
        {
            return self.buyerList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == mytblview{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DateListCell") as! DateListCell
            let dict = self.aDateArray[indexPath.row] as! NSDictionary
            print("dict = \(dict)")
            
            let aSetDate = dict.object(forKey: "date") as! String
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd"
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "d MMM yyyy"
            var dateS = ""
            if let date = dateFormatterGet.date(from: aSetDate) {
                dateFormatterPrint.dateFormat = date.dateFormatWithSuffix()
                dateS = (dateFormatterPrint.string(from: date))
            } else {
                print("There was an error decoding the string")
            }
            
            print("date = \(dateS)")
            cell.lblDate.text = "Open Day \(indexPath.row+1)"+" - "+"\(dateS)"
            
            cell.buttonPressed =
                {
                    if self.selectedIndex == indexPath.row{
                        self.selectedIndex = -99
                        
                    }else{
                        self.selectedIndex = indexPath.row
                        
                    }
                    self.mytblview.reloadData()
                }
            
         
            if selectedIndex == indexPath.row
            {
                // cell open
                cell.btnDate.setImage(UIImage(named: "upperarrow-app"), for: .normal)
//                cell.btnDate.setImage(UIImage(named: "arrow app"), for: .normal)
                cell.sephretorView.isHidden = false
                DispatchQueue.main.async(execute:
                                            {
                                                self.buyerList.removeAll()
                                                let list = dict["buyerList"] as?  NSArray ?? NSArray()
                                                let aBDict = BuyerList.modelsFromDictionaryArray(array: list)
                                                self.buyerList = aBDict
                                            })
                let delay = 0.2
                DispatchQueue.main.asyncAfter(deadline: .now() + delay)
                { [self] in
                    if self.buyerList.count > 0
                    {
                        cell.tblViewBuyerList.reloadData()
                        print("buyerList count => \(self.buyerList.count)")
                        cell.tblBuyrListheitht.constant = CGFloat(self.buyerList.count * self.subTblCellHeight)
                    }
                }
            }
            else
            {
                //cell close
                cell.btnDate.setImage(UIImage(named: "arrow app"), for: .normal)
                cell.sephretorView.isHidden = true
            }
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "getVisitorListCell") as! getVisitorListCell
            
            //            let dict = self.aDateArray[indexPath.row] as! NSDictionary
            //            let aBDict = BuyerList.modelsFromDictionaryArray(array: dict["buyerList"] as! NSArray)
            //            print("buyer list second => \(self.buyerList)")
            //            print("dict => \(dict)")
            //            print("aBDict => \(aBDict)")
            print("self.buyerList count => \(self.buyerList.count)")
            if self.buyerList.count > 0
            {
                let newDict = self.buyerList[indexPath.row]
                cell.lblName.text = newDict.firstName! + " " + newDict.lastName!
                cell.lblEmail.text = newDict.email!
                cell.lblNumber.text = newDict.mobile!
                
                let myurl = newDict.profilePic!
                
                cell.img.sd_setImage(with: URL(string: myurl), placeholderImage: UIImage(named: "user"))
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.dataArr.count % 20 == 0{
            
            print("willDisplay :\(indexPath.row)")
            print("willDisplay :\(self.dataArr.count-1)")
            print("willDisplay :\(self.currentIndex)")

            if indexPath.row == self.dataArr.count - 1 && self.currentIndex != 0
            {
                self.getPropertyBuyerList()
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == mytblview{
            print("Main cell")
        }
        else
        {
            print("buyer cell")
            let newDict = self.buyerList[indexPath.row]
            let buyerList = BuyerProfileFromAgentVC.instantiate(fromAppStoryboard: .Agent)
            buyerList.buyerFromAgentId = newDict.buyerId ?? 0
            self.navigationController?.pushViewController(buyerList, animated: true)
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
    //
    @IBAction func btnSideMenuAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
