//
//  ProfileContactDetailVC.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 03/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit

class ProfileContactDetailVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate {
    
    //MARK:- --------Outlets------- -
    @IBOutlet var lblConnected: UILabel!{
        didSet{
            self.lblConnected.text = "How would you like to be contacted?"
            self.lblConnected.font = .custom(style: .Medium, size: .s18)
            self.lblConnected.textColor = .black
            
        }
    }
    @IBOutlet var viewContentScr: UIView!{
        didSet{
            viewContentScr.backgroundColor = UIColor.kAppThemeColor()
        }
    }
    @IBOutlet var stkViewfirstContainer: UIStackView!{
        didSet{
            
        }
    }
    @IBOutlet var stkViewSecondContainer: UIStackView!{
        didSet{
            self.stkViewSecondContainer.layer.cornerRadius = 10.0
            self.stkViewSecondContainer.layer.masksToBounds = false
            self.stkViewSecondContainer.clipsToBounds = true
        }
    }
    @IBOutlet var viewSmsContainer: UIView!{
        didSet{
            self.viewSmsContainer.layer.cornerRadius = 10.0
            self.viewSmsContainer.layer.masksToBounds = false
            self.viewSmsContainer.clipsToBounds = true
        }
    }
    @IBOutlet var viewCallConainer: UIView!{
        didSet{
            self.viewCallConainer.layer.cornerRadius = 10.0
            self.viewCallConainer.layer.masksToBounds = false
            self.viewCallConainer.clipsToBounds = true
        }
    }
    @IBOutlet var viewEmailContainer: UIView!{
        didSet{
            self.viewEmailContainer.layer.cornerRadius = 10.0
            self.viewEmailContainer.layer.masksToBounds = false
            self.viewEmailContainer.clipsToBounds = true
        }
    }
    @IBOutlet var btnSms: UIButton!{
        didSet{
            self.btnSms.titleLabel?.textAlignment = .left
            self.btnSms.setTitle("SMS", for: .normal)
            self.btnSms.titleLabel?.font = .custom(style: .Regular, size: .s16)
            self.btnSms.setTitleColor(UIColor.kInstructionColor(), for: .normal)
            self.btnSms.isSelected = true
        }
    }
    @IBOutlet var btnCall: UIButton!{
        didSet{
            self.btnCall.titleLabel?.textAlignment = .left
            self.btnCall.setTitle("Call", for: .normal)
            self.btnCall.titleLabel?.font = .custom(style: .Regular, size: .s16)
            self.btnCall.setTitleColor(UIColor.kInstructionColor(), for: .normal)
            self.btnCall.isSelected = true
        }
    }
    @IBOutlet var btnEmail: UIButton!{
        didSet{
            self.btnEmail.titleLabel?.textAlignment = .left
            self.btnEmail.setTitle("Email", for: .normal)
            self.btnEmail.titleLabel?.font = .custom(style: .Regular, size: .s16)
            self.btnEmail.setTitleColor(UIColor.kInstructionColor(), for: .normal)
            self.btnEmail.isSelected = true
        }
    }
    
