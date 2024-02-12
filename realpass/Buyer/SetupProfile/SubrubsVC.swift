//
//  SubrubsVC.swift
//  realpass
//
//  Created by i-Verve on 01/04/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import GooglePlaces

protocol SubrubsVCDelegate {
    func sendArrSubrubs(arrSubrubs : [PreferredSuburbs])
}

class SubrubsVC: UIViewController,UITableViewDelegate,UITableViewDataSource,GMSAutocompleteViewControllerDelegate{
   
    //MARK:- --------Outlets------- -
    @IBOutlet var lblDontHaveSubrubs: UILabel!{
        didSet{
            self.lblDontHaveSubrubs.text = "You don't have any selected subrubs yet."
            self.lblDontHaveSubrubs.textColor = .black
            self.lblDontHaveSubrubs.font = .custom(style: .Regular, size: .s18)
        }
    }
    @IBOutlet var tblViewSearchHistory: UITableView!
    @IBOutlet var viewSephrator: UIView!{
        didSet{
            self.viewSephrator.backgroundColor = .kPlaceholderColor()
        }
        
    }
    @IBOutlet var btnSearch: UIButton!{
        didSet{
            self.btnSearch.setTitle("Search", for: .normal)
            self.btnSearch.titleLabel?.font = .custom(style: .Regular, size: .s16)
            self.btnSearch.setTitleColor(.kPlaceholderColor(), for: .normal)
        }
    }
    @IBOutlet var btnDismis: UIButton!
    @IBOutlet var viewSearch: UIView!
    @IBOutlet var viewSearchContainer: UIView!
    //MARK:- --------Local Variable------- -
    private var placesClient: GMSPlacesClient!
//    var arrSubrubs = [String]()
    var arrNewSuburb = [PreferredSuburbs]()
//    var arrCoordinate = [Subrubs]()
    var delegate : SubrubsVCDelegate?
    //MARK:- --------LifeCycle------- -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupVC()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    //MARK:- --------Custom Function------- -
    func setupVC(){
        self.tblViewSearchHistory.delegate = self
        self.tblViewSearchHistory.dataSource = self
        self.placesClient = GMSPlacesClient.shared()

    }
    

    //MARK:- --------TableView Delegate and Datasource methods------- -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrNewSuburb.count == 0{
            self.tblViewSearchHistory.isHidden = true
            self.lblDontHaveSubrubs.isHidden = false
        }else{
            self.tblViewSearchHistory.isHidden = false
            self.lblDontHaveSubrubs.isHidden = true
        }
        return arrNewSuburb.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubrubsCellVC") as! SubrubsCellVC
        cell.lblSearcedSubrubsName.text = arrNewSuburb[indexPath.row].address
        cell.delHistory = {
            self.arrNewSuburb.remove(at: indexPath.row)
            tableView.reloadData()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.arrNewSuburb.remove(at: indexPath.row)
        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    //MARK:- --------GmsAutocomplete Delegate methods------- -
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    
        print("Place name: \(String(describing: place.name))")
        print("Place ID: \(String(describing: place.placeID))")
        print("Place Address: \(String(describing: place.formattedAddress))")
//        print("Place Address: \(String(describing: place.))")
        print("latitude: \(place.coordinate.latitude)")
        print("longitude: \(place.coordinate.longitude)")
        
        if let _ =  self.arrNewSuburb.firstIndex(where: {$0.address == place.formattedAddress}){
            self.showAlertMessage(messageStr: "\(place.formattedAddress) Allready Added in list Please add another place") { (action) in
                            print("Place name = \(place.formattedAddress)")
                        }
        }
        else{
            var param : [String:Any] = [:]
            param["address"] = place.formattedAddress
            param["addressId"] = place.placeID
            param["longitude"] = place.coordinate.longitude
            param["lattitude"] = place.coordinate.latitude
            
            let objSuburbs = PreferredSuburbs(dictionary: param as NSDictionary)
            self.arrNewSuburb.append(objSuburbs!)
            
            self.dismiss(animated: true, completion: nil)
            self.tblViewSearchHistory.reloadData()
        }
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: ", error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- --------Activity Indicator Methods------- -
 
    //MARK:- --------Btn Click Function------- -
    
    @IBAction func btnClickSearch(_ sender: UIButton) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        let autocompleteController = GMSAutocompleteViewController()
            autocompleteController.delegate = self
        
        // Specify the place data types to return.
            let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.formattedAddress.rawValue) |
                UInt(GMSPlaceField.placeID.rawValue) | UInt(GMSPlaceField.coordinate.rawValue))
            autocompleteController.placeFields = fields
        print("Felds is: \(fields)")
        
        // Specify a filter.
            
            let filter = GMSAutocompleteFilter()
//            filter.type = .address
            filter.type = .city
            filter.country = "AU"
            autocompleteController.autocompleteFilter = filter
        autocompleteController.modalPresentationStyle = .currentContext
        autocompleteController.transitioningDelegate = self
        self.definesPresentationContext = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        present(autocompleteController, animated: true, completion: nil)
//        self.navigationController?.pushViewController(autocompleteController, animated: true)
    }
    
    @IBAction func btnClickDismis(_ sender: UIButton){
        self.delegate?.sendArrSubrubs(arrSubrubs: self.arrNewSuburb)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
}

struct Subrubs {
     var latitude = String()
     var longitude = String()
    init(latitude:String,longitude:String) {
        self.latitude = latitude
        self.longitude = longitude

    }
 }

extension SubrubsVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
