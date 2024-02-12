//
//  AddPartnerVC.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 08/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class AddPartnerVC: UIViewController,UITableViewDelegate,UITableViewDataSource,AddPartnerDelegate {

    // MARK:- Outlets
    @IBOutlet var tblVewPartnerList: UITableView!{
        didSet{
            self.tblVewPartnerList.backgroundColor = .clear
            self.tblVewPartnerList.allowsMultipleSelection = false
            self.tblVewPartnerList.separatorColor = .kSepheratorColor()
            
        }
    }
    @IBOutlet var btnAddPartner: UIButton!{
        didSet{
            self.btnAddPartner.setTitle("+ Add Partner", for: .normal)
            self.btnAddPartner.titleLabel?.textColor = UIColor.black
            self.btnAddPartner.titleLabel?.font = .custom(style: .Medium, size: .s16)
            
        }
    }
    @IBOutlet var btnSkip: UIButton!{
        didSet{
            self.btnSkip.setTitle("Skip", for: .normal)
            self.btnSkip.titleLabel?.textColor = UIColor.black
            self.btnSkip.titleLabel?.font = .custom(style: .Medium, size: .s18)
        }
    }
    @IBOutlet var btnSaveAndNext: UIButton!{
        didSet{
            self.btnSaveAndNext.titleLabel?.textColor = UIColor.kTextColorBuyer() 
            self.btnSaveAndNext.titleLabel?.text = "Save & Next"
            self.btnSaveAndNext.titleLabel?.font = .custom(style: .Medium, size: .s16)
            self.btnSaveAndNext.backgroundColor = UIColor.kSplashColor()
            self.btnSaveAndNext.layer.cornerRadius = 5.0

        }
    }
    @IBOutlet var lblPartnerContactDetail: UILabel!{
        didSet{
            self.lblPartnerContactDetail.text = "Partner Contact Details"
            self.lblPartnerContactDetail.textColor = .black
            self.lblPartnerContactDetail.font = .custom(style: .Medium, size: .s20)
            self.lblPartnerContactDetail.adjustsFontSizeToFitWidth = true
            
        }
    }
    @IBOutlet var lblNoPartner: UILabel!{
        didSet{
            self.lblNoPartner.text = "You don't have any partners yet."
            self.lblNoPartner.font = .custom(style: .Regular, size: .s16)
            self.lblNoPartner.textColor = .black
        }
    }
    
    // MARK:- Local Variable
    var arrPartner = arrPrtnr