    @IBOutlet var Save: UIButton!{
        didSet{
            
            self.Save.setTitle("Save", for: .normal)
            self.Save.titleLabel?.font = UIFont.custom(style: .Bold, size: .s16)
            self.Save.setTitleColor(UIColor.kBlueColor(), for: .normal)
        }
    }
    @IBOutlet var Cancel: UIButton!{
        didSet{
            self.Cancel.setTitle("Cancel", for: .normal)
            self.Cancel.setTitleColor(UIColor.kInstructionColor(), for: .normal)
            self.Cancel.titleLabel?.font = .custom(style: .Regular, size: .s16)
            
        }
    }
    @IBOutlet var txtEndTime: UITextField!{
        didSet{
            self.txtEndTime.backgroundColor = UIColor.kAppThemeColor()
            self.dateFormater.dateFormat = "HH:mm"
            self.txtEndTime.font = UIFont.custom(style: .Regular, size: .s24)
            self.txtEndTime.textColor = UIColor.kInstructionColor()
            self.txtEndTime.textAlignment = .center
            self.txtEndTime.delegate = self
        }
    }
    @IBOutlet var txtStartDate: UITextField!{
        didSet{
            self.txtStartDate.backgroundColor = UIColor.kAppThemeColor()
            self.dateFormater.dateFormat = "HH:mm"
            self.txtStartDate.font = UIFont.custom(style: .Regular, size: .s24)
            self.txtStartDate.textColor = UIColor.kInstructionColor()
            self.txtStartDate.textAlignment = .center
            self.txtStartDate.delegate = self
        }
        
    }
    @IBOutlet var lblEndTime: UILabel!{
        didSet{
            self.lblEndTime.text = "End Time"
            self.lblEndTime.font = .custom(style: .Regular, size: .s16)
            self.lblEndTime.textColor = UIColor.kInstructionColor()
        }
        
    }
    @IBOutlet var lblStartTime: UILabel!{
        didSet{
            self.lblStartTime.text = "Start Time"
            self.lblStartTime.font = .custom(style: .Regular, size: .s16)
            self.lblStartTime.textColor = UIColor.kInstructionColor()
        }
    }
    @IBOutlet var viewSeperator: UIView!{
        didSet{
            self.viewSeperator.backgroundColor = UIColor.kSepheratorColor()
            
        }
    }
    @IBOutlet var collectionViewDays: UICollectionView!{
        didSet{
            self.collectionViewDays.showsHorizontalScrollIndicator = false
        }
    }
    @IBOutlet var viewWeakContainer: UIView!
    @IBOutlet var lblDays: UILabel!{
        didSet{
            self.lblDays.text = "Days"
            self.lblDays.font = .custom(style: .Regular, size: .s16)
            self.lblDays.textColor = UIColor.kInstructionColor()
        }
    }
    @IBOutlet var btnBestContactDays: UIButton!{
        didSet{
            self.btnBestContactDays.setTitle("Best Contact Days / Time", for: .normal)
            self.btnBestContactDays.setTitleColor(UIColor.kInstructionColor(), for: .normal)
            self.btnBestContactDays.titleLabel?.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var imgViewDropdown: UIImageView!{
        didSet{
            self.imgViewDropdown.image = UIImage(named: ImageName.downArrow)
        }
    }
    @IBOutlet var viewContactDayTimeContiner: UIView!{
        didSet{
            self.viewContactDayTimeContiner.layer.cornerRadius = 10.0
            self.viewContactDayTimeContiner.layer.masksToBounds = false
            self.viewContactDayTimeContiner.clipsToBounds = true
            self.viewContactDayTimeContiner.backgroundColor = .white
            
        }
    }
    
    @IBOutlet var viewExpand: UIView!
    @IBOutlet var constaintViewHeight: NSLayoutConstraint!
    @IBOutlet var imgviewDashSelect: UIImageView!{
        didSet{
        }
    }
    @IBOutlet var imgviewDashUnselect1: UIImageView!{
        didSet{
        }
    }
    @IBOutlet var imgviewDashUnselect2: UIImageView!{
        didSet{
        }
    }
    @IBOutlet var imgviewDashUnselect3: UIImageView!{
        didSet{
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
    //MARK:- --------Globle Variable------- -
    var istap : Bool = false
    var idDaySelect = 999
    var datePicker = UIDatePicker()
    let dateFormater = DateFormatter()
    var date: Date? = nil
    var arrSelectedWeeks : [String : Any] = [:]
    var index = 999
    
    var arrWeekStatus : [Int : DayStatus] = [0 : DayStatus(nameOfDay: "M",isSelect: false, isBorder: false, startDate: "10:00", endDate: "19:00"),
                                             1 : DayStatus(nameOfDay: "T",isSelect: false, isBorder: false, startDate: "10:00", endDate: "19:00"),
                                             2 : DayStatus(nameOfDay: "W",isSelect: false, isBorder: false, startDate: "10:00", endDate: "19:00"),
                                             3 : DayStatus(nameOfDay: "T",isSelect: false, isBorder: false, startDate: "10:00", endDate: "19:00"),
                                             4 : DayStatus(nameOfDay: "F",isSelect: false, isBorder: false, startDate: "10:00", endDate: "19:00"),
                                             5 : DayStatus(nameOfDay: "S",isSelect: false, isBorder: false, startDate: "10:00", endDate: "19:00"),
                                             6 : DayStatus(nameOfDay: "S",isSelect: false, isBorder: false, startDate: "10:00", endDate: "19:00")
    ]
    var arrDict = [Int : [String]]()
    var currentIndex = 999
    var previousIndex = 999
    var startTime = Date()
    var endTime = Date()
    var isSelectSms = "false"
    var isSelectCall = "false"
    var isSelectEmail = "false"
    var noSelectedDayTime = 0
    
    
    //MARK:- --------Life cycle------- -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        //        print(reqParameter)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.constaintViewHeight.constant = 50.0
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.addNavigationBackButton()
        self.viewContactDayTimeContiner.layoutIfNeeded()
        self.resetTime()
        self.istap = true
        self.preFillContactDetail()
    }
    
    //MARK:- --------Manage Navigation Back Button------- -
    func addNavigationBackButton(){
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(image: UIImage(named: ImageName.backButtom),style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
        self.navigationItem.leftBarButtonItem!.tintColor = .black
        
    }
    
    @objc func backNavigationAction(){
        self.setParameter()
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- --------Setup view------- -
    func setup(){
        
        self.btnSms.isSelected = false
        self.btnCall.isSelected = false
        self.btnEmail.isSelected = false
        self.view.backgroundColor = UIColor.kAppThemeColor()
        self.navigationController?.isNavigationBarHidden = false
        
        self.title = "MY PROFILE"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        transparentNav(nav: self.navigationController!)
        self.navigationItem.leftBarButtonItem?.image = UIImage(named: ImageName.backButtom)
        self.navigationItem.leftBarButtonItem?.accessibilityElementsHidden = true
        self.collectionViewDays.delegate = self
        self.collectionViewDays.dataSource = self
        self.collectionViewDays.register(UINib(nibName: "DayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DayCollectionViewCell")
        self.collectionViewDays.allowsMultipleSelection = true
        
        // Configure Date picker
        self.configureDatePicker()
        print("Start Time \(self.startTime)")
        print("End Time \(self.endTime)")
    }
    
    
    func preFillContactDetail(){
        if reqParameter.count != 0{
            let call = reqParameter.getStringValue(key: "hasCall")
            //        let calls = reqParameter.getStringValue(key: <#T##String#>)
            let sms = reqParameter.getStringValue(key: "hasSMS")
            let email = reqParameter.getStringValue(key: "hasEmail")
            let avalDayTime = reqParameter["availabilityTime"] as? [NSDictionary] ?? [NSDictionary]()
            //reqParameter.getArrayDictionary(key: "availabilityTime")
            self.noSelectedDayTime = avalDayTime.count
            print("call = \(call)")
            print("sms = \(sms)")
            print("email = \(email)")
            print("avlTime = \(avalDayTime)")
            if sms == "true"
            {
                self.btnSms.isSelected = true
                self.isSelectSms = "true"
                viewSmsContainer.backgroundColor = UIColor.kButtonSelectedColor()
                btnSms.setTitleColor(UIColor.kBlueColor(), for: .normal)
            }
            else
            {
                self.btnSms.isSelected = false
                self.isSelectSms = "false"
                viewSmsContainer.backgroundColor = .white
                btnSms.setTitleColor(UIColor.kInstructionColor(), for: .normal)
                
            }
            if call == "true"
            {
                btnCall.isSelected = true
                self.isSelectCall = "true"
                viewCallConainer.backgroundColor = UIColor.kButtonSelectedColor()
                btnCall.setTitleColor(UIColor.kBlueColor(), for: .normal)
            }
            else
            {
                btnCall.isSelected = false
                self.isSelectCall = "false"
                viewCallConainer.backgroundColor = .white
                btnCall.setTitleColor(UIColor.kInstructionColor(), for: .normal)
            }
            if email == "true"
            {
                btnEmail.isSelected = true
                isSelectEmail = "true"
                viewEmailContainer.backgroundColor = UIColor.kButtonSelectedColor()
                btnEmail.setTitleColor(UIColor.kBlueColor(), for: .normal)
            }
            else
            {
                btnEmail.isSelected = false
                isSelectEmail = "false"
                viewEmailContainer.backgroundColor = .white
                btnEmail.setTitleColor(UIColor.kInstructionColor(), for: .normal)
            }
            if avalDayTime.count > 0
            {
                self.btnBestContactDays.setTitleColor(.kBlueColor(), for: .normal)
                self.viewContactDayTimeContiner.backgroundColor = UIColor.kButtonSelectedColor()
            
//            for items in avalDayTime{
//
//                }
//            for i in 0..<avalDayTime.count{
//                let dict = avalDayTime[i]
//                let day = dict["day"] as! String
//                let startTime = dict["day"] as! String
//                let endTime = dict["day"] as! String
//                if day == "Mon"{
//                    self.arrWeekStatus[i]?.isSelect = true
//                    self.arrWeekStatus[i]?.startDate = startTime
//                    self.arrWeekStatus[i]?.startDate = endTime
//                }else if day == "Tue"{
//                    self.arrWeekStatus[i]?.isSelect = true
//                    self.arrWeekStatus[i]?.startDate = startTime
//                    self.arrWeekStatus[i]?.startDate = endTime
//                }else if day == "Wed"{
//                    self.arrWeekStatus[i]?.isSelect = true
//                    self.arrWeekStatus[i]?.startDate = startTime
//                    self.arrWeekStatus[i]?.startDate = endTime
//                }else if day == "Thu"{
//                    self.arrWeekStatus[i]?.isSelect = true
//                    self.arrWeekStatus[i]?.startDate = startTime
//                    self.arrWeekStatus[i]?.startDate = endTime
//                }else if day == "Fri"{
//                    self.arrWeekStatus[i]?.isSelect = true
//                    self.arrWeekStatus[i]?.startDate = startTime
//                    self.arrWeekStatus[i]?.startDate = endTime
//                }else if day == "Sat"{
//                    self.arrWeekStatus[i]?.isSelect = true
//                    self.arrWeekStatus[i]?.startDate = startTime
//                    self.arrWeekStatus[i]?.startDate = endTime
//                }else if day == "Sun"{
//                    self.arrWeekStatus[i]?.isSelect = true
//                    self.arrWeekStatus[i]?.startDate = startTime
//                    self.arrWeekStatus[i]?.startDate = endTime
//                }
//            }
                
             
                for i in 0..<avalDayTime.count
                {
                    let dict = avalDayTime[i]
                    let day = dict["day"] as! String
                    let startTime = dict["startTime"] as! String
                    let endTime = dict["endTime"] as! String
                    
                    if day == "Mon"
                    {
                        self.arrWeekStatus[0]?.isSelect = true
                        self.arrWeekStatus[0]?.startDate = startTime
                        self.arrWeekStatus[0]?.endDate = endTime
                        
                       
                    }
                    else
                    if day == "Tue"
                    {
                        self.arrWeekStatus[1]?.isSelect = true
                        self.arrWeekStatus[1]?.startDate = startTime
                        self.arrWeekStatus[1]?.endDate = endTime
                       
                    }
                    else  if day == "Wed"
                    {
                        self.arrWeekStatus[2]?.isSelect = true
                        self.arrWeekStatus[2]?.startDate = startTime
                        self.arrWeekStatus[2]?.endDate = endTime
                        
                       
                    }
                    else
                    if day == "Thu"
                    {
                        self.arrWeekStatus[3]?.isSelect = true
                        self.arrWeekStatus[3]?.startDate = startTime
                        self.arrWeekStatus[3]?.endDate = endTime
                        
                       
                    }
                    else
                    if day == "Fri"
                    {
                        self.arrWeekStatus[4]?.isSelect = true
                        self.arrWeekStatus[4]?.startDate = startTime
                        self.arrWeekStatus[4]?.endDate = endTime
                        
                        
                    }
                    else
                    if day == "Sat"
                    {
                        self.arrWeekStatus[5]?.isSelect = true
                        self.arrWeekStatus[5]?.startDate = startTime
                        self.arrWeekStatus[5]?.endDate = endTime
                        
                       
                    }
                    else
                    if day == "Sun"
                    {
                        self.arrWeekStatus[6]?.isSelect = true
                        self.arrWeekStatus[6]?.startDate = startTime
                        self.arrWeekStatus[6]?.endDate = endTime
                        
                       
                    }
                }
            }
            
            self.collectionViewDays.reloadData()
            }else{
            print("no Data present in Dictionary")
        }
    }
    
    //MARK:- --------Datepicker Custom Methods------- -
    func configureDatePicker(){
        datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 200))
        datePicker.addTarget(self, action: #selector(selectTime), for: .allEvents)
        let doneButton = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(done))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(self.datePickerCancel))
        let toolBar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: true)
        datePicker.datePickerMode = .time
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        self.txtStartDate.inputAccessoryView = toolBar
        self.txtStartDate.inputView = datePicker
        self.txtEndTime.inputAccessoryView = toolBar
        self.txtEndTime.inputView = datePicker
    }
    
    @objc func selectTime(){
        
    }
    
    @objc func done(){
        if self.txtStartDate.isFirstResponder{
            dateFormater.dateFormat = "HH:mm"
            date = datePicker.date
            txtStartDate.text = dateFormater.string(from: datePicker.date)
            print("Start Time = \(txtStartDate.text!)")
            self.arrWeekStatus[self.index]?.startDate =  txtStartDate.text!
            print("Dictionary Start Time = \( String(describing: self.arrWeekStatus[self.index]?.startDate))")
            //            self.datePicker.minimumDate = date
            txtStartDate.resignFirstResponder()
        }else{
            dateFormater.dateFormat = "HH:mm"
            date = datePicker.date
            txtEndTime.text = dateFormater.string(from: datePicker.date)
            print("End Time = \(String(describing: txtEndTime.text))")
            self.arrWeekStatus[self.index]?.endDate =  txtEndTime.text!
            print("Dictionary End Time = \( String(describing: self.arrWeekStatus[self.index]?.endDate))")
            txtEndTime.resignFirstResponder()
        }
    }
    
    @objc func datePickerCancel(){
        
        self.view.endEditing(true)
    }
    
    //MARK:- --------TextField Delegate methods------- -
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Start Editing")
        if textField == self.txtStartDate{
            self.txtStartDate.becomeFirstResponder()
            let tempDate = self.dateFormater.date(from: self.arrWeekStatus[index]!.startDate)
            self.startTime = dateFormater.date(from: "4 : 00")!
            self.datePicker.minimumDate = self.startTime
            datePicker.date = tempDate!
            
        }else{
            // set max date for validation
            self.txtEndTime.becomeFirstResponder()
            let tempDate = self.dateFormater.date(from: self.arrWeekStatus[index]!.endDate)
            datePicker.date = tempDate!
            self.datePicker.minimumDate =  self.startTime + 1 * 60 * 60
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("End Editing")
        self.startTime = self.dateFormater.date(from: self.arrWeekStatus[index]!.startDate)!
        
        if textField == self.txtStartDate{
            self.arrWeekStatus[index]?.startDate = textField.text!
            print("TempFinal = \( self.startTime + 1 * 60 * 60)")
            
        }else{
            self.arrWeekStatus[index]?.endDate = textField.text!
            
            
        }
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if self.idDaySelect == 999{
            return false
        }else{
            return true
        }
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if self.idDaySelect == 999{
            return false
        }else{
            return true
        }
    }
    //MARK:- --------Custom methods------- -
    func toggleColorButton(Container: UIView,sender: UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected
        {
            if sender == self.btnSms{
                self.isSelectSms = "true"
            }else if sender == self.btnCall{
                self.isSelectCall = "true"
            }else if sender == self.btnEmail{
                self.isSelectEmail = "true"
            }
            Container.backgroundColor = UIColor.kButtonSelectedColor()
            sender.setTitleColor(UIColor.kBlueColor(), for: .normal)
            sender.titleLabel?.font = .custom(style: .Regular, size: .s16)
            
        }
        else
        {
            if sender == self.btnSms
            {
                self.isSelectSms = "false"
            }
            else if sender == self.btnCall
            {
                self.isSelectCall = "false"
            }
            else if sender == self.btnEmail
            {
                self.isSelectEmail = "false"
            }
            Container.backgroundColor = .white
            sender.setTitleColor(UIColor.kInstructionColor(), for: .normal)
            sender.titleLabel?.font = .custom(style: .Regular, size: .s16)
        }
    }
    func viewClickExpand(){
        self.imgViewDropdown.image = UIImage(named: ImageName.upperArrow)
        self.constaintViewHeight.constant = 300.0
        self.viewContactDayTimeContiner.layer.borderWidth = 1.0
        self.viewContactDayTimeContiner.layer.borderColor = UIColor.kBorderColor().cgColor
        self.viewContactDayTimeContiner.layoutIfNeeded()
        self.istap = false
    }
    func viewClickCollaps(){
        self.imgViewDropdown.image = UIImage(named: ImageName.downArrow)
        self.constaintViewHeight.constant = 50.0
        self.viewContactDayTimeContiner.layer.borderWidth = 0.0
        self.viewContactDayTimeContiner.layoutIfNeeded()
        //        self.viewContactDayTimeContiner.backgroundColor = .white
        
        self.istap = true
    }
    
    func resetTime(){
        self.dateFormater.dateFormat = "HH:mm"
        let dateS = dateFormater.date(from: "10:00")
        self.startTime = dateS!
        self.txtStartDate.text = dateFormater.string(from: self.startTime)
        self.arrWeekStatus[currentIndex]?.startDate = self.txtStartDate.text!
        
        self.dateFormater.dateFormat = "HH:mm"
        let dateE = dateFormater.date(from: "19:00")
        self.endTime = dateE!
        self.txtEndTime.text = dateFormater.string(from: self.endTime)
        self.arrWeekStatus[currentIndex]?.endDate = self.txtEndTime.text!
        
    }
    func latestSelectedTime(){
        
    }
    func setParameter(){
        guard self.isSelectCall == "true" || self.isSelectSms == "true" || self.isSelectEmail == "true"  else {
            return self.showAlertMessage(messageStr: " Please select at least one option to contact") { (actin) in
                print("Must Select one optiont")
            }
        }
        
        reqParameter["hasCall"] = self.isSelectCall
        reqParameter["hasSMS"] = self.isSelectSms
        reqParameter["hasEmail"] =  self.isSelectEmail
    }
    
    
    //MARK:- --------ButonClick Action------- -
    @IBAction func btnClickSms(_ sender: UIButton) {
        self.toggleColorButton(Container: self.viewSmsContainer, sender: self.btnSms)
        
    }
    
    @IBAction func btnClickCall(_ sender: Any) {
        self.toggleColorButton(Container: self.viewCallConainer, sender: self.btnCall)
        
    }
    
    @IBAction func btnClickEmail(_ sender: Any) {
        self.toggleColorButton(Container: self.viewEmailContainer, sender: self.btnEmail)
        
    }
    
    @IBAction func btnClickSaveAndNext(_ sender: UIButton) {
//        guard self.isSelectCall == "true" || self.isSelectSms == "true" || self.isSelectEmail == "true"  else {
//            return self.showAlertMessage(messageStr: " Please select at least one option to contact") { (actin) in
//                print("Must Select one optiont")
//            }
//        }
//
//        reqParameter["hasCall"] = self.isSelectCall
//        reqParameter["hasSMS"] = self.isSelectSms
//        reqParameter["hasEmail"] =  self.isSelectEmail
//        print(reqParameter)
        self.setParameter()
        let nextVC = AskQuestionVC.instantiate(fromAppStoryboard: .Buyer)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    
    @IBAction func btnClickBestContackDays(_ sender: UIButton) {
        if istap == true{
            self.viewClickExpand()
            self.viewContactDayTimeContiner.backgroundColor = .white
            sender.setTitleColor(UIColor.kInstructionColor(), for: .normal)
            sender.titleLabel?.font = .custom(style: .Regular, size: .s16)
        }else{
            self.viewClickCollaps()
            if self.arrSelectedWeeks.count == 0{
                self.viewContactDayTimeContiner.backgroundColor = .white
                sender.setTitleColor(UIColor.kInstructionColor(), for: .normal)
                sender.titleLabel?.font = .custom(style: .Regular, size: .s16)
            }else{
                self.viewContactDayTimeContiner.backgroundColor = UIColor.kButtonSelectedColor()
                sender.setTitleColor(UIColor.kBlueColor(), for: .normal)
                sender.titleLabel?.font = .custom(style: .Regular, size: .s16)
            }
        }
        
    }
    
    @IBAction func btnClickCancel(_ sender: Any) {
        print("Button Cancel has been clicked")
        
        for i in 0..<arrWeekStatus.count{
            let newIndexPath = IndexPath.init(row: i, section: 0)
            let cell = collectionViewDays.cellForItem(at: newIndexPath) as! DayCollectionViewCell
            cell.viewCellConainer.backgroundColor = .kAppThemeColor()
            cell.btnDay.setTitleColor(UIColor.kInstructionColor(), for: .normal)
            cell.viewCellConainer.layer.borderWidth = 0
            arrWeekStatus[i]?.isSelect = false
            arrWeekStatus[i]?.isBorder = false
            arrWeekStatus[i]?.startDate = "10:00"
            self.txtStartDate.text = arrWeekStatus[i]?.startDate
            arrWeekStatus[i]?.endDate = "19:00"
            self.txtEndTime.text = arrWeekStatus[i]?.endDate
            
        }
        //        self.viewClickCollaps()
        self.arrSelectedWeeks.removeAll()
        reqParameter["availabilityTime"] = [:]
        self.viewContactDayTimeContiner.backgroundColor = .white
        self.btnBestContactDays.setTitleColor(.kInstructionColor(), for: .normal)
    }
    @IBAction func btnClickSave(_ sender: Any) {
        print("Button save has been Clicked")
        var tempArr = [arrSelectedWeeks]
        tempArr.removeAll()
        let arrTempWeeks = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
        for i in  0..<arrWeekStatus.count{
            if arrWeekStatus[i]?.isSelect == true{
                if arrWeekStatus[i]!.startDate >= arrWeekStatus[i]!.endDate{
                    print("End Time can not be less than Start Time")
                }else{
                    self.arrSelectedWeeks = [
                        "day" : arrTempWeeks[i]  as Any,
                        "startTime" : arrWeekStatus[i]!.startDate as Any,
                        "endTime" : arrWeekStatus[i]!.endDate as Any
                    ]
                    tempArr.append(self.arrSelectedWeeks)
                    reqParameter["availabilityTime"] = tempArr
                }
                //                print("TempArr = \(tempArr)")
                
            }
        }
        self.viewClickCollaps()
        self.viewContactDayTimeContiner.backgroundColor = .kButtonSelectedColor()
        self.btnBestContactDays.setTitleColor(.kBlueColor(), for: .normal)
        print("reqParameter = \(reqParameter)")
        //        print(arrWeekStatus)
    }
    
    
    //MARK:- --------Collection View Datasource and Delegate methods------- -
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrWeekStatus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionViewDays.dequeueReusableCell(withReuseIdentifier: "DayCollectionViewCell", for: indexPath) as! DayCollectionViewCell
        
        _ = arrWeekStatus[indexPath.row]
        cell.viewCellConainer.backgroundColor = UIColor.kAppThemeColor()
        cell.viewCellConainer.layer.borderWidth = 0
        cell.viewCellConainer.layer.cornerRadius = 5
        cell.btnDay.setTitleColor(UIColor.kInstructionColor(), for: .normal)
        
        cell.btnDay.setTitle(arrWeekStatus[indexPath.row]?.nameOFDay, for: .normal)
        cell.btnDay.titleLabel?.font = .custom(style: .Medium, size: .s16)
        cell.btnDay.isUserInteractionEnabled = false
        if indexPath.row == currentIndex{
            
            self.idDaySelect = indexPath.row
            cell.viewCellConainer.layer.borderColor = UIColor.black.cgColor
            cell.viewCellConainer.layer.borderWidth = 1
            cell.viewCellConainer.layer.borderColor = UIColor.kBlueColor().cgColor
            cell.btnDay.setTitleColor(UIColor.kBlueColor(), for: .normal)
            cell.viewCellConainer.backgroundColor = UIColor.kSelectedColor()
            arrWeekStatus[indexPath.row]?.isBorder = true
            
            //            print("DictData = \(String(describing: self.arrWeekStatus[indexPath.row]?.startDate))")
            //            print("DictData = \(String(describing: self.arrWeekStatus[indexPath.row]?.endDate))")
            self.txtStartDate.text =  self.arrWeekStatus[indexPath.row]?.startDate
            self.startTime = dateFormater.date(from: self.txtStartDate.text!)!
            self.txtEndTime.text = self.arrWeekStatus[indexPath.row]?.endDate
            self.endTime = dateFormater.date(from: self.txtStartDate.text!)!
            
        }
        else{
            if ((arrWeekStatus[indexPath.row]?.isSelect) == true){
                if self.noSelectedDayTime != 0{
                    self.idDaySelect = 999
                    self.noSelectedDayTime = self.noSelectedDayTime - 1
                    self.txtStartDate.text =  self.arrWeekStatus[indexPath.row]?.startDate
                    self.startTime = dateFormater.date(from: self.txtStartDate.text!)!
                    self.txtEndTime.text = self.arrWeekStatus[indexPath.row]?.endDate
                    self.endTime = dateFormater.date(from: self.txtStartDate.text!)!
//                    arrWeekStatus[indexPath.row]?.isSelect = false
                }
                
                
//                self.idDaySelect = indexPath.row
                cell.viewCellConainer.layer.borderWidth = 0
                cell.btnDay.setTitleColor(UIColor.kBlueColor(), for: .normal)
                cell.viewCellConainer.backgroundColor = UIColor.kSelectedColor()
                arrWeekStatus[indexPath.row]?.isBorder = true
                
            }
            else{
                
                cell.viewCellConainer.backgroundColor = UIColor.kAppThemeColor()
                cell.viewCellConainer.layer.borderWidth = 0
                cell.btnDay.setTitleColor(UIColor.kInstructionColor(), for: .normal)
                arrWeekStatus[indexPath.row]?.isSelect = false
                arrWeekStatus[indexPath.row]?.isBorder = false
            }
        }
        
        //        print("latestDatta = \(self.arrWeekStatus)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.previousIndex = self.currentIndex
        if let isSelectedTemp = self.arrWeekStatus[indexPath.row]?.isSelect{
            if isSelectedTemp{
                self.arrWeekStatus[indexPath.row]?.isSelect = false
                if self.currentIndex == indexPath.row{
                    self.currentIndex = 999
                }
            }
            else{
                self.arrWeekStatus[indexPath.row]?.isSelect = true
                self.currentIndex = indexPath.row
            }
        }
        
        self.collectionViewDays.reloadData()
        
        UIView.performWithoutAnimation {
            self.collectionViewDays.reloadItems(at: [indexPath])
        }
        
    }
    
    //MARK:- --------Collection View Deligate Flow layout------- -
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ContainerWidth = self.collectionViewDays.frame.width
        let cellWidth = (ContainerWidth/7) - 5
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    
}
