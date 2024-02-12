//
//  BrokerListVc.swift
//  realpass
//
//  Created by i-Verve on 06/04/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class BrokerListVc: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tblViewBrokarList: UITableView!{
        didSet{
            self.tblViewBrokarList.separatorStyle = .none
            self.tblViewBrokarList.backgroundColor = .clear
        }
    }
    @IBOutlet var lblNoBrokerlist: UILabel!{
        didSet{
            self.lblNoBrokerlist.text = "No broker available."
            self.lblNoBrokerlist.font = .custom(style: .Regular, size: .s16)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    //MARK:- variable
    
    var currentIndex = 0
    var isCallingAPI = true
    var dataArr = [BrokerListModel]()
    
    // MARK:- Local Properties
    let name = "John Doe"
    let url = "www.johndoe.com"
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.addNavigationBackButton()
        self.BrokerlistApi()
//        self.isSelectClick = false
    }
    
    func addNavigationBackButton(){
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(image: UIImage(named: ImageName.backButtom),style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
        self.navigationItem.leftBarButtonItem!.tintColor = .black
        
    }
    
    @objc func backNavigationAction(){
//        self.navigationController?.popViewController(animated: true)
        mybool = false
        let homeVC = BuyerHomeVc.instantiate(fromAppStoryboard: .Buyer)
        self.navigationController?.pushViewController(homeVC, animated: false)
    }
    
    
    
    // MARK:- Setup
    func setup(){
        self.view.backgroundColor = .white
        self.title = "BROKERS"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        transparentNav(nav: self.navigationController!)
        //        self.tblVewPartnerList.register(ParternerTableViewCell, forCellReuseIdentifier: "ParternerTableViewCell")
        self.tblViewBrokarList.delegate = self
        self.tblViewBrokarList.dataSource = self
        tblViewBrokarList.rowHeight = UITableView.automaticDimension
        tblViewBrokarList.estimatedRowHeight = 82.0
    }
    
    // MARK:- Function
    
    func BrokerlistApi()
    {
        
        if isCallingAPI == true
        {
            
            var params: [String: Any] = [ : ]
            params[RequestKeys.pageIndex] = currentIndex
            params[RequestKeys.accessToken] = APIToken
            params[RequestKeys.buyerId] = buyerId
            
            APIManager.shared.callPostApi(url: APIEndpoint.brokerList, parameters: params) { (result) in
                switch result
                {
                case.success(let response):
                    
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
                            let dict = BrokerListModel.init(dictionary: dic as! NSDictionary)
                            self.dataArr.append(dict!)
                            
                        }
                        
                        print("dataArr => \(self.dataArr)")
                        self.isCallingAPI = true
//                        self.currentIndex = self.currentIndex + 1
//                        self.BrokerlistApi()
                    }
                        
                    else if data["status"].intValue == 5
                    {
                        self.isCallingAPI = false
                    }
                    
                    if self.dataArr.count == 0
                    {
                        self.tblViewBrokarList.isHidden = true
                    }
                    else
                    {
                        self.currentIndex = self.currentIndex + 1
                        self.tblViewBrokarList.isHidden = false
                        self.tblViewBrokarList.reloadData()
                    }
                    
                    break
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
        
        
        
        
    }
    
    // MARK:- TableView Delegate and Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataArr.count == 0{
            self.tblViewBrokarList.isHidden = true
            self.lblNoBrokerlist.isHidden = false
        }else{
            self.tblViewBrokarList.isHidden = false
            self.lblNoBrokerlist.isHidden = true
        }
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrokerListTableViewCell") as! BrokerListTableViewCell
        let dict = self.dataArr[indexPath.row]
        let underLineAttribute = [NSAttributedString.Key.underlineStyle : NSUnderlineStyle.thick.rawValue]
        let underLineAttributedString = NSAttributedString(string: dict.website?.lowercased() ?? "", attributes: underLineAttribute)
        var urlString = ""
        if let websit = dict.website {
            if websit.contains("https://"){
                urlString = websit.lowercased()
            }else{
                urlString = "https://\(websit.lowercased())"
                print("urlString = \(urlString)")
            }
        }else{
            print("Found Nill value")
        }
//        let urlString = "https://\(dict.website ?? "www.google.com")"
        print("urlString= \(urlString)")
        let url = URL(string: urlString)
        print("DataArrCount = \(dataArr.count)")
        print("IndexPathRow = \(indexPath.row)")
        cell.vewSepherator.backgroundColor = .kSepheratorColor()
        if indexPath.row == dataArr.count - 1 {
            cell.vewSepherator.isHidden = true
        }else{
            cell.vewSepherator.isHidden = false
        }
//        let dict = self.dataArr[indexPath.row]
        cell.lblName.text = dict.brokerName ?? ""
        let myurl = dict.brokerImage ?? ""
        cell.imgOfBroker.sd_setImage(with: URL(string: myurl ?? ""), placeholderImage: UIImage(named: "user" ?? ""))
        cell.btnUrl.setAttributedTitle(underLineAttributedString, for: .normal)
        cell.buttonPressed = {
            UIApplication.shared.open(url!, completionHandler: { success in
                   if success {
                       print("opened")
                   } else {
                       print("failed")
                    showAlertWith(message: "Please enter correct Url", inView: self)
                   }
               })
        }
        return cell
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let nextVC = BuyerHomeVc.instantiate(fromAppStoryboard: .Buyer)
//        self.presentingViewController?.navigationController?.pushViewController(nextVC, animated: true)
//        self.dismiss(animated: true, completion: nil)
//        
//      
//        self.navigationController?.pushViewController(nextVC, animated: true)
//        
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       self.tblViewBrokarList.rowHeight = UITableView.automaticDimension
        return self.tblViewBrokarList.rowHeight
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if self.dataArr.count % 20 == 0{
                
                print("willDisplay :\(indexPath.row)")
                print("willDisplay :\(self.dataArr.count-1)")
                print("willDisplay :\(self.currentIndex)")

                if indexPath.row == self.dataArr.count - 1 && self.currentIndex != 0
                {
                        self.BrokerlistApi()
                    
                }
            }
        }
    
}
