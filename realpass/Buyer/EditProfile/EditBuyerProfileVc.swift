//
//  EditBuyerProfileVc.swift
//  realpass
//
//  Created by i-Verve on 15/04/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import SDWebImage
import Alamofire
import SwiftyJSON
import SVProgressHUD

class EditBuyerProfileVc: UIViewController,UINavigationControllerDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,AddPartnerDelegate,UITextViewDelegate,viewPopupDelegate,SubrubsVCDelegate,UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource {
    
    // MARK:- Outlets PersonalProfile Outlets
    // SkyFloat Outles
    
    
    @IBOutlet weak var lblSTDCode: UILabel!{
        didSet{
            lblSTDCode.font = UIFont.custom(style: .Medium, size: .s14)
            lblSTDCode.textColor = UIColor.kTextColor()
        }
    }
    
    @IBOutlet weak var btnUpdate: UIButton!{
        didSet{
            self.btnUpdate.setTitle("Update", for: .normal)
            self.btnUpdate.layer.cornerRadius = 5.0
            self.btnUpdate.layer.masksToBounds = false
            self.btnUpdate.clipsToBounds = true
            self.btnUpdate.setTitleColor(.black, for: .normal)
            self.btnUpdate.backgroundColor = .kSplashColor()
            self.btnUpdate.titleLabel?.font = .custom(style: .Medium, size: .s16)
            
        }
    }
    
    @IBOutlet var txtFirstName: SkyFloatingLabelTextField!{
        didSet{
            
            self.txtFirstName.attributedPlaceholder =
                NSAttributedString(string: "First Name",
                                   attributes: [
                                    NSAttributedString.Key.font : UIFont.custom(style: .Regular, size: .s14),
                                    NSAttributedString.Key.foregroundColor : UIColor.kRadioLabelColor()
                ])
            
            self.txtFirstName.title = "First Name"
            //            self.txtFirstName.text = "Jon"
            self.txtFirstName.convertFirstLetter()
            self.txtFirstName.font = .custom(style: .Medium, size: .s14)
            self.txtFirstName.titleFont = .custom(style: .Medium, size: .s14)
            self.txtFirstName.titleColor = UIColor.kTextRedColor()
            self.txtFirstName.placeholderColor = UIColor.kRadioLabelColor()
            self.txtFirstName.lineColor = UIColor.kRadioLabelColor()
            self.txtFirstName.lineHeight = 1.0
            self.txtFirstName.selectedLineColor = UIColor.kCellSelectedColor()
            //            self.txtFirstName.keyboardType = .namePhonePad
            self.txtFirstName.textContentType = .name
            self.txtFirstName.autocapitalizationType = .words
            
        }
    }
    @IBOutlet var txtLastName: SkyFloatingLabelTextField!{
        didSet{
            
            self.txtLastName.attributedPlaceholder =
                NSAttributedString(string: "Last name",
                                   attributes: [
                                    NSAttributedString.Key.font : UIFont.custom(style: .Regular, size: .s14),
                                    NSAttributedString.Key.foregroundColor : UIColor.kRadioLabelColor()
                ])
            
            self.txtLastName.title = "Last Name"
            //            self.txtLastName.text = "Doe"
            self.txtLastName.convertFirstLetter()
            self.txtLastName.font = .custom(style: .Medium, size: .s14)
            self.txtLastName.titleFont = .custom(style: .Medium, size: .s14)
            self.txtLastName.titleColor = UIColor.kTextRedColor()
            self.txtLastName.placeholderColor = UIColor.kRadioLabelColor()
            self.txtLastName.lineColor = UIColor.kRadioLabelColor()
            self.txtLastName.lineHeight = 1.0
            self.txtLastName.selectedLineColor = UIColor.kCellSelectedColor()
            //            self.txtLastName.keyboardType = .namePhonePad
            self.txtLastName.autocapitalizationType = .words
            
        }
    }
    @IBOutlet var txtMobile: SkyFloatingLabelTextField!{
        didSet{
            
            self.txtMobile.attributedPlaceholder =
                NSAttributedString(string: "Mobile",
                                   attributes: [
                                    NSAttributedString.Key.font : UIFont.custom(style: .Regular, size: .s14),
                                    NSAttributedString.Key.foregroundColor : UIColor.kRadioLabelColor()
                ])
            
            self.txtMobile.title = "Mobile"
            //            self.txtMobile.text = "+61474747474"
            self.txtMobile.convertFirstLetter()
            self.txtMobile.font = .custom(style: .Medium, size: .s14)
            self.txtMobile.titleFont = .custom(style: .Medium, size: .s14)
            self.txtMobile.titleColor = UIColor.kTextRedColor()
            self.txtMobile.placeholderColor = UIColor.kRadioLabelColor()
            self.txtMobile.lineColor = UIColor.kRadioLabelColor()
            self.txtMobile.lineHeight = 1.0
            self.txtMobile.selectedLineColor = UIColor.kCellSelectedColor()
            self.txtMobile.keyboardType = .phonePad
            self.txtMobile.textContentType = .telephoneNumber
            
        }
    }

