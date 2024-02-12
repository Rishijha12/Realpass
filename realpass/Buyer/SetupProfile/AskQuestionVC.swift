//
//  AskQuestionVC.swift
//  Real Pass Buyer
//
//  Created by i-Verve on 08/03/21.
//  Copyright © 2021 Self. All rights reserved.
//

import UIKit

class AskQuestionVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var lbl_QuestionHeading: UILabel!{
        didSet{
            self.lbl_QuestionHeading.text = "Questions"
            self.lbl_QuestionHeading.textAlignment = .left
            self.lbl_QuestionHeading.textColor = UIColor.kTextColorBuyer()
            self.lbl_QuestionHeading.font = .custom(style: .Medium, size: .s20)
        }
    }
    @IBOutlet var lbl_FeltUnwell: UILabel!{
        didSet{
            self.lbl_FeltUnwell.text = "Have you felt unwell or had flu like symptoms in the last 2 weeks?"
            self.lbl_FeltUnwell.numberOfLines = 0
            self.lbl_FeltUnwell.textAlignment = .left
            self.lbl_FeltUnwell.textColor = UIColor.kInstructionColor()
            self.lbl_FeltUnwell.font = .custom(style: .Regular, size: .s14)
        }
    }

    @IBOutlet var btn_FeltUnwellYes: UIButton!{
        didSet{
            self.btn_FeltUnwellYes.setImage(UIImage(named: ImageName.circle), for: .normal)
            self.btn_FeltUnwellYes.setImage(UIImage(named: ImageName.radio), for: .selected)
            self.btn_FeltUnwellYes.isSelected = false
            self.btn_FeltUnwellYes.titleLabel?.font = .custom(style: .Regular, size: .s14)
            self.btn_FeltUnwellYes.setTitleColor(.kRadioLabelColor(), for: .normal)
        }
    }
  
    @IBOutlet var btn_FeltUnwellNo: UIButton!{
        didSet{
            self.btn_FeltUnwellNo.setImage(UIImage(named: ImageName.circle), for: .normal)
            self.btn_FeltUnwellNo.setImage(UIImage(named: ImageName.radio), for: .selected)
            self.btn_FeltUnwellNo.isSelected = true
            self.btn_FeltUnwellNo.titleLabel?.font = .custom(style: .Regular, size: .s14)
            self.btn_FeltUnwellNo.setTitleColor(.kRadioLabelColor(), for: .normal)
        }
    }
    @IBOutlet var lbl_ConnectedWCovdPstvPpl: UILabel!{
        didSet{
            self.lbl_ConnectedWCovdPstvPpl.text = "Have you been in contact with any confirmed cases of COVID 19 in the last 2 weeks?"
            self.lbl_ConnectedWCovdPstvPpl.numberOfLines = 0
            self.lbl_ConnectedWCovdPstvPpl.textAlignment = .left
            self.lbl_ConnectedWCovdPstvPpl.textColor = UIColor.kInstructionColor()
            self.lbl_ConnectedWCovdPstvPpl.font = .custom(style: .Regular, size: .s12)
        }
    }
  
 
    @IBOutlet var btn_ConnectedWCovdPstvPplYes: UIButton!{
        didSet{
            self.btn_ConnectedWCovdPstvPplYes.setImage(UIImage(named: ImageName.circle), for: .normal)
            self.btn_ConnectedWCovdPstvPplYes.setImage(UIImage(named: ImageName.radio), for: .selected)
            self.btn_ConnectedWCovdPstvPplYes.isSelected = false
            self.btn_ConnectedWCovdPstvPplYes.titleLabel?.font = .custom(style: .Regular, size: .s14)
            self.btn_ConnectedWCovdPstvPplYes.setTitleColor(.kRadioLabelColor(), for: .normal)
        }
    }
    @IBOutlet var btn_ConnectedWCovdPstvPplNo: UIButton!{
        didSet{
            self.btn_ConnectedWCovdPstvPplNo.setImage(UIImage(named: ImageName.circle), for: .normal)
            self.btn_ConnectedWCovdPstvPplNo.setImage(UIImage(named: ImageName.radio), for: .selected)
            self.btn_ConnectedWCovdPstvPplNo.isSelected = true
            self.btn_ConnectedWCovdPstvPplNo.titleLabel?.font = .custom(style: .Regular, size: .s14)
            self.btn_ConnectedWCovdPstvPplNo.setTitleColor(.kRadioLabelColor(), for: .normal)
        }
    }
    @IBOutlet var lbl_Instruction: UILabel!{
        didSet{
            self.lbl_Instruction.text = "*If your symptoms or answers change, please update it prior to inspecting properties"
            self.lbl_Instruction.numberOfLines = 0
            self.lbl_Instruction.textAlignment = .left
            self.lbl_Instruction.textColor = UIColor.kInstructionColor()
            self.lbl_Instruction.font = .custom(style: .Regular, size: .s12)
        }
    }
    
    @IBOutlet var view_Question1: UIView!{
        didSet{
            self.view_Question1.backgroundColor = .white
            self.view_Question1.layer.cornerRadius = 10.0
            self.view_Question1.layer.masksToBounds = false
            self.view_Question1.clipsToBounds = true
        }
    }
    @IBOutlet var view_Question2: UIView!{
        didSet{
            self.view_Question2.backgroundColor = .white
            self.view_Question2.layer.cornerRadius = 10.0
            self.view_Question2.layer.masksToBounds = false
            self.view_Question2.clipsToBounds = true
        }
    }
    @IBOutlet var btn_SaveAndNext: UIButton!{
        didSet{
            self.btn_SaveAndNext.layer.cornerRadius = 5.0
            self.btn_SaveAndNext.layer.masksToBounds = false
            self.btn_SaveAndNext.clipsToBounds = true
            self.btn_SaveAndNext.setTitle("Save & Next", for: .normal)
            self.btn_SaveAndNext.titleLabel?.textColor = UIColor.kTextColorBuyer() 
            self.btn_SaveAndNext.backgroundColor = UIColor.kSplashColor()
            self.btn_SaveAndNext.titleLabel?.font = .custom(style: .Medium, size: .s16)
//            self.btn_SaveAndNext.layer.opacity = 0.5
//            self.btn_SaveAndNext.layer.shadowRadius = 5.0
//            self.btn_SaveAndNext.layer.shadowColor = UIColor.black.cgColor
            
        }
    }
    // MARK:- Local Properties
    var isSelected = false
    var FeltUnwellIsSelected = "No"
    var ConnectedWCovdPstvPplIsSelected = "No"
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.isSelected = false
        self.addNavigationBackButton()
        self.prifillQuesDetail()
    }
    
    // MARK:- Setup
    func setup(){
        self.view.backgroundColor = UIColor.kAppThemeColor()
        self.title = "MY PROFILE"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        transparentNav(nav: self.navigationController!)
    }
    
    func addNavigationBackButton(){
              self.navigationItem.setLeftBarButton(UIBarButtonItem.init(image: UIImage(named: ImageName.backButtom),style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
              self.navigationItem.leftBarButtonItem!.tintColor = .black
              
          }
          
          @objc func backNavigationAction(){
            self.setQuestionParameter()
              self.navigationController?.popViewController(animated: true)
          }
    func setQuestionParameter(){
        reqParameter["answer1"] = self.FeltUnwellIsSelected
        reqParameter["answer2"] = self.ConnectedWCovdPstvPplIsSelected
        print("Question reqParameter = \(reqParameter)")
    }
    
    func prifillQuesDetail(){
        let unwell = reqParameter.getStringValue(key: "answer1")
        let connCovidppl = reqParameter.getStringValue(key: "answer2")
        print("Unwell =\(unwell)")
        print("connCovidppl =\(connCovidppl)")
        if unwell == "Yes"{
            btn_FeltUnwellYes.isSelected = true
            self.FeltUnwellIsSelected = "Yes"
            self.btn_FeltUnwellNo.isSelected = false
        }else{
            btn_FeltUnwellNo.isSelected = true
            self.FeltUnwellIsSelected = "No"
            self.btn_FeltUnwellYes.isSelected = false
        }
        if connCovidppl == "Yes"{
            btn_ConnectedWCovdPstvPplYes.isSelected = true
            self.ConnectedWCovdPstvPplIsSelected = "Yes"
            self.btn_ConnectedWCovdPstvPplNo.isSelected = false
            
        }else{
            btn_ConnectedWCovdPstvPplNo.isSelected = true
            self.ConnectedWCovdPstvPplIsSelected = "No"
            self.btn_ConnectedWCovdPstvPplYes.isSelected = false
        }
    }
    
    // MARK:- Button Click Action
    @IBAction func btnClickYesFeltUnwell(_ sender: UIButton) {
            sender.isSelected = true
        self.FeltUnwellIsSelected = "Yes"
            self.btn_FeltUnwellNo.isSelected = false

    }
    
    @IBAction func btnClickNoFeltUnwell(_ sender: UIButton) {
        sender.isSelected = true
        self.FeltUnwellIsSelected = "No"
        self.btn_FeltUnwellYes.isSelected = false
    }
    
    @IBAction func btnClickNoConnectedWCovdPstvPpl(_ sender: UIButton) {
        sender.isSelected = true
        self.ConnectedWCovdPstvPplIsSelected = "No"
        self.btn_ConnectedWCovdPstvPplYes.isSelected = false
        
    }
    
    @IBAction func btnClickYesConnectedWCovdPstvPpl(_ sender: UIButton) {
        sender.isSelected = true
        self.ConnectedWCovdPstvPplIsSelected = "Yes"
        self.btn_ConnectedWCovdPstvPplNo.isSelected = false
    }
    
    @IBAction func btnClickSaveAndNext(_ sender: UIButton) {
//        let addPartner = self.storyboard?.instantiateViewController(identifier: "AddPartnerVC") as! AddPartnerVC
//        self.navigationController?.pushViewController(addPartner, animated: true)
//        reqParameter["answer1"] = self.FeltUnwellIsSelected
//        reqParameter["answer2"] = self.ConnectedWCovdPstvPplIsSelected
        self.setQuestionParameter()
        let nextVC = AddPartnerVC.instantiate(fromAppStoryboard: .Buyer)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    
}