//    var arrPatrner = NSMutableArray()
    var indexPath = IndexPath()
    var isSelectClick = false
    var partners : [String : Any] = [:]
   
    
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.addNavigationBackButton()
        self.isSelectClick = false
    }
    
    func addNavigationBackButton(){
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(image: UIImage(named: ImageName.backButtom),style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
        self.navigationItem.leftBarButtonItem!.tintColor = .black
        
    }
    
    @objc func backNavigationAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    // MARK:- Setup
    func setup(){
//        arrPrtnr.removeAll()
        self.view.backgroundColor = UIColor.kAppThemeColor()
        self.title = "MY PROFILE"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        transparentNav(nav: self.navigationController!)
        //        self.tblVewPartnerList.register(ParternerTableViewCell, forCellReuseIdentifier: "ParternerTableViewCell")
    }
    
    func addArr(partner: Partner,isSelect: Bool) {
        
        if isSelect == true{
            arrPrtnr[indexPath.row].fName = partner.fName
            arrPrtnr[indexPath.row].lName = partner.lName
            arrPrtnr[indexPath.row].mobile = partner.mobile
            arrPrtnr[indexPath.row].email = partner.email
            // ADD INTO DICTIONARY
//            self.partners["firstName"] = arrPartner[indexPath.row].fName = partner.fName
//            self.partners["lastName"] = arrPartner[indexPath.row].fName = partner.lName
//            self.partners["email"] = arrPartner[indexPath.row].fName = partner.mobile
//            self.partners["phone"] = arrPartner[indexPath.row].fName = partner.email
            
            print("reqParameter = \(reqParameter)")
        
        }else{
            // ADD INTO DICTIONARY
            arrPrtnr.append(partner)
            self.arrPartner = arrPrtnr
//            self.partners["firstName"] = arrPartner[indexPath.row].fName = partner.fName
//            self.partners["lastName"] = arrPartner[indexPath.row].fName = partner.lName
//            self.partners["email"] = arrPartner[indexPath.row].fName = partner.mobile
//            self.partners["phone"] = arrPartner[indexPath.row].fName = partner.email
        }
        print("Partner from Partner Screen \(arrPartner)")
        print("reqParameter = \(reqParameter)")
        self.tblVewPartnerList.reloadData()
      }
    
    
    
    // MARK:- ButtonClick Action
    
    @IBAction func btnSkipAction(_ sender: UIButton) {
        let nextVC = ProfileAddLittleBitMoreVC.instantiate(fromAppStoryboard: .Buyer)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func btnClickAddPartner(_ sender: UIButton) {
        print("Add Partner butten clicked")
        let popUpObj = self.storyboard?.instantiateViewController(withIdentifier: "AddPartnerPopUpVC") as! AddPartnerPopUpVC
        popUpObj.modalPresentationStyle = .overCurrentContext
        self.definesPresentationContext = true
        popUpObj.delegate = self
        self.present(popUpObj, animated: true, completion: nil)
       
    }
    
    @IBAction func btnClickSaveAndNext(_ sender: UIButton) {
//        reqParameter["partners"] = self.partners
        var tempArr = [partners]
        tempArr.removeAll()
        for i in  0..<arrPrtnr.count{
           
                self.partners = [
                    "firstName" : arrPrtnr[i].fName as Any,
                    "lastName" : arrPrtnr[i].lName as Any,
                    "email"  :  arrPrtnr[i].email as Any,
                    "phone" :  "\("+61 ")\(arrPrtnr[i].mobile as Any)"
                                        ]
                tempArr.append(self.partners)
                reqParameter["partners"] = tempArr
        
            print("TempArr = \(tempArr)")
        }
        print("reqParameter[partners] = \(reqParameter)")
        let nextVC = ProfileAddLittleBitMoreVC.instantiate(fromAppStoryboard: .Buyer)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // MARK:- TableView Delegate and DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrPrtnr.count == 0{
            tableView.isHidden = true
            self.lblNoPartner.isHidden = false
            
        }else{
            tableView.isHidden = false
            self.lblNoPartner.isHidden = true
        }
        return arrPrtnr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParternerTableViewCell") as! ParternerTableViewCell
        if indexPath.row == arrPrtnr.count - 1 {
            cell.viewSepherator.isHidden = true
        }else{
            cell.viewSepherator.isHidden = false
        }
        cell.lblFName.text = arrPrtnr[indexPath.row].fName + " " + arrPrtnr[indexPath.row].lName
//        cell.lblLName.text =
        cell.lblMobile.text =  "\("+61 ")\(arrPrtnr[indexPath.row].mobile)"
        cell.lblEmail.text = arrPrtnr[indexPath.row].email
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.isSelectClick = true
        self.indexPath = indexPath
        let popUpObj = self.storyboard?.instantiateViewController(withIdentifier: "AddPartnerPopUpVC") as! AddPartnerPopUpVC
               popUpObj.modalPresentationStyle = .overCurrentContext
               self.definesPresentationContext = true
        popUpObj.delegate = self
        popUpObj.isSelect = true
         self.present(popUpObj, animated: true, completion: nil)
        popUpObj.lblSTDCode.isHidden = false
        popUpObj.txtFirstName.text = arrPrtnr[indexPath.row].fName
        popUpObj.txtLastName.text = arrPrtnr[indexPath.row].lName
        popUpObj.txtMobile.text = arrPrtnr[indexPath.row].mobile
        popUpObj.txtMobile.setLeftPaddingPoints(30)
        popUpObj.txtEmail.text = arrPrtnr[indexPath.row].email
        popUpObj.btnSubmit.setTitle("Update", for: .normal)
        tableView.reloadData()
      
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            print("You remove Element from Array at index")
            let alert = UIAlertController(title: APP_NAME, message: "Are you sure you want to Delete \(arrPrtnr[indexPath.row].fName) \(arrPrtnr[indexPath.row].lName) as a Partner?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "YES", style: .destructive, handler: { (action) in
                arrPrtnr.remove(at: indexPath.row)
                tableView.reloadData()
                   }))
                   alert.addAction(UIAlertAction(title: "NO", style: .cancel, handler: nil))//  self.present(alert, animated: true,completion: )
            self.present(alert, animated: true)
            //self.arrPartner.remove(at: indexPath.row)
        }
        tableView.reloadData()
    }
}