    @IBOutlet var viewFormContent: UIView!{
        didSet{
            self.viewFormContent.layer.cornerRadius = 10.0
            self.viewFormContent.clipsToBounds = true
        }
    }
    @IBOutlet var lblAddProfile: UILabel!{
        didSet{
            self.lblAddProfile.text = "Tap to change image"
            self.lblAddProfile.textColor = UIColor.kTaptoChangeProfile()
            self.lblAddProfile.font = .custom(style: .Medium, size: .s12)
        }
    }
    @IBOutlet var imgView: UIImageView!{
        didSet{
            
        }
    }
    @IBOutlet var view_ImageConten: UIView!
    @IBOutlet var contentView: UIView!{
        didSet{
            
            
        }
    }
    // Contact Days Outlts
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
            //            viewContentScr.backgroundColor = UIColor.kAppThemeColor()
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
            self.dateFormater.dateFormat = "HH : mm"
            self.txtEndTime.font = UIFont.custom(style: .Regular, size: .s24)
            self.txtEndTime.textColor = UIColor.kInstructionColor()
            self.txtEndTime.textAlignment = .center
            self.txtEndTime.delegate = self
        }
    }
    @IBOutlet var txtStartDate: UITextField!{
        didSet{
            self.txtStartDate.backgroundColor = UIColor.kAppThemeColor()
            self.dateFormater.dateFormat = "HH : mm"
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
    @IBOutlet var `btnBestContactDays`: UIButton!{
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
            //            self.viewContactDayTimeContiner.backgroundColor = .white
            
        }
    }
    @IBOutlet var viewExpand: UIView!
    @IBOutlet var tblPartnerHeight: NSLayoutConstraint!
    @IBOutlet var partnerViewHeight: NSLayoutConstraint!
    @IBOutlet var lbl_txtviewCout: UILabel!{
        didSet{
           
            self.lbl_txtviewCout.font = .custom(style: .Regular, size: .s16)
            self.lbl_txtviewCout.textColor = UIColor.kPlaceholderColor()
        }
    }
    
    // AskQuestions Outlets
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
            self.lbl_ConnectedWCovdPstvPpl.font = .custom(style: .Regular, size: .s14)
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
    // Partner outlets
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
            self.lblNoPartner.font = .custom(style: .Medium, size: .s12)
            self.lblNoPartner.textColor = .black
        }
    }
    // Add little bit more Outlets
    @IBOutlet var viewAddlittleBitMoreContainer: UIView!{
        didSet{
            
            self.viewAddlittleBitMoreContainer.layer.cornerRadius = 10.0
            self.viewAddlittleBitMoreContainer.layer.masksToBounds = false
            self.viewAddlittleBitMoreContainer.clipsToBounds = true
            self.viewAddlittleBitMoreContainer.backgroundColor = .white
            
        }
    }
    @IBOutlet var lblEmaiEditProfile: UILabel!{
        didSet{
            self.lblEmaiEditProfile.textColor = .black
            self.lblEmaiEditProfile.font = .custom(style: .Medium, size: .s14)
        }
    }
    @IBOutlet var lblTitleTaleUsLittleBitMore: UILabel!{
        didSet{
            self.lblTitleTaleUsLittleBitMore.text = "This information will be shared with agents. Only fill out information you’re comfortable sharing."
            self.lblTitleTaleUsLittleBitMore.textColor = .black
            self.lblTitleTaleUsLittleBitMore.numberOfLines = 0
            self.lblTitleTaleUsLittleBitMore.font = .custom(style: .Regular, size: .s14)
        }
    }
    @IBOutlet var lblInfoThisInfoOnlyforAgent: UILabel!{
        didSet{
            self.lblInfoThisInfoOnlyforAgent.text = "Please tell us a little bit more about you ."
            self.lblInfoThisInfoOnlyforAgent.textColor = .black
            self.lblInfoThisInfoOnlyforAgent.font = .custom(style: .Medium, size: .s20)
        }
    }
    @IBOutlet var btnSaveAndNext: UIButton!{
        didSet{
            self.btnSaveAndNext.setTitle("Save", for: .normal)
            self.btnSaveAndNext.layer.cornerRadius = 5.0
            self.btnSaveAndNext.layer.masksToBounds = false
            self.btnSaveAndNext.clipsToBounds = true
            self.btnSaveAndNext.titleLabel?.textColor = UIColor.kTextColorBuyer()
            self.btnSaveAndNext.backgroundColor = UIColor.kSplashColor()
            self.btnSaveAndNext.titleLabel?.font = .custom(style: .Medium, size: .s16)
        }
    }
    @IBOutlet var lblSelectPreferedSubrubs: UILabel!{
        didSet{
            self.lblSelectPreferedSubrubs.text = "Select Your Preferred suburbs"
            self.lblSelectPreferedSubrubs.textColor = UIColor.kRadioLabelColor()
            self.lblSelectPreferedSubrubs.font = .custom(style: .Regular, size: .s14)
        }
    }
    @IBOutlet var viewPlaceContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var txtFieldSubrubs: SkyFloatingLabelTextField!{
        didSet{
            self.txtFieldSubrubs.text = ""
            self.txtFieldSubrubs.textColor = .black
            self.txtFieldSubrubs.title = "select your preferred suburbs"
            self.txtFieldSubrubs.convertFirstLetter()
            self.txtFieldSubrubs.titleFont = .custom(style: .Regular, size: .s14)
            self.txtFieldSubrubs.titleColor = .kRadioLabelColor()
            //            self.txtFieldSubrubs.title = ""
            self.txtFieldSubrubs.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var imgViewDown: UIImageView!{
        didSet{
            self.imgViewDown.image = UIImage(named: ImageName.downArrow)
        }
    }
    @IBOutlet var btnAddSubrubs: UIButton!{
        didSet{
            
        }
    }
    @IBOutlet var viewSeparator: UIView!{
        didSet{
            self.viewSeparator.backgroundColor = UIColor.kBorderColorAddLittleBitMore()
        }
    }
    @IBOutlet var lblPrizeRange: UILabel!{
        didSet{
            self.lblPrizeRange.text = "Price range"
            self.lblPrizeRange.textColor = .black
            self.lblPrizeRange.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var stkViewPrizeConainer: UIStackView!{
        didSet{
            
        }
    }
    @IBOutlet var viewMinimumPrizeContainer: UIView!{
        didSet{
            self.viewMinimumPrizeContainer.layer.cornerRadius = 10.0
            self.viewMinimumPrizeContainer.layer.masksToBounds = false
            self.viewMinimumPrizeContainer.clipsToBounds = true
        }
    }
    @IBOutlet var imgViewDollerSignMin: UIImageView!{
        didSet{
            self.imgViewDollerSignMin.image = UIImage(named: ImageName.doller)
            self.imgViewDollerSignMin.backgroundColor = UIColor.kDolorImgViewColor()
            self.imgViewDollerSignMin.contentMode = .center
        }
    }
    @IBOutlet var txtMinPrize: UITextField!{
        didSet{
            // self.txtMinPrize.setCustomPropertyTextFeilds("Min Price", txtColor: UIColor.kInstructionColor(), alignMent: .left, keybordType: .numberPad, fontType: .custom(style: .Medium, size: .s16), tintColor: .blue)
            self.txtMinPrize.text = "0"
            self.txtMinPrize.backgroundColor = UIColor.kAppThemeColor()
            self.txtMinPrize.setLeftPaddingPoints(10.0)
            self.txtMinPrize.borderStyle = .none
            self.txtMinPrize.delegate = self
        }
    }
    @IBOutlet var viewMaxPrizeConainer: UIView!{
        didSet{
            self.viewMaxPrizeConainer.layer.cornerRadius = 10.0
            self.viewMaxPrizeConainer.layer.masksToBounds = false
            self.viewMaxPrizeConainer.clipsToBounds = true
        }
    }
    @IBOutlet var imgViewDollerSignMax: UIImageView!{
        didSet{
            self.imgViewDollerSignMax.image = UIImage(named: ImageName.doller)
            self.imgViewDollerSignMax.backgroundColor = UIColor.kDolorImgViewColor()
            self.imgViewDollerSignMax.contentMode = .center
            
        }
    }
    @IBOutlet var txtMaxPrize: UITextField!{
        didSet{
            //            self.txtMaxPrize.setCustomPropertyTextFeilds("Max Price", txtColor: UIColor.kInstructionColor(), alignMent: .left, keybordType: .numberPad, fontType: .custom(style: .Medium, size: .s16), tintColor: .blue)
            self.txtMaxPrize.text = "1,000,000"
            
            self.txtMaxPrize.backgroundColor = UIColor.kAppThemeColor()
            self.txtMaxPrize.setLeftPaddingPoints(10.0)
            self.txtMaxPrize.borderStyle = .none
            self.txtMaxPrize.delegate = self
        }
    }
    @IBOutlet var viewBedroomContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var stprBedroom: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var lblBedrooms: UILabel!{
        didSet{
            self.lblBedrooms.text = "Bedrooms"
            self.lblBedrooms.textColor = .black
            self.lblBedrooms.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var viewBathroomsContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var stprBathrooms: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var lblBathrooms: UILabel!{
        didSet{
            self.lblBathrooms.text = "Bathrooms"
            self.lblBathrooms.textColor = .black
            self.lblBathrooms.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var viewCarConainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var stprCar: UIView!{
        didSet{
            
        }
    }
    
    @IBOutlet var stprBedroomAddContainer: UIView!
    @IBOutlet var btnAddBedroom: UIButton!{
        didSet{
            self.btnAddBedroom.setTitle("+", for: .normal)
            self.btnAddBedroom.titleLabel?.font = .custom(style: .Regular, size: .s24)
            self.btnAddBedroom.setTitleColor(.kInstructionColor(), for: .normal)
            self.btnAddBedroom.backgroundColor = .kAppThemeColor()
            self.btnAddBedroom.layer.cornerRadius = 4.0
            self.btnAddBedroom.clipsToBounds = true
        }
    }
    @IBOutlet var lblNumberOfbedroom: UILabel!{
        didSet{
            self.lblNumberOfbedroom.font = .custom(style: .Regular, size: .s24)
            self.lblNumberOfbedroom.textColor = .kInstructionColor()
        }
    }
    @IBOutlet var stprBedroomRemoveContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var btnRemoveBedroom: UIButton!{
        didSet{
            self.btnRemoveBedroom.setTitle("-", for: .normal)
            self.btnRemoveBedroom.titleLabel?.font = .custom(style: .Regular, size: .s30)
            self.btnRemoveBedroom.setTitleColor(.kInstructionColor(), for: .normal)
            self.btnRemoveBedroom.backgroundColor = .kAppThemeColor()
            self.btnRemoveBedroom.layer.cornerRadius = 4.0
            self.btnRemoveBedroom.clipsToBounds = true
        }
    }
    
    @IBOutlet var stprBathroomAddContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var btnAddBathroom: UIButton!{
        didSet{
            self.btnAddBathroom.setTitle("+", for: .normal)
            self.btnAddBathroom.titleLabel?.font = .custom(style: .Regular, size: .s24)
            self.btnAddBathroom.setTitleColor(.kInstructionColor(), for: .normal)
            self.btnAddBathroom.backgroundColor = .kAppThemeColor()
            self.btnAddBathroom.layer.cornerRadius = 4.0
            self.btnAddBathroom.clipsToBounds = true
        }
    }
    @IBOutlet var lblNumberOfBathroom: UILabel!{
        didSet{
            self.lblNumberOfBathroom.font = .custom(style: .Regular, size: .s24)
            self.lblNumberOfBathroom.textColor = .kInstructionColor()
        }
    }
    @IBOutlet var stprBathroomRemoveContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var btnRemoveBathroom: UIButton!{
        didSet{
            self.btnRemoveBathroom.setTitle("-", for: .normal)
            self.btnRemoveBathroom.titleLabel?.font = .custom(style: .Regular, size: .s30)
            self.btnRemoveBathroom.setTitleColor(.kInstructionColor(), for: .normal)
            self.btnRemoveBathroom.backgroundColor = .kAppThemeColor()
            self.btnRemoveBathroom.layer.cornerRadius = 4.0
            self.btnRemoveBathroom.clipsToBounds = true
        }
    }
    
    @IBOutlet var stprCarAddContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var btnAddCar: UIButton!{
        didSet{
            self.btnAddCar.setTitle("+", for: .normal)
            self.btnAddCar.titleLabel?.font = .custom(style: .Regular, size: .s24)
            self.btnAddCar.setTitleColor(.kInstructionColor(), for: .normal)
            self.btnAddCar.backgroundColor = .kAppThemeColor()
            self.btnAddCar.layer.cornerRadius = 4.0
            self.btnAddCar.clipsToBounds = true
        }
    }
    @IBOutlet var lblNumberOfCar: UILabel!{
        didSet{
            self.lblNumberOfCar.font = .custom(style: .Regular, size: .s24)
            self.lblNumberOfCar.textColor = .kInstructionColor()
        }
    }
    @IBOutlet var stprCarRemoveContainer: UIView!{
        didSet{
            
        }
    }
    @IBOutlet var btnRemoveCar: UIButton!{
        didSet{
            self.btnRemoveCar.setTitle("-", for: .normal)
            self.btnRemoveCar.titleLabel?.font = .custom(style: .Regular, size: .s30)
            self.btnRemoveCar.setTitleColor(.kInstructionColor(), for: .normal)
            self.btnRemoveCar.backgroundColor = .kAppThemeColor()
            self.btnRemoveCar.layer.cornerRadius = 4.0
            self.btnRemoveCar.clipsToBounds = true
        }
    }
    
    @IBOutlet var lblCars: UILabel!{
        didSet{
            self.lblCars.text = "Cars"
            self.lblCars.textColor = .black
            self.lblCars.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var lblAboutMe: UILabel!{
        didSet{
            self.lblAboutMe.text = "About Me"
            self.lblAboutMe.textColor = .black
            self.lblAboutMe.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var txtViewAboutMe: UITextView!{
        didSet{
            self.txtViewAboutMe.delegate = self
            self.txtViewAboutMe.backgroundColor = .kAppThemeColor()
        }
    }
    @IBOutlet var lblPreAprovedFinance: UILabel!{
        didSet{
            self.lblPreAprovedFinance.text = "Are you pre-approved for finance?"
            self.lblPreAprovedFinance.numberOfLines = 0
            self.lblPreAprovedFinance.textColor = .black
            self.lblPreAprovedFinance.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var lblPreAprovedFinanceYes: UILabel!{
        didSet{
            self.lblPreAprovedFinanceYes.text = "Yes"
            self.lblPreAprovedFinanceYes.textColor = .black
            self.lblPreAprovedFinanceYes.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var btnPreAprovedFinanceYes: UIButton!{
        didSet{
            self.btnPreAprovedFinanceYes.backgroundColor = .clear
        }
    }
    @IBOutlet var lblPreAprovedFinanceNo: UILabel!{
        didSet{
            self.lblPreAprovedFinanceNo.text = "No"
            self.lblPreAprovedFinanceNo.textColor = .black
            self.lblPreAprovedFinanceNo.font = .custom(style: .Regular, size: .s16)
        }
    }
    @IBOutlet var btnPreAprovedFinanceNo: UIButton!{
        didSet{
            self.btnPreAprovedFinanceNo.backgroundColor = .clear
        }
    }
    
    //MARK:- --------Local Variable------- -
    
    var paramPartners : [String : Any] = [:]
    var arrNewSuburbs = [PreferredSuburbs]()
    @IBOutlet weak var addPartnerViewHight: NSLayoutConstraint!
    @IBOutlet weak var viewContactDayTimeHight: NSLayoutConstraint!
    
    var getbuyerdata = GetBuyerProfileModel(dictionary: NSDictionary())
    var params: [String: Any] = [ : ]
    
    var numOfBathrooms = 0
    var numOfBedrooms = 0
    var numOfCar = 0
    var minPrice = 0.0
    var maxPrice = 0.0
    var txtviewCharCount = 0
    var txtViewStr = ""
    //    var arrSelectedSubrubs = [String]()
    //    var arrSelectedLatLong = [Subrubs]()
    var parmSelectedSubrbs : [String : String] = [:]
    var strpreAprovedFinance = "false"
    var boolPreAprovedFinance = false
    
    var profileImage = UIImage()
    var isSelectImagePicker = false
    var arrSetupData = NSMutableArray()
    var number = ""
    let imagePicker = UIImagePickerController()
    //Contact days
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
    var tempDate = Date()
    var endTime = Date()
    var isSelectSms = ""
    var isSelectCall = ""
    var isSelectEmail = ""
    var isSelected = false
    var FeltUnwellIsSelected = "No"
    var ConnectedWCovdPstvPplIsSelected = "No"
    var arrPartner = [Partner]()
    var dataPartnerArr = [Partners]()
    var arrSelectedTimeAndDays = [AvailabilityTime]()
    //    var arrSuburbsData = [PreferredSuburbs]()
    //    var arrPatrner = NSMutableArray()
    var indexPath = IndexPath()
    var isSelectClick = false
    var partners : [String : Any] = [:]
    var minP = ""
    var maxP = ""
    var noOfSelectedDateTime = 0
    //MARK:- .......life cycle.......
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.setupBuyerData()
        self.setupBuyerData()
        self.setup()
        self.lblSTDCode.isHidden = false
       
        print("view did load")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
                
        print("view will appear")
        self.txtMobile.delegate = self
//        self.setup()
//        self.setupBuyerData()
        self.editBuyerApi()
        //        self.addNavigationBackButton()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.viewContactDayTimeHight.constant = 50.0
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.addNavigationBackButton()
        self.viewContactDayTimeContiner.layoutIfNeeded()
        self.resetTime()
        self.istap = true
        self.isSelectClick = false
        isProfilePicSelected = false
        
        self.txtViewAboutMe.delegate = self
//        if self.txtViewAboutMe.textColor == UIColor.kPlaceholderColor(){
//            self.txtviewCharCount = 0
//            self.lbl_txtviewCout.text = "(\(self.txtviewCharCount)/250)"
//        }else{
//            self.txtviewCharCount = self.txtViewAboutMe.text.count
//            self.lbl_txtviewCout.text = "(\(self.txtviewCharCount)/250)"
//        }
        // default PreAprovedFinance is NO
        //        self.lblPreAprovedFinanceNo.textColor = .kBlueColor()
        //        self.lblPreAprovedFinanceYes.textColor = .black
        //        self.strpreAprovedFinance = "No"
        //        self.setData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imgView.layer.masksToBounds = false
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = imgView.frame.size.height / 2//ScreenSize.SCREEN_WIDTH*0.48/2
        imgView.clipsToBounds = true
        
//        if isSelectImagePicker == true{
//            let Url = getbuyerdata?.profilePic
//            self.imgView.sd_setImage(with: URL(fileURLWithPath: Url ?? ""))
//            self.imgView.makeImageCircla(self.profileImage)
//
//        }else
//        {
//            if getbuyerdata?.profilePic == ""
//            {
//                self.imgView.makeImageCircla(UIImage(named: "user")!)
//            }
//            else
//            {
//                let Url = getbuyerdata?.profilePic
//                self.imgView.sd_setImage(with: URL(fileURLWithPath: Url ?? ""))
//
//                let url = URL(string: Url!)
//                if let data = try? Data(contentsOf: url!)
//                {
//                    let image: UIImage = UIImage(data: data)!
//                    self.imgView.makeImageCircla(image)
//                }
//            }
//        }
        
    }
    
    func addNavigationBackButton(){
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(image: UIImage(named: ImageName.backButtom),style: .plain, target: self, action: #selector(backNavigationAction)), animated: true)
        self.navigationItem.leftBarButtonItem!.tintColor = .black
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    @objc func backNavigationAction(){
        self.navigationController?.popViewController(animated: true)
    }
    // MARK:- Support method😍😍😍😍😍😍😍😍
    
    func setupBuyerData(){
        self.txtFirstName.text = getbuyerdata?.firstName
        self.txtLastName.text = getbuyerdata?.lastName
        self.lblEmaiEditProfile.text = getbuyerdata?.email
        
//        self.txtMobile.text = getbuyerdata?.mobile
        
        let setMobile = getbuyerdata?.mobile
        let num = isRemoveFormatedText(strText: setMobile)
        self.txtMobile.text = (num.formateMobileNumber() )
        
        if let strMobile = currentUser.mobile, strMobile.count > 0{
                self.lblSTDCode.isHidden = false
                self.txtMobile.setLeftPaddingPoints(30)
                }
//                else
//                {
//                    self.lblSTDCode.isHidden = true
//                    self.txtMobile.removeLeftPaddingPoints()
//                }
        
        if getbuyerdata?.profilePic == ""
        {
            self.imgView.makeImageCircla(UIImage(named: "user")!)
        }
        else
        {
            let Url = getbuyerdata?.profilePic ?? ""
            
//            self.imgView.sd_setImage(with: URL(fileURLWithPath: Url ?? ""))
            self.imgView.sd_setImage(with: URL(string: Url), placeholderImage: UIImage(named: "user"))
            
//            let url = URL(string: Url!)
//            if let data = try? Data(contentsOf: url!)
//            {
//                let image: UIImage = UIImage(data: data)!
//                self.imgView.makeImageCircla(image)
//            }
        }
        
        if getbuyerdata?.hasSMS == "true"
        {
            self.btnSms.isSelected = true
            isSelectSms = "true"
            viewSmsContainer.backgroundColor = UIColor.kButtonSelectedColor()
            btnSms.setTitleColor(UIColor.kBlueColor(), for: .normal)
        }
        else
        {
            self.btnSms.isSelected = false
            isSelectSms = "false"
            viewSmsContainer.backgroundColor = .white
            btnSms.setTitleColor(UIColor.kInstructionColor(), for: .normal)
            
        }
        if getbuyerdata?.hasCall == "true"
        {
            btnCall.isSelected = true
            isSelectCall = "true"
            viewCallConainer.backgroundColor = UIColor.kButtonSelectedColor()
            btnCall.setTitleColor(UIColor.kBlueColor(), for: .normal)
        }
        else
        {
            btnCall.isSelected = false
            isSelectCall = "false"
            viewCallConainer.backgroundColor = .white
            btnCall.setTitleColor(UIColor.kInstructionColor(), for: .normal)
        }
        if getbuyerdata?.hasEmail == "true"
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
        
        self.txtViewAboutMe.text = getbuyerdata?.aboutMe
        self.txtViewStr = self.txtViewAboutMe.text
        if getbuyerdata?.aboutMe != ""
               {
                 self.txtViewAboutMe.text = getbuyerdata?.aboutMe
            self.txtviewCharCount = self.txtViewAboutMe.text.count
            self.lbl_txtviewCout.text = "(\(self.txtviewCharCount)/250)"
               }
               else
               {
                 self.txtViewAboutMe.text = "Tell us about your situation"
                 self.txtViewAboutMe.textColor = .kTextViewPlaceholderColor()
                self.txtviewCharCount = 0
                self.lbl_txtviewCout.text = "(\(self.txtviewCharCount)/250)"
               }
        
//        if self.txtViewAboutMe.textColor == UIColor.kPlaceholderColor(){
//            self.txtviewCharCount = 0
//            self.lbl_txtviewCout.text = "(\(self.txtviewCharCount)/250)"
//        }else{
//            self.txtviewCharCount = self.txtViewAboutMe.text.count
//            self.lbl_txtviewCout.text = "(\(self.txtviewCharCount)/250)"
//        }
        
        if getbuyerdata?.preApprovedFinance == "true"
        {
            self.lblPreAprovedFinanceNo.textColor = .black
            self.lblPreAprovedFinanceYes.textColor = .kBlueColor()
            self.strpreAprovedFinance = "true"
            self.boolPreAprovedFinance = true
        }
        else if getbuyerdata?.preApprovedFinance == "false"
        {
            self.lblPreAprovedFinanceNo.textColor = .kBlueColor()
            self.lblPreAprovedFinanceYes.textColor = .black
            self.strpreAprovedFinance = "false"
            self.boolPreAprovedFinance = false
        }
        
        self.lblNumberOfCar.text = "\(String(describing: getbuyerdata?.cars ?? 0))"
        self.numOfCar = getbuyerdata?.cars ?? 0
        self.lblNumberOfBathroom.text = "\(String(describing: getbuyerdata?.bathrooms ?? 0))"
        self.numOfBathrooms = getbuyerdata?.bathrooms ?? 0
        self.lblNumberOfbedroom.text = "\(String(describing: getbuyerdata?.bedrooms ?? 0))"
        self.numOfBedrooms = getbuyerdata?.bedrooms ?? 0
        
        let number1 = Int(getbuyerdata?.minPrice ?? "0") ?? 0
        print(number1.delimiter) // 31,908,551,587

        let number2 = Int(getbuyerdata?.maxPrice ?? "0") ?? 0
        print(number2.delimiter)
        
        self.txtMinPrize.text = number1.delimiter //getbuyerdata?.minPrice
        self.txtMaxPrize.text = number2.delimiter //getbuyerdata?.maxPrice
        
        if getbuyerdata?.answer1 == "Yes"
        {
            btn_FeltUnwellYes.isSelected = true
            self.FeltUnwellIsSelected = "Yes"
            self.btn_FeltUnwellNo.isSelected = false
        }
        else
        {
            btn_FeltUnwellNo.isSelected = true
            self.FeltUnwellIsSelected = "No"
            self.btn_FeltUnwellYes.isSelected = false
        }
        
        if getbuyerdata?.answer2 == "Yes"
        {
            btn_ConnectedWCovdPstvPplYes.isSelected = true
            self.ConnectedWCovdPstvPplIsSelected = "No"
            self.btn_ConnectedWCovdPstvPplNo.isSelected = false
        }
        else
        {
            btn_ConnectedWCovdPstvPplNo.isSelected = true
            self.ConnectedWCovdPstvPplIsSelected = "No"
            self.btn_ConnectedWCovdPstvPplYes.isSelected = false
        }
        
        dataPartnerArr = getbuyerdata?.partners as? [Partners] ?? [Partners]()
        var tempArr = [partners]
        tempArr.removeAll()
        for i in  0..<self.dataPartnerArr.count{
            self.partners = [
                "firstName" : self.dataPartnerArr[i].firstName ?? "",
                "lastName" : self.dataPartnerArr[i].lastName ?? "",
                "email"  :  self.dataPartnerArr[i].email ?? "",
                "phone" :  self.dataPartnerArr[i].phone ?? ""
            ]
//            tempArr.append(self.partners)
//            self.params["partners"] = tempArr
            
//            print("params = \(self.params)")
        }
        self.addPartnerListDynamicWidth()
        self.arrNewSuburbs = getbuyerdata?.preferredSuburbs! as! [PreferredSuburbs]
        var arrTemp = [parmSelectedSubrbs]
        arrTemp.removeAll()
        for i in 0..<self.arrNewSuburbs.count{
            if  self.txtFieldSubrubs.text?.trimWhiteSpaceAndNewLine == ""
            {
                self.txtFieldSubrubs.text = arrNewSuburbs[i].address
                self.parmSelectedSubrbs["address"] = self.arrNewSuburbs[i].address
                self.parmSelectedSubrbs["lattitude"] = "\(self.arrNewSuburbs[i].lattitude ?? 0.0)"
                self.parmSelectedSubrbs["longitude"] = "\(self.arrNewSuburbs[i].longitude ?? 0.0)"
                arrTemp.append(self.parmSelectedSubrbs)
                params["preferredSuburbs"] = arrTemp
            }
            else
            {
                self.txtFieldSubrubs.text = txtFieldSubrubs.text! + " | " + arrNewSuburbs[i].address!
                self.parmSelectedSubrbs["address"] = self.arrNewSuburbs[i].address
                self.parmSelectedSubrbs["lattitude"] = "\(self.arrNewSuburbs[i].lattitude ?? 0.0)"
                self.parmSelectedSubrbs["longitude"] = "\(self.arrNewSuburbs[i].longitude ?? 0.0)"
                arrTemp.append(self.parmSelectedSubrbs)
                params["preferredSuburbs"] = arrTemp
            }
        }
        arrSelectedTimeAndDays = getbuyerdata?.availabilityTime as! [AvailabilityTime]
        self.noOfSelectedDateTime = arrSelectedTimeAndDays.count
    //    print("arrSelectedTimeAndDays= \(arrSelectedTimeAndDays)\n No Of SelecteTimeAndDays = \(arrSelectedTimeAndDays.count)")
        if arrSelectedTimeAndDays.count>0
        {
            self.btnBestContactDays.setTitleColor(.kBlueColor(), for: .normal)
            self.viewContactDayTimeContiner.backgroundColor = UIColor.kButtonSelectedColor()
        }
        
        for i in arrSelectedTimeAndDays
        {
            if i.day == "Mon"
            {
                self.arrWeekStatus[0]?.isSelect = true
                self.arrWeekStatus[0]?.startDate = i.startTime!
                self.arrWeekStatus[0]?.endDate = i.endTime!
                //                self.arrSelectedTimeAndDays[0].
                
                var arrtemp = [arrSelectedWeeks]
                arrtemp.removeAll()
                for i in  0..<self.arrSelectedTimeAndDays.count{
                    self.arrSelectedWeeks = [
                        // Change 0 to i
                        "day" : arrSelectedTimeAndDays[i].day ?? "",
                        "startTime" : arrSelectedTimeAndDays[i].startTime ?? "",
                        "endTime" : arrSelectedTimeAndDays[i].endTime ?? ""
                    ]
                    arrtemp.append(self.arrSelectedWeeks)
                    self.params["availabilityTime"] = arrtemp
                    //                    print("params = \(self.params)")
                }
            }
            else
            if i.day == "Tue"
            {
                self.arrWeekStatus[1]?.isSelect = true
                self.arrWeekStatus[1]?.startDate = i.startTime!
                self.arrWeekStatus[1]?.endDate = i.endTime!
                
                var arrtemp = [arrSelectedWeeks]
                arrtemp.removeAll()
                for i in  0..<self.arrSelectedTimeAndDays.count{
                    self.arrSelectedWeeks = [
                        "day" : arrSelectedTimeAndDays[i].day ?? "",
                        "startTime" : arrSelectedTimeAndDays[i].startTime ?? "",
                        "endTime" : arrSelectedTimeAndDays[i].endTime ?? ""
                    ]
                    arrtemp.append(self.arrSelectedWeeks)
                    self.params["availabilityTime"] = arrtemp
                    //                        print("params = \(self.params)")
                }
            }
            else
            if i.day == "Wed"
            {
                self.arrWeekStatus[2]?.isSelect = true
                self.arrWeekStatus[2]?.startDate = i.startTime!
                self.arrWeekStatus[2]?.endDate = i.endTime!
                
                var arrtemp = [arrSelectedWeeks]
                arrtemp.removeAll()
                for i in  0..<self.arrSelectedTimeAndDays.count{
                    self.arrSelectedWeeks = [
                        "day" : arrSelectedTimeAndDays[i].day ?? "",
                        "startTime" : arrSelectedTimeAndDays[i].startTime ?? "",
                        "endTime" : arrSelectedTimeAndDays[i].endTime ?? ""
                    ]
                    arrtemp.append(self.arrSelectedWeeks)
                    self.params["availabilityTime"] = arrtemp
                    //                            print("params = \(self.params)")
                }
            }
            else
            if i.day == "Thu"
            {
                self.arrWeekStatus[3]?.isSelect = true
                self.arrWeekStatus[3]?.startDate = i.startTime!
                self.arrWeekStatus[3]?.endDate = i.endTime!
                
                var arrtemp = [arrSelectedWeeks]
                arrtemp.removeAll()
                for i in  0..<self.arrSelectedTimeAndDays.count{
                    self.arrSelectedWeeks = [
                        "day" : arrSelectedTimeAndDays[i].day ?? "",
                        "startTime" : arrSelectedTimeAndDays[i].startTime ?? "",
                        "endTime" : arrSelectedTimeAndDays[i].endTime ?? ""
                    ]
                    arrtemp.append(self.arrSelectedWeeks)
                    self.params["availabilityTime"] = arrtemp
                    //                                print("params = \(self.params)")
                }
            }
            else
            if i.day == "Fri"
            {
                self.arrWeekStatus[4]?.isSelect = true
                self.arrWeekStatus[4]?.startDate = i.startTime!
                self.arrWeekStatus[4]?.endDate = i.endTime!
                
                var arrtemp = [arrSelectedWeeks]
                arrtemp.removeAll()
                for i in  0..<self.arrSelectedTimeAndDays.count{
                    self.arrSelectedWeeks = [
                        "day" : arrSelectedTimeAndDays[i].day ?? "",
                        "startTime" : arrSelectedTimeAndDays[i].startTime ?? "",
                        "endTime" : arrSelectedTimeAndDays[i].endTime ?? ""
                    ]
                    arrtemp.append(self.arrSelectedWeeks)
                    self.params["availabilityTime"] = arrtemp
                    //                                    print("params = \(self.params)")
                }
            }
            else
            if i.day == "Sat"
            {
                self.arrWeekStatus[5]?.isSelect = true
                self.arrWeekStatus[5]?.startDate = i.startTime!
                self.arrWeekStatus[5]?.endDate = i.endTime!
                
                var arrtemp = [arrSelectedWeeks]
                arrtemp.removeAll()
                for i in  0..<self.arrSelectedTimeAndDays.count{
                    self.arrSelectedWeeks = [
                        "day" : arrSelectedTimeAndDays[i].day ?? "",
                        "startTime" : arrSelectedTimeAndDays[i].startTime ?? "",
                        "endTime" : arrSelectedTimeAndDays[i].endTime ?? ""
                    ]
                    arrtemp.append(self.arrSelectedWeeks)
                    self.params["availabilityTime"] = arrtemp
                    //                                        print("params = \(self.params)")
                }
            }
            else
            if i.day == "Sun"
            {
                self.arrWeekStatus[6]?.isSelect = true
                self.arrWeekStatus[6]?.startDate = i.startTime!
                self.arrWeekStatus[6]?.endDate = i.endTime!
                
                var arrtemp = [arrSelectedWeeks]
                arrtemp.removeAll()
                for i in  0..<self.arrSelectedTimeAndDays.count{
                    self.arrSelectedWeeks = [
                        "day" : arrSelectedTimeAndDays[i].day ?? "",
                        "startTime" : arrSelectedTimeAndDays[i].startTime ?? "",
                        "endTime" : arrSelectedTimeAndDays[i].endTime ?? ""
                    ]
                    arrtemp.append(self.arrSelectedWeeks)
                    self.params["availabilityTime"] = arrtemp
                }
            }
        }
        
        DispatchQueue.main.async(execute: {
            APIManager.hideLoader()
        })
    }
    
    func addPartnerListDynamicWidth()
    {
        print(dataPartnerArr.count)
        let mainhight = dataPartnerArr.count * 101
        print(mainhight)
        self.addPartnerViewHight.constant = CGFloat(mainhight)
        
    }
    
    func toggleColorButtonEdite(Container: UIView,sender: UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected == false
        {
            if sender == self.btnSms{
                self.isSelectSms = "false"
            }else if sender == self.btnCall{
                self.isSelectCall = "false"
            }else if sender == self.btnEmail{
                self.isSelectEmail = "false"
            }
            Container.backgroundColor = .white
            sender.setTitleColor(UIColor.kInstructionColor(), for: .normal)
            sender.titleLabel?.font = .custom(style: .Regular, size: .s16)
        }else{
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
    }
    
    // MARK:- Action
    
    @IBAction func btnClickAddProfielPic(_ sender: UIButton) {
        // call Alert custom method
        self.showAlert()
        
    }
    func validatePersonalInfo(){
        
        number = isRemoveFormatedText(strText: self.txtMobile.text)
        
        guard self.txtFirstName.text! != "" else {
            return self.showAlertMessage(messageStr: Validation.FirstName) { (action) in
                self.txtFirstName.becomeFirstResponder()
            }
        }
        
        guard self.txtFirstName.text!.isValidName() == true else {
            return self.showAlertMessage(messageStr: Validation.FirstNameNumeric) { (action) in
                self.txtFirstName.becomeFirstResponder()
            }
        }
        guard self.txtFirstName.text!.trimmingCharacters(in: .whitespaces).count >= 3 else {
            return self.showAlertMessage(messageStr: "First name should have at least 3 characters") { (action) in
                self.txtFirstName.becomeFirstResponder()
            }
        }
        guard self.txtFirstName.text!.isValidSpaceName() == true else {
            return self.showAlertMessage(messageStr: Validation.FirstNameSpace) { (action) in
                self.txtFirstName.becomeFirstResponder()
            }
        }
        guard self.txtLastName.text! != "" else {
            return self.showAlertMessage(messageStr: Validation.LastName) { (action) in
                self.txtLastName.becomeFirstResponder()
            }
        }
        guard self.txtLastName.text!.isValidName() == true else  {
            return self.showAlertMessage(messageStr: Validation.LastNameNumeric) { (action) in
                self.txtLastName.becomeFirstResponder()
            }
        }
        guard self.txtLastName.text!.trimmingCharacters(in: .whitespaces).count >= 3 else {
            return self.showAlertMessage(messageStr: "Last name should have at least 3 characters") { (action) in
                self.txtLastName.becomeFirstResponder()
            }
        }
        guard self.txtLastName.text!.isValidSpaceName() == true else  {
           return self.showAlertMessage(messageStr: Validation.LastNameSpace) { (action) in
                self.txtLastName.becomeFirstResponder()
            }
        }
        
        guard self.txtMobile.text! != "" else {
            return self.showAlertMessage(messageStr: Validation.phoneNumber) { (action) in
                self.txtMobile.becomeFirstResponder()
            }
        }
        guard self.number.count >= 10 else {
            return self.showAlertMessage(messageStr: Validation.phoneNumberLength) { (action) in
                self.txtMobile.becomeFirstResponder()
            }
        }
        guard self.number.isValidPhone() == true else {
            return self.showAlertMessage(messageStr: "Please Enter valid Phone Number") { (action) in
                self.txtMobile.becomeFirstResponder()
            }
        }//"+\(61 ) \(number.formateMobileNumber())"
    //    print("Max Prise = \(txtMaxPrize)\n Min Prise = \(txtMinPrize)")
        
        self.minP = txtMinPrize.text!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        self.maxP = txtMaxPrize.text!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
     //   print("Max Prise = \(maxP)\n Min Prise = \(minP)")
        if self.txtMinPrize.text?.count == 0 || self.txtMaxPrize.text?.count == 0{
            self.txtMinPrize.text = "0"
            self.txtMaxPrize.text = "1,000,000"
        }
        guard Double(self.txtMinPrize.text ?? "0") ?? 0 >= 0 else {
           return self.showAlertMessage(messageStr: "Please Enter Positive value") { (action) in
            self.txtMinPrize.becomeFirstResponder()
            }
        }
//        print("Max Prise = \(txtMaxPrize)\n Min Prise = \(txtMinPrize)")
        guard Double(minP) ?? 0 < Double(maxP) ?? 1000000 else {
            return self.showAlertMessage(messageStr: "Maximum price should be greater than minimum price.") { (action) in
                print("Please Enter More then Min Price")
                self.txtMaxPrize.becomeFirstResponder()
            }
            
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
//            return
//        }
        let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        self.isSelectImagePicker = true
        self.profileImage = pickedImage ?? UIImage()
        
        print("self.profileImage img picker => \(self.profileImage)")
        isProfilePicSelected = true
        self.imgView.image = pickedImage
        dismiss(animated: true, completion: nil)
        
    }
    
    
    // MARK:- Custom funcion
    
//    func setData(){
//
//
//    }
    func showAlert(){
        // Add AlertView Controller
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Photo library", style: .default, handler: { (button) in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            self.imagePicker.modalPresentationStyle = .overCurrentContext
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (button) in
            if (UIImagePickerController.availableMediaTypes(for: UIImagePickerController.SourceType.camera) != nil) {
                self.imagePicker.sourceType = .camera
                self.imagePicker.allowsEditing = true
                self.imagePicker.modalPresentationStyle = .overCurrentContext
                self.present(self.imagePicker, animated: true, completion: nil)
                
            }else{
                self.noCamera()
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func openCameraApp() {
        if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
            imagePicker.allowsEditing = true
            self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
            self.imagePicker.cameraCaptureMode = .photo
            self.imagePicker.modalPresentationStyle = .fullScreen
            present(imagePicker,
                    animated: true,
                    completion: nil)
        } else {
            self.noCamera()
        }
    }
    func noCamera(){
        let alertVC = UIAlertController(
            title: "RealPass",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    
    // MARK: Photos Albums
    
    func showImagePicker() {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        //        picker.modalPresentationStyle = .Popover
        present(imagePicker,
                animated: true,
                completion: nil)
        imagePicker.popoverPresentationController?.sourceView = self.view
    }
    
    
    //    func textFieldDidBeginEditing(_ textField: UITextField) {
    //    //        self.txtMobile.text = "+61 " + self.txtMobile.text!
    //
    //            if self.txtMobile.text?.count == 0
    //            {
    //               self.txtMobile.text = "+61 "
    //            }
    //        }
    
    //        func textFieldDidEndEditing(_ textField: UITextField) {
    //            if self.txtMobile.text == "+61 "
    //            {
    //                self.txtMobile.text = ""
    //            }
    //        }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if(txtMobile.isEditing) {
            if string.count != 0 {
                if (textField.text?.count ?? 0) <= 21 {
                    if (textField.text?.count ?? 0) == 4 {
                        let tempStr = "\(textField.text ?? "") "
                        textField.text = tempStr
                    } else if (textField.text?.count ?? 0) == 8 {
                        let tempStr = "\(textField.text ?? "") "
                        textField.text = tempStr
                    }
                    else if (textField.text?.count ?? 0) == 12 {
                        let tempStr = "\(textField.text ?? "") "
                        textField.text = tempStr
                    }
                } else {
                    return false
                }
            }
                let newLength = textField.text!.count + (string.count - range.length)
                            if newLength > 0 {
                                self.txtMobile.setLeftPaddingPoints(30)
                                self.lblSTDCode.isHidden = false
                            }
                            else{
                                self.txtMobile.removeLeftPaddingPoints()
                                self.lblSTDCode.isHidden = true
                            }
                
//                let currentText = textField.text ?? ""
//                guard let stringRange = Range(range, in: currentText) else { return false }
//                let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
//                return updatedText.count <= 12
            
//            if self.txtMobile.text == "+61 " && string.count == 0 {
//                return false
//            }
        }else{
            if textField == txtMinPrize || textField == txtMaxPrize{
                print(textField.text?.count)
                print(textField.text)
                let formatter = NumberFormatter()
                    formatter.numberStyle = .decimal
                    formatter.locale = Locale.current
                    formatter.maximumFractionDigits = 0
                let newLength = textField.text!.count + (string.count - range.length)
                if newLength <= 9{
                   if let groupingSeparator = formatter.groupingSeparator {
//                    return textField.text!.count + (string.count - range.length) <= 9

                       if string == groupingSeparator {
                           return true
                       }


                       if let textWithoutGroupingSeparator = textField.text?.replacingOccurrences(of: groupingSeparator, with: "") {
                           var totalTextWithoutGroupingSeparators = textWithoutGroupingSeparator + string
                           if string.isEmpty { // pressed Backspace key
                               totalTextWithoutGroupingSeparators.removeLast()
                           }
                           if let numberWithoutGroupingSeparator = formatter.number(from: totalTextWithoutGroupingSeparators),
                               let formattedText = formatter.string(from: numberWithoutGroupingSeparator) {

                               textField.text = formattedText
                               return false
                           }
                       }
                    
                   }
                    return ((textField.text!.count + (string.count - range.length)) <= 9)
                }else{
                    return false
                }
                
            }
        }
        return true
    }
   
  
    
    
    func setup(){
        self.navigationController?.isNavigationBarHidden = false
        self.title = "EDIT PROFILE"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.custom(style: .Regular, size: .s17)]
        transparentNav(nav: (self.navigationController!))
        self.view.backgroundColor = UIColor.kAppThemeColor()
        self.imagePicker.delegate = self
        self.imagePicker.allowsEditing = true
        self.collectionViewDays.delegate = self
        self.collectionViewDays.dataSource = self
        self.collectionViewDays.register(UINib(nibName: "DayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DayCollectionViewCell")
        self.collectionViewDays.allowsMultipleSelection = true
        
        // Configure Date picker
        self.configureDatePicker()
     //   print("Start Time \(self.startTime)")
     //   print("End Time \(self.endTime)")
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
     //       print("Start Time = \(txtStartDate.text!)")
            self.arrWeekStatus[self.index]?.startDate =  txtStartDate.text!
        //    print("Dictionary Start Time = \( String(describing: self.arrWeekStatus[self.index]?.startDate))")
//            self.datePicker.minimumDate = date
            txtStartDate.resignFirstResponder()
        }else{
            dateFormater.dateFormat = "HH:mm"
            date = datePicker.date
            txtEndTime.text = dateFormater.string(from: datePicker.date)
      //      print("End Time = \(String(describing: txtEndTime.text))")
            self.arrWeekStatus[self.index]?.endDate =  txtEndTime.text!
        //    print("Dictionary End Time = \( String(describing: self.arrWeekStatus[self.index]?.endDate))")
            txtEndTime.resignFirstResponder()
        }
    }
    
    @objc func datePickerCancel(){
        
        self.view.endEditing(true)
    }
    
    //MARK:- --------TextField Delegate methods------- -
    func textFieldDidBeginEditing(_ textField: UITextField) {
   //     print("Start Editing")
//        if textField == self.txtMobile{
//            if self.txtMobile.text?.count == 0{
//                self.txtMobile.text = "+61 "
//            }
//        }
        if textField == self.txtMinPrize{
            if self.txtMinPrize.text?.count == 0{
                self.txtMinPrize.text = "0"
            }
        }else if textField == self.txtMaxPrize{
            if self.txtMaxPrize.text?.count == 0{
                self.txtMaxPrize.text = "100,000"
            }
        }
        else if textField == self.txtStartDate{
            self.txtStartDate.becomeFirstResponder()
            let tempDate = self.dateFormater.date(from: self.arrWeekStatus[index]!.startDate)
            print("tempDate = \(tempDate)")
            self.startTime = dateFormater.date(from: "4 : 00")!
            self.datePicker.minimumDate = self.startTime
            datePicker.date = tempDate!
         
        }else if textField == self.txtEndTime{
            self.txtEndTime.becomeFirstResponder()
            let tempDate = self.dateFormater.date(from: self.arrWeekStatus[index]!.endDate)
            self.datePicker.minimumDate =  self.startTime + 1 * 60 * 60
            datePicker.date = tempDate!
            print("minTime = \(self.datePicker.minimumDate)")
            //print("temp = \(tempDate) ")
          //  print("temp = \(self.datePicker.minimumDate ) ")
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    //    print("End Editing")
        
//        if textField == self.txtMobile
//        {
//            if self.txtMobile.text == "+61 "
//            {
//                self.txtMobile.text = ""
//            }
//        }
        if textField == self.txtMinPrize{
            if self.txtMinPrize.text?.count == 0{
                self.txtMinPrize.text = "0"
            }
        }
        else if textField == self.txtStartDate{
            self.startTime = self.dateFormater.date(from: self.arrWeekStatus[index]!.startDate)!
            self.arrWeekStatus[index]?.startDate = textField.text!
            print("TempFinal = \( self.startTime + 1 * 60 * 60)")
            
        }else if textField == self.txtEndTime{
            self.arrWeekStatus[index]?.endDate = textField.text!
            
        }
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
     //   print("idDaSelect = \(idDaySelect)")
        if textField == txtStartDate || textField == txtEndTime{
            if self.idDaySelect == 999{
                return false
            }else{
                return true
            }
        }else{
            return true
        }

    }

   
    //MARK:- --------Custom methods------- -
    func viewClickExpand(){
        self.imgViewDropdown.image = UIImage(named: ImageName.upperArrow)
        self.viewContactDayTimeHight.constant = 310.0
        self.viewContactDayTimeContiner.layer.borderWidth = 1.0
        self.viewContactDayTimeContiner.layer.borderColor = UIColor.kBorderColor().cgColor
        self.viewContactDayTimeContiner.layoutIfNeeded()
        self.istap = false
    }
    func viewClickCollaps(){
        self.imgViewDropdown.image = UIImage(named: ImageName.downArrow)
        self.viewContactDayTimeHight.constant = 50.0
        self.viewContactDayTimeContiner.layer.borderWidth = 0.0
        self.viewContactDayTimeContiner.layoutIfNeeded()
        self.viewContactDayTimeContiner.backgroundColor = .white
        
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
    
    
    //MARK:- --------ButonClick Action------- -
    
    @IBAction func btnUpdateClicked(_ sender: UIButton) {

//        self.validatePersonalInfo()
        number = isRemoveFormatedText(strText: self.txtMobile.text)
        
        guard self.txtFirstName.text! != "" else {
            return self.showAlertMessage(messageStr: Validation.FirstName) { (action) in
                self.txtFirstName.becomeFirstResponder()
            }
        }
        
        guard self.txtFirstName.text!.isValidName() == true else {
            return self.showAlertMessage(messageStr: Validation.FirstNameNumeric) { (action) in
                self.txtFirstName.becomeFirstResponder()
            }
        }
        guard self.txtFirstName.text!.trimmingCharacters(in: .whitespaces).count >= 3 else {
            return self.showAlertMessage(messageStr: "First name should have at least 3 characters") { (action) in
                self.txtFirstName.becomeFirstResponder()
            }
        }
        guard self.txtFirstName.text!.isValidSpaceName() == true else {
            return self.showAlertMessage(messageStr: Validation.FirstNameSpace) { (action) in
                self.txtFirstName.becomeFirstResponder()
            }
        }
        guard self.txtLastName.text! != "" else {
            return self.showAlertMessage(messageStr: Validation.LastName) { (action) in
                self.txtLastName.becomeFirstResponder()
            }
        }
        guard self.txtLastName.text!.isValidName() == true else  {
            return self.showAlertMessage(messageStr: Validation.LastNameNumeric) { (action) in
                self.txtLastName.becomeFirstResponder()
            }
        }
        guard self.txtLastName.text!.trimmingCharacters(in: .whitespaces).count >= 3 else {
            return self.showAlertMessage(messageStr: "Last name should have at least 3 characters") { (action) in
                self.txtLastName.becomeFirstResponder()
            }
        }
        guard self.txtLastName.text!.isValidSpaceName() == true else  {
           return self.showAlertMessage(messageStr: Validation.LastNameSpace) { (action) in
                self.txtLastName.becomeFirstResponder()
            }
        }
        
        guard self.txtMobile.text! != "" else {
            return self.showAlertMessage(messageStr: Validation.phoneNumber) { (action) in
                self.txtMobile.becomeFirstResponder()
            }
        }
        guard self.number.count >= 10 else {
            return self.showAlertMessage(messageStr: Validation.phoneNumberLength) { (action) in
                self.txtMobile.becomeFirstResponder()
            }
        }
        guard self.number.isValidPhone() == true else {
            return self.showAlertMessage(messageStr: "Please Enter valid Phone Number") { (action) in
                self.txtMobile.becomeFirstResponder()
            }
        }//"+\(61 ) \(number.formateMobileNumber())"
    //    print("Max Prise = \(txtMaxPrize)\n Min Prise = \(txtMinPrize)")
        
        self.minP = txtMinPrize.text!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        self.maxP = txtMaxPrize.text!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
     //   print("Max Prise = \(maxP)\n Min Prise = \(minP)")
        if self.txtMinPrize.text?.count == 0 || self.txtMaxPrize.text?.count == 0{
            self.txtMinPrize.text = "0"
            self.txtMaxPrize.text = "1,000,000"
        }
        guard Double(self.txtMinPrize.text ?? "0") ?? 0 >= 0 else {
           return self.showAlertMessage(messageStr: "Please Enter Positive value") { (action) in
            self.txtMinPrize.becomeFirstResponder()
            }
        }
//        print("Max Prise = \(txtMaxPrize)\n Min Prise = \(txtMinPrize)")
        guard Double(minP) ?? 0 < Double(maxP) ?? 1000000 else {
            return self.showAlertMessage(messageStr: "Maximum price should be greater than minimum price.") { (action) in
                print("Please Enter More then Min Price")
                self.txtMaxPrize.becomeFirstResponder()
            }
            
        }
        
        self.callEditBuyerProfileApi()
    }
    
    
    @IBAction func btnClickSms(_ sender: UIButton) {
        self.toggleColorButtonEdite(Container: self.viewSmsContainer, sender: self.btnSms)
    }
    
    @IBAction func btnClickCall(_ sender: Any) {
        self.toggleColorButtonEdite(Container: self.viewCallConainer, sender: self.btnCall)
    }
    
    @IBAction func btnClickEmail(_ sender: Any) {
        self.toggleColorButtonEdite(Container: self.viewEmailContainer, sender: self.btnEmail)
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
      //  print("Button Cancel has been clicked")
        
        for i in 0..<arrWeekStatus.count{
//            self.arrSelectedWeeks.removeAll()
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
            self.arrSelectedWeeks.removeAll()
            self.arrSelectedTimeAndDays.removeAll()
            
        }
//        self.viewClickCollaps()
        self.viewContactDayTimeContiner.backgroundColor = .white
        self.btnBestContactDays.setTitleColor(.kInstructionColor(), for: .normal)
        params["availabilityTime"] = [:]
    }
    func reset(){
        for i in 0..<arrWeekStatus.count{
        arrWeekStatus[i]?.isSelect = false
//        arrWeekStatus[i]?.isBorder = false
//        arrWeekStatus[i]?.startDate = "10:00"
//        arrWeekStatus[i]?.endDate = "19:00"
        }
    }
    
    @IBAction func btnClickSave(_ sender: Any) {
    //    print("Button save has been Clicked")
        var tempArr = [arrSelectedWeeks]
        tempArr.removeAll()
        let arrTempWeeks = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
        for i in  0..<arrWeekStatus.count{
            if arrWeekStatus[i]?.isSelect == true{
                    self.arrSelectedWeeks = [
                        "day" : arrTempWeeks[i]  as Any,
                        "startTime" : arrWeekStatus[i]!.startDate as Any,
                        "endTime" : arrWeekStatus[i]!.endDate as Any
                    ]
                    tempArr.append(self.arrSelectedWeeks)
                    params["availabilityTime"] = tempArr
    
//                print("TempArr = \(tempArr)")
                
            }
        }
        self.viewClickCollaps()
        self.viewContactDayTimeContiner.backgroundColor = .kButtonSelectedColor()
        self.btnBestContactDays.setTitleColor(.kBlueColor(), for: .normal)
    //    print("reqParameter = \(reqParameter)")
//        print(arrWeekStatus)
    }
    
    
    //MARK:- --------Collection View Datasource and Delegate methods------- -
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrWeekStatus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCollectionViewCell", for: indexPath) as! DayCollectionViewCell
        
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
//            print("txtStartDate = \(self.txtStartDate.text)")
    //        print(dateFormater.dateFormat)
            if let temp = self.txtStartDate.text{
                self.startTime = dateFormater.date(from: temp)!
            }
            self.txtEndTime.text = self.arrWeekStatus[indexPath.row]?.endDate
            self.endTime = dateFormater.date(from: self.txtStartDate.text!)!
            
        }
        else{
            if ((arrWeekStatus[indexPath.row]?.isSelect) == true){
                if self.noOfSelectedDateTime != 0{
                    self.idDaySelect = 999
                    self.noOfSelectedDateTime = self.noOfSelectedDateTime - 1
//                    arrWeekStatus[indexPath.row]?.isSelect = false
                }
//                else{
//                    self.idDaySelect = indexPath.row
//                }
                
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
    // Covid Question Outlets
    
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
    // partners Methods
    func addArr(partner: Partner,isSelect: Bool) {
        
        if isSelect == true{
            //            arrPartner[indexPath.row].fName = partner.fName
            //            arrPartner[indexPath.row].lName = partner.lName
            //            arrPartner[indexPath.row].mobile = partner.mobile
            //            arrPartner[indexPath.row].email = partner.email
            
            // ADD INTO DICTIONARY
            //            self.partners["firstName"] = arrPartner[indexPath.row].fName = partner.fName
            //            self.partners["lastName"] = arrPartner[indexPath.row].fName = partner.lName
            //            self.partners["email"] = arrPartner[indexPath.row].fName = partner.mobile
            //            self.partners["phone"] = arrPartner[indexPath.row].fName = partner.email
            
       //     print("reqParameter = \(reqParameter)")
            
        }else{
            // ADD INTO DICTIONARY
            self.arrPartner.append(partner)
            
            //            self.dataPartnerArr.append(<#T##newElement: Partners##Partners#>)
            
            
            
            //            self.partners["firstName"] = arrPartner[indexPath.row].fName = partner.fName
            //            self.partners["lastName"] = arrPartner[indexPath.row].fName = partner.lName
            //            self.partners["email"] = arrPartner[indexPath.row].fName = partner.mobile
            //            self.partners["phone"] = arrPartner[indexPath.row].fName = partner.email
        }
//        print("Partner from Partner Screen \(arrPartner)")
     //   print("reqParameter = \(reqParameter)")
        self.tblVewPartnerList.reloadData()
    }
    
    
    
    // MARK:- ButtonClick Action
    @IBAction func btnClickAddPartner(_ sender: UIButton) {
    //    print("Add Partner butten clicked")
        let popUpObj = self.storyboard?.instantiateViewController(withIdentifier: "AddPartnerPopUpVC") as! AddPartnerPopUpVC
        popUpObj.modalPresentationStyle = .overCurrentContext
        self.definesPresentationContext = true
        //        popUpObj.delegate = self
        popUpObj.isFromEditVC = true
        var tempArr = [partners]
        tempArr.removeAll()
        popUpObj.dismisPartnerPopup = { (partners) in
            DispatchQueue.main.async {
                
                self.tabBarController?.tabBar.isHidden = false
                self.dataPartnerArr.append(partners)
                
                for i in  0..<self.dataPartnerArr.count{
                    
                    self.partners = [
                        "firstName" : self.dataPartnerArr[i].firstName ?? "",
                        "lastName" : self.dataPartnerArr[i].lastName ?? "",
                        "email"  :  self.dataPartnerArr[i].email ?? "",
                        "phone" :  self.dataPartnerArr[i].phone ?? ""
                    ]
//                    tempArr.append(self.partners)
//                    self.params["partners"] = tempArr
                    
//                    print("params = \(self.params)")
                }
                //                for i in  0..<self.dataPartnerArr.count{
                //
                //                    params["aa"] = dataPartnerArr[i].
                //                        self.partners = [
                //                            "firstName" : arrPartner[i].fName as Any,
                //                            "lastName" : arrPartner[i].lName as Any,
                //                            "email"  :  arrPartner[i].email as Any,
                //                            "phone" :  arrPartner[i].mobile as Any
                //                                                ]
                //                        tempArr.append(self.partners)
                //                        reqParameter["partners"] = tempArr
                //
                //                    print("TempArr = \(tempArr)")
                //                }
                
                
                self.tblVewPartnerList.reloadData()
                self.addPartnerListDynamicWidth()
            }
        }
        self.present(popUpObj, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count1 = 0
        
        if dataPartnerArr.count == 0
        {
            tableView.isHidden = true
            self.addPartnerViewHight.constant = 40.00
            self.lblNoPartner.isHidden = false
        }
        else if dataPartnerArr.count != 0
        {
            tableView.isHidden = false
            self.lblNoPartner.isHidden = true
            count1 = dataPartnerArr.count
        }
        return count1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParternerTableViewCell") as! ParternerTableViewCell
        cell.lblFName.text = "\(dataPartnerArr[indexPath.row].firstName! + " " + dataPartnerArr[indexPath.row].lastName!)" //arrPartner[indexPath.row].fName + " " + arrPartner[indexPath.row].lName
        //        cell.lblLName.text =
        let num = dataPartnerArr[indexPath.row].phone?.replacingOccurrences(of: "+61", with: "", options: .literal, range: nil)
        cell.lblMobile.text = "\("+61 ")\(num?.formateMobileNumber() ?? "")"  //arrPartner[indexPath.row].mobile
        cell.lblEmail.text = dataPartnerArr[indexPath.row].email//arrPartner[indexPath.row].email
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        self.isSelectClick = true
        self.indexPath = indexPath
        let popUpObj = self.storyboard?.instantiateViewController(withIdentifier: "AddPartnerPopUpVC") as! AddPartnerPopUpVC
        popUpObj.modalPresentationStyle = .overCurrentContext
        self.definesPresentationContext = true
        //        popUpObj.delegate = self
        popUpObj.isSelect = true
        popUpObj.isFromEditVC = true
        popUpObj.dismisPartnerPopup = { (partners) in
            DispatchQueue.main.async {
                self.tabBarController?.tabBar.isHidden = false
                
                self.dataPartnerArr[self.indexPath.row].firstName = partners.firstName
                self.dataPartnerArr[self.indexPath.row].lastName = partners.lastName
                self.dataPartnerArr[self.indexPath.row].phone = partners.phone
                self.dataPartnerArr[self.indexPath.row].email = partners.email
                
                self.tblVewPartnerList.reloadData()
            }
        }
        
        self.present(popUpObj, animated: true, completion: nil)
        popUpObj.txtFirstName.text = self.dataPartnerArr[indexPath.row].firstName
        popUpObj.txtLastName.text = self.dataPartnerArr[indexPath.row].lastName
        
        let num = self.dataPartnerArr[indexPath.row].phone?.replacingOccurrences(of: "+61", with: "", options: .literal, range: nil)

        popUpObj.txtMobile.text = "\(num?.formateMobileNumber() ?? "")"
        popUpObj.txtEmail.text = self.dataPartnerArr[indexPath.row].email
        popUpObj.lblSTDCode.isHidden = false
        popUpObj.txtMobile.setLeftPaddingPoints(30)
        popUpObj.btnSubmit.setTitle("Update", for: .normal)
        tableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
     //       print("You remove Element from Array at index")
            let alert = UIAlertController(title: APP_NAME, message: "Are you sure you want to Delete \(self.dataPartnerArr[indexPath.row].firstName ?? "") \(self.dataPartnerArr[indexPath.row].lastName ?? "") as a Partner?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "YES", style: .destructive, handler: { (action) in
                self.dataPartnerArr.remove(at: indexPath.row)
                self.addPartnerListDynamicWidth()
//                self.params["partners"] = self.dataPartnerArr
                tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "NO", style: .cancel, handler: nil))//  self.present(alert, animated: true,completion: )
            self.present(alert, animated: true)
            //self.arrPartner.remove(at: indexPath.row)
        }
        tableView.reloadData()
    }
    
    // Littlebit More detail
    @IBAction func btnClickAddSubrubs(_ sender: UIButton) {
        let subRubsPopup = self.storyboard?.instantiateViewController(withIdentifier: "SubrubsVC") as! SubrubsVC
        subRubsPopup.modalPresentationStyle = .overCurrentContext
        //        subRubsPopup.transitioningDelegate = self
        subRubsPopup.delegate = self
        subRubsPopup.arrNewSuburb = self.arrNewSuburbs
        self.present(subRubsPopup, animated: true, completion: nil)
    }
    @IBAction func btnClickFinanceYes(_ sender: UIButton) {
        
        self.lblPreAprovedFinanceNo.textColor = .black
        self.lblPreAprovedFinanceYes.textColor = .kBlueColor()
        self.strpreAprovedFinance = "true"
        self.boolPreAprovedFinance = true
        
    }
    
    @IBAction func btnClickFinanceNo(_ sender: UIButton) {
        self.lblPreAprovedFinanceNo.textColor = .kBlueColor()
        self.lblPreAprovedFinanceYes.textColor = .black
        self.strpreAprovedFinance = "false"
        self.boolPreAprovedFinance = false
    }
    
    @IBAction func BtnClickAddBedroom(_ sender: UIButton) {
        if numOfBedrooms < 99{
            self.numOfBedrooms = self.numOfBedrooms + 1
            
        }
        self.lblNumberOfbedroom.text = "\(self.numOfBedrooms)"
        
    }
    @IBAction func BtnClickRemoveBedroom(_ sender: UIButton) {
        if self.numOfBedrooms > 0{
            self.numOfBedrooms = self.numOfBedrooms - 1
            self.lblNumberOfbedroom.text = "\(self.numOfBedrooms)"
        }else{
            self.lblNumberOfbedroom.text = "0"
        }
    }
    
    @IBAction func BtnClickAddBathroom(_ sender: UIButton) {
        if numOfBathrooms < 99{
            self.numOfBathrooms = self.numOfBathrooms + 1
            
        }
        self.lblNumberOfBathroom.text = "\(self.numOfBathrooms)"
    }
    @IBAction func BtnClickRemoveBathroom(_ sender: UIButton) {
        if self.numOfBathrooms > 0{
            self.numOfBathrooms = self.numOfBathrooms - 1
            self.lblNumberOfBathroom.text = "\(self.numOfBathrooms)"
        }else{
            self.lblNumberOfBathroom.text = "0"
        }
    }
    
    @IBAction func BtnClickAddCar(_ sender: UIButton) {
        if numOfCar < 99{
            self.numOfCar = self.numOfCar + 1
            
        }
        self.lblNumberOfCar.text = "\(self.numOfCar)"
    }
    @IBAction func BtnClickRemoveCar(_ sender: UIButton) {
        if self.numOfCar > 0{
            self.numOfCar = self.numOfCar - 1
            self.lblNumberOfCar.text = "\(self.numOfCar)"
        }else{
            self.lblNumberOfCar.text = "0"
        }
    }
    
    func openBrokerList(){
        let nextVc = BrokerListVc.instantiate(fromAppStoryboard: .Buyer)
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    func isButtonClicked(_ isClicked: Bool) -> Bool {
        return isClicked
    }
    
    
    // Just added for temp use
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    //MARK:- --------TextViewDelegate Methods------- -
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == .kTextViewPlaceholderColor(){
            textView.text = ""
            textView.textColor = .black
            self.txtViewStr = textView.text
        }else{
            if textView.text == "Tell us about your situation" && textView.textColor == .kTextViewPlaceholderColor(){
                textView.text = ""
                textView.textColor = .black
                self.txtViewStr = textView.text
            }else{
                textView.textColor = .black
                self.txtViewStr = textView.text
            }
            
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == ""{
            textView.attributedText = NSAttributedString(string: "Tell us about your situation", attributes: [NSAttributedString.Key.font : UIFont.custom(style: .Regular, size: .s14)])
            textView.textColor = .kTextViewPlaceholderColor()
            self.txtViewStr = ""
            textView.font = .custom(style: .Medium, size: .s14)
        }else{
            textView.textColor = .black
            self.txtViewStr = textView.text
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if (textView == txtViewAboutMe
            ){
              
                self.txtviewCharCount = textView.text.count + (text.count - range.length)
                if self.txtviewCharCount <= 250
                {
                    print("Count => \(self.txtviewCharCount)")
                    self.lbl_txtviewCout.text = "(\(self.txtviewCharCount) /250)"
                    print("test count => (\(self.txtviewCharCount)/250)")
                    return textView.text.count + (text.count - range.length) <= 250
                    
                }
                else
                {
                    return false
                }
            }
            else
            {
                if textView.text.count == 0{
                    textView.attributedText = NSAttributedString(string: "Tell us about your situation", attributes: [NSAttributedString.Key.font : UIFont.custom(style: .Regular, size: .s14)])
                    textView.textColor = .kTextViewPlaceholderColor()
                    textView.font = .custom(style: .Medium, size: .s14)
                    self.txtViewStr = ""
                }else{
                    textView.textColor = .black
                    self.txtViewStr = textView.text
                }
            }
            return true
        
        
        
        }
    //MARK:- --------SubrubsVC delgate methods ------- -
    func sendArrSubrubs(arrSubrubs: [PreferredSuburbs]) {
        self.txtFieldSubrubs.text = ""
        var arrTemp = [parmSelectedSubrbs]
        arrTemp.removeAll()
//        self.arrNewSuburbs.removeAll()
        self.arrNewSuburbs = arrSubrubs
        
        for i in 0..<self.arrNewSuburbs.count{
            if  self.txtFieldSubrubs.text?.trimWhiteSpaceAndNewLine == ""
            {
                self.txtFieldSubrubs.text = arrNewSuburbs[i].address
                self.parmSelectedSubrbs["address"] = self.arrNewSuburbs[i].address
                self.parmSelectedSubrbs["lattitude"] = "\(self.arrNewSuburbs[i].lattitude ?? 0.0)"
                self.parmSelectedSubrbs["longitude"] = "\(self.arrNewSuburbs[i].longitude ?? 0.0)"
                arrTemp.append(self.parmSelectedSubrbs)
                params["preferredSuburbs"] = arrTemp
//                print("param data sunurbus => \(params)")
            }
            else
            {
                self.txtFieldSubrubs.text = txtFieldSubrubs.text! + " | " + arrNewSuburbs[i].address!
                self.parmSelectedSubrbs["address"] = self.arrNewSuburbs[i].address
                self.parmSelectedSubrbs["lattitude"] = "\(self.arrNewSuburbs[i].lattitude ?? 0.0)"
                self.parmSelectedSubrbs["longitude"] = "\(self.arrNewSuburbs[i].longitude ?? 0.0)"
                arrTemp.append(self.parmSelectedSubrbs)
                params["preferredSuburbs"] = arrTemp
//                print("param data sunurbus => \(params)")
            }
        }
        
        //        for i in 0..<self.arrSelectedSubrubs.count{
        //            if  self.txtFieldSubrubs.text == ""
        //            {
        //                self.txtFieldSubrubs.text = arrSubrubs[i]
        //                self.parmSelectedSubrbs["addressId"] = "\(i)"
        //                self.parmSelectedSubrbs["address"] = self.arrSelectedSubrubs[i]
        //                self.parmSelectedSubrbs["lattitude"] = self.arrSelectedLatLong[i].latitude
        //                self.parmSelectedSubrbs["longitude"] = self.arrSelectedLatLong[i].longitude
        //                arrTemp.append(self.parmSelectedSubrbs)
        //                reqParameter["preferredSuburbs"] = arrTemp
        //                print("reqParameter = \(reqParameter)")
        //            }
        //            else{
        //                //self.lblSubrubs.text = "\(self.lblSubrubs.text) \(arrSubrubs[i]) \(" |")"
        ////                self.txtFieldSubrubs.text = self.txtFieldSubrubs.text! + " | " + arrSubrubs[i]
        //                self.parmSelectedSubrbs["addressId"] = "\(i)"
        //                self.parmSelectedSubrbs["address"] = self.arrSelectedSubrubs[i]//self.txtFieldSubrubs.text
        //                self.parmSelectedSubrbs["lattitude"] = self.arrSelectedLatLong[i].latitude
        //                self.parmSelectedSubrbs["longitude"] = self.arrSelectedLatLong[i].longitude
        //                arrTemp.append(self.parmSelectedSubrbs)
        //                reqParameter["preferredSuburbs"] = arrTemp
        //            }
        //            print("reqParameter[PreferedSubrubs] = \(reqParameter)")
        //        }
    }
    
    //MARK:- API CALLING
    
    func editBuyerApi()
    {
        if isProfilePicSelected
        {
            params["profilePic"] = self.profileImage
        }
        params["buyerId"] =  buyerId
        params["firstName"]  = self.txtFirstName.text ?? ""
        params["lastName"]   = self.txtLastName.text ?? ""
        params["mobile"]     = self.txtMobile.text ?? ""
//        params["email"]      = self.txtEmail.text ?? ""
        params["hasCall"] = self.isSelectCall
        params["hasSMS"] = self.isSelectSms
        params["hasEmail"] =  self.isSelectEmail
        params["answer1"] = self.FeltUnwellIsSelected
        params["answer2"] = self.ConnectedWCovdPstvPplIsSelected
        params["minPrice"] = self.minP
        params["maxPrice"] = self.maxP
        params["bedrooms"] = self.numOfBedrooms
        params["bathrooms"] = self.numOfBathrooms
        params["cars"] = self.numOfCar
        params["aboutMe"] = self.txtViewStr//self.txtViewAboutMe.text
        params["preApprovedFinance"] = self.strpreAprovedFinance
        params["accessToken"] = APIToken
        
    //    print("params data => \(params)")
        
    }
    
    func callEditBuyerProfileApi(){
        number = isRemoveFormatedText(strText: self.txtMobile.text)
        let Url = getbuyerdata?.profilePic
        let url = URL(string: Url!)
      
        if isProfilePicSelected
        {
            
            params["profilePic"] = self.profileImage
            print("params profilePic => \(params["profilePic"])")

        }else{
//            params["profilePic"] = self.profileImage
            if url == nil{
                print("Url is nill")
            }else{
                if let data = try? Data(contentsOf: url!)
                {
                    let image: UIImage = UIImage(data: data)!
        //            self.imgView.makeImageCircla(image)
                    params["profilePic"] = image
                }
            }
        }
        params["buyerId"] =  buyerId
        params["firstName"]  = self.txtFirstName.text ?? ""
        params["lastName"]   = self.txtLastName.text ?? ""
        params["mobile"]     = "\("+61 ")\(self.txtMobile.text ?? "")"
        params["hasCall"] = self.isSelectCall
        params["hasSMS"] = self.isSelectSms
        params["hasEmail"] =  self.isSelectEmail
        params["answer1"] = self.FeltUnwellIsSelected
        params["answer2"] = self.ConnectedWCovdPstvPplIsSelected
        params["minPrice"] = self.minP
        params["maxPrice"] = self.maxP
        params["bedrooms"] = self.numOfBedrooms
        params["bathrooms"] = self.numOfBathrooms
        params["cars"] = self.numOfCar
        params["aboutMe"] = self.txtViewStr
        params["preApprovedFinance"] = self.strpreAprovedFinance
        params["accessToken"] = APIToken
//        params["partners"] = self.dataPartnerArr
        var tempArr = [partners]
        tempArr.removeAll()
//        self.dataPartnerArr.append(partners)
        
        for i in  0..<self.dataPartnerArr.count{
            
             let partners = [
                "firstName" : self.dataPartnerArr[i].firstName ?? "",
                "lastName" : self.dataPartnerArr[i].lastName ?? "",
                "email"  :  self.dataPartnerArr[i].email ?? "",
                "phone" :  self.dataPartnerArr[i].phone ?? ""
            ]
            
            tempArr.append(partners)
        }
            self.params["partners"] = tempArr
        
  //      print("params data => \(params)")
                
        var headers: HTTPHeaders!
        
        if APIToken == "" {
            headers = [
                "Content-type": "multipart/form-data"
            ]
        } else {
            headers = [
                "Content-type": "multipart/form-data",
                "accessToken": APIToken
            ]
        }
        DispatchQueue.main.async(execute: {
            
            APIManager.showLoader()
            // Upload Image
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                // take all value by key from Parameter
                for (key,value) in self.params{
                    print(key)
                    print(value)
                    if value is String{
                        multipartFormData.append(((value as Any) as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
                    else if value is Int{
                        multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                    }else if key == "availabilityTime" || key == "preferredSuburbs" || key == "partners"{
                        let tmg = try! JSONSerialization.data(withJSONObject:value, options: [])
                        multipartFormData.append(tmg, withName: key)
                    }else if value is UIImage{
                        
                        var imageData :Data = Data()
                        
                        let imgProfile = value as? UIImage
                        imageData = imgProfile!.jpegData(compressionQuality: 0.75)!
                        
                        multipartFormData.append(imageData, withName: "profilePic", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
                    }
                }
                
                
            }, to: APIEndpoint.editBuyerProfile,method: .post,headers: headers)
            { (result) in
               
                switch result
                {
                case .success(let upload,_, _):
                    
                    upload.uploadProgress(closure:
                        { (Progress) in
                            print("Upload Progress: \(Progress.fractionCompleted)")
                    })
                    upload.responseString
                        { [self] response in
                        APIManager.hideLoader()
                            print("print \(response)")
                            
                            if let JSONh = response.result.value
                            {
                                print("******api Call sucessfully")
                                
                                let dict = self.convertToDictionary(text: JSONh)
                                let data = JSON.init(dict as Any)
                                
                                if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4 || data["status"].intValue == 5{
                                    showAlertWith(message: data["message"].stringValue, inView: self)
                                }
                                else if data["status"].intValue == 1
                                {
                                    self.showAlertMessage(messageStr: data["message"].stringValue) { (donebtnclicked) in
                                        self.navigationController?.popViewController(animated: true)
                                    }
                                }
                            }
                            DispatchQueue.main.async
                                {
                                    SVProgressHUD.dismiss()
                            }
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
                print("Outside the scope , Api not call")
            }
        })
    }
}
extension Int {
    private static var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        return numberFormatter
    }()

    var delimiter: String {
        return Int.numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
