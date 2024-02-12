//
//  PopupBrokerListVC.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 12/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit
class PopupBrokerListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
// MARK:- Outlets
    @IBOutlet var viewBrokerListContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var viewLblBrokerContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var lblBroker: UILabel!{
        didSet{
            self.lblBroker.text = "Brokers"
            self.lblBroker.font = .custom(style: .Medium, size: .s18)
            self.lblBroker.textColor = .black
        }
    }
    @IBOutlet var tblViewBrokerList: UITableView!{
        didSet{
            self.tblViewBrokerList.separatorStyle = .none
        }
    }
    
   
    

    
    // MARK:- Local Properties
    let name = "John Doe"
    let url = "www.johndoe.com"
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    
    // MARK:- Setup
    func setup(){
        self.tblViewBrokerList.delegate = self
        self.tblViewBrokerList.dataSource = self
        tblViewBrokerList.rowHeight = UITableView.automaticDimension
        tblViewBrokerList.estimatedRowHeight = 82.0
    }
    
    @IBAction func btnClickDismisView(_ sender: UIButton) {
        self.dismiss(animated: true,completion: nil) 
    }
        
    // MARK:- TableView Delegate and Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrokerListTableViewCell") as! BrokerListTableViewCell
        cell.lblName.text = self.name
        cell.lblUrl.text = self.url
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = BuyerHomeVc.instantiate(fromAppStoryboard: .Buyer)
        self.presentingViewController?.navigationController?.pushViewController(nextVC, animated: true)
        self.dismiss(animated: true, completion: nil)
        
      
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       self.tblViewBrokerList.rowHeight = UITableView.automaticDimension
        return self.tblViewBrokerList.rowHeight
    }
    
    
}
