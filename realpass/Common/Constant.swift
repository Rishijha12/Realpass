//
//  Constant.swift
//  Specialz
//
//  Created by i-Phone13 on 04/04/19.
//  Copyright © 2019 i-Verve. All rights reserved.
//

import UIKit

let applicationName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
let cellHeight: CGFloat = (UIScreen.main.bounds.width * 2) / 5
let circularTopDiffrence: CGFloat = hasTopNotch ? 172 : 152

let ShareObj = SharedManager.sharedInstance
let APP_NAME = "realpass"
var currentUser:UserDataModel = UserDataModel.init(dictionary: NSDictionary())!

//@available(iOS 13.0, *)
let appdelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

var APIToken = ""

//var isAccountSetUp = false
var agentId = 0
var buyerId = 0
var userType = 0
var isPreAprovedFinance = false
var isProfilePicSelected = false
var isFromHome = true
var reqParameter: [String : Any] = [:]
var mybool:Bool = false
var createdByAgent = false
var arrPrtnr = [Partner]()
var arrpropertyInd = [Int]()
var isBackClick = false
var newPrefSubruba = [PreferredSuburbs]()

/*
let kuserId         = "userId"
let kuserName       = "userName"
let kprofilePic     = "profilePic"
let kemail          = "email"
let kgender         = "gender"
let kdateOfBirth    = "dateOfBirth"
let kisProfileSetUp = "isProfileSetup"
let kaccessToken    = "accessToken"
let kloginVia       = "loginVia"
let kfbAccessToken  = "fbAccessToken"
let kpurchaseId     = "purchaseId"
*/

var hasTopNotch: Bool {
    if #available(iOS 11.0, *) {
        return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
    } else {
        return false
    }
}
var isLoggedIn: Bool {
    if (UserDefaults.standard.value(forKey: Keys.userData) as? [String: Any]) != nil {
        return true
    } else {
        return false
    }
}

//var UserData: User = User.init(dictionary: UserDefaults.standard.value(forKey: Keys.userData) as? [String: Any] ?? [:]) {
//    willSet { UserDefaults.standard.set(newValue.dictionary(), forKey: Keys.userData) }
//}
struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE                            = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPHONE_4_OR_LESS                  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5                          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6_7_8                      = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P_7P_8P                   = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X_Xs_XSMAX_12MINI_11PRO    = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    static let IS_IPHONE_XR_11PROMAX_11             = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 896.0
    static let IS_IPHONE_12_12PRO                   = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 844.0
    static let IS_IPHONE_12_PRO_MAX                 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 926.0
    
    
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO_9_7      = IS_IPAD
    static let IS_IPAD_PRO_12_9     = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    static let IS_TV                = UIDevice.current.userInterfaceIdiom == .tv
    static let IS_CAR_PLAY          = UIDevice.current.userInterfaceIdiom == .carPlay

}

struct Version{
    static let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
    static let iOS7  = (Version.SYS_VERSION_FLOAT < 8.0 && Version.SYS_VERSION_FLOAT >= 7.0)
    static let iOS8  = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
    static let iOS9  = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
    static let iOS10 = (Version.SYS_VERSION_FLOAT >= 10.0 && Version.SYS_VERSION_FLOAT < 11.0)
    static let iOS11 = (Version.SYS_VERSION_FLOAT >= 11.0 && Version.SYS_VERSION_FLOAT < 12.0)
    static let iOS12 = (Version.SYS_VERSION_FLOAT >= 12.0 && Version.SYS_VERSION_FLOAT < 13.0)
}



struct ImageName{
    static let addPartner = "add partner"
    static let addRoom = "add-room"
    static let add = "add"
    static let arrow = "arrow app"
    static let backButtom = "back button"
    static let blackStar = "black star"
    static let circle = "circle"
    static let close = "close"
    static let csv = "csv"
    static let delete = "delete"
    static let doller = "dollar"
    static let downArrow = "down arrow"
    static let downloadFile = "download file"
    static let edit = "edit"
    static let feelCircle = "feel circle 2"
    static let filters = "filters"
    static let lineblck = "line-black"
    static let lineDark = "line-dark@2x"
    static let location1 = "location-1"
    static let location = "location"
    static let lock = "lock"
    static let mail = "mail"
    static let minus = "minus"
    static let navigationbar = "navigation bar"
    static let notification = "notification"
    static let radio = "radio btn"
    static let rate = "rate"
    static let scan = "scan"
    static let search = "search"
    static let star1 = "star-"
    static let star2 = "star"
    static let subrubs = "suburbs"
    static let upperArrow = "uper-arrow"
    static let uploadPhoto = "upload-photo"
    static let upperArrow1 = "upperarrow-app"
}

struct RobotFont{
    static let robotBlack = "Roboto-Black"
    static let robotBlackItalic = "Roboto-BlackItalic"
    static let robotBold = "Roboto-Bold"
    static let robotBoldItalic = "Roboto-BoldItalic"
    static let robotLight = "Roboto-Light"
    static let robotItalic = "Roboto-Italic"
    static let robotLightItalic = "Roboto-LightItalic"
    static let robotMedium = "Roboto-Medium"
    static let robotMediumItalic = "Roboto-MediumItalic"
    static let robotRegular = "Roboto-Regular"
    static let robotThin = "Roboto-Thin"
    static let robotThinItalic = "Roboto-ThinItalic"
    
}

//MARK:- -------- Fonts -------
func getPropostionalFontSize(_ size:CGFloat) -> CGFloat
{
    var sizeToCheckAgainst = size
    if(DeviceType.IS_IPAD) {
        sizeToCheckAgainst = size * (ScreenSize.SCREEN_HEIGHT/736)
    }
    else {
        if(DeviceType.IS_IPHONE_X_Xs_XSMAX_12MINI_11PRO)
        {
            sizeToCheckAgainst += 1.4
        }
        else if(DeviceType.IS_IPHONE_6P_7P_8P)
        {
            sizeToCheckAgainst += 1
        }
        else if(DeviceType.IS_IPHONE_6_7_8)
        {
            
            sizeToCheckAgainst -= 0
        }
        else if(DeviceType.IS_IPHONE_5)
        {
            sizeToCheckAgainst -= 1
        }
        else if(DeviceType.IS_IPHONE_4_OR_LESS)
        {
            sizeToCheckAgainst -= 2
        }
    }
    return sizeToCheckAgainst
}
struct BaseURL{
    static let strDevURL        = "http://realpassdev.ifuturz.com/webservice/"
    static let strQaURL         = "http://realpassqa.ifuturz.com/webservice/"
    static let strCDUURL        = "http://realpass.clouddownunder.com.au/webservice/"
}

struct URLs{
    // ******* Dev URL *******
    static let APIURL = BaseURL.strDevURL
    
    // ******* QA URL *******
//              static let APIURL = BaseURL.strQaURL
    
    // ******* CDU URL *******
//            static let APIURL = BaseURL.strCDUURL
    
    // ******* Live Application URL *******
    //          static let APIURL = BaseURL.strLiveURL
}
//http://realpassdev.ifuturz.com/webservice/Buyer/signUpBuyer

struct APIEndpoint
{
    static let login                          = URLs.APIURL + "Agent/login"
    static let forgotPassword                 = URLs.APIURL + "Agent/forgotPassword"
    static let signUpAgent                    = URLs.APIURL + "Agent/signUpAgent"
    static let setUpAgentProfile              = URLs.APIURL + "Agent/setUpAgentProfile"
    static let editAgentProfile               = URLs.APIURL + "Agent/editAgentProfile"
    static let createBuyerProfile             = URLs.APIURL + "Agent/createBuyerProfile"
    static let changePassword                 = URLs.APIURL + "Agent/changePassword"
    static let logout                         = URLs.APIURL + "Agent/logout"
    static let getBuyerList                   = URLs.APIURL + "Agent/getBuyerList"
    static let SignupBuyer                    = URLs.APIURL + "Buyer/signUpBuyer"
    static let setUpBuyerProfile              = URLs.APIURL + "Buyer/setUpBuyerProfile"
    static let getBuyerProfile                = URLs.APIURL + "Buyer/getBuyerProfile"
    static let brokerList                     = URLs.APIURL + "Buyer/brokerList"
    static let visitProperty                  = URLs.APIURL + "Buyer/visitProperty"
    static let visitedPropertyList            = URLs.APIURL + "Buyer/visitedPropertyList"
    static let updateRating                   = URLs.APIURL + "Buyer/updateRating"
    static let editBuyerProfile               = URLs.APIURL + "Buyer/editBuyerProfile"
    static let getMyProprtyList               = URLs.APIURL + "Agent/getMyProprtyList"
    static let getPropertyBuyerList           = URLs.APIURL + "Agent/getPropertyBuyerList"
    static let deleteProperty                 = URLs.APIURL + "Buyer/deleteProperty"
    static let propertyBuyerList              = URLs.APIURL + "Agent/propertyBuyerList"
    static let setBuyerProperties             = URLs.APIURL + "Agent/setBuyerProperties"
    static let searchBuyer                    = URLs.APIURL + "Agent/searchBuyer"
    
}

struct RequestKeys
{

    static let status           = "email"
    static let message          = "message"
    static let data             = "data"
    static let deviceType       = "deviceType"
    static let deviceToken      = "deviceToken"
    static let accessToken      = "accessToken"
    static let isProfileSetUp   = "isProfileSetUp"
    static let propertyId       = "propertyId"
    static let propertyList     = "propertyList"
    
    static let email            = "email"
    static let password         = "password"
    static let id               = "id"
    static let usertype         = "userType"
    static let agentId          = "agentId"
    static let buyerId          = "buyerId"
    static let otherBuyerId     = "otherBuyerId"
    static let rating           = "rating"
    static let isAlphabetFilter = "isAlphabetFilter"
    static let searchText       = "searchText"
    
    static let agency           = "agency"
    static let firstName        = "firstName"
    static let lastName         = "lastName"
    static let mobile           = "mobile"
    static let profilePic       = "profilePic"
    static let newPassword      = "newPassword"
    static let pageIndex        = "pageIndex"
    static let isScan           = "isScan"
    
}

struct ResponseKeys
{

    static let status           = "status"
    static let message          = "message"
    static let errorCode        = "error"
    static let data             = "data"
    static let deviceType       = "deviceType"
    static let deviceToken      = "deviceToken"
    static let accessToken      = "accessToken"
    
    static let email            = "email"
    static let password         = "password"
    static let userId           = "userId"
    
    static let agency           = "agency"
    static let firstName        = "firstName"
    static let lastName         = "lastName"
    static let mobile           = "mobile"
    static let profilePic       = "profilePic"
    static let newPassword      = "newPassword"
    static let pageIndex        = "pageIndex"
    
}

struct ErrorCodes{
    static let error = 0
    static let success = 1
    static let deleted = 2
    static let inactive = 3
    static let tokenExpired = 4
    static let noData = 5
    
}


struct Keys {
    static let googleMapKey                   = "AIzaSyAsmbHyj4KKaSOzCCRCnHPt-V9f2hFvcLU"
    static let userData                       = "userData"
    static let faceBookProfilePicture         = "faceBookProfilePicture"
    static let faceBookProfileName            = "faceBookProfileName"
    static let reviewUpdated                  = "reviewUpdated"
    static let venueReviewUpdated             = "venueReviewUpdated"
    static let status                         = "status"
    static let data                           = "data"
    static let message                        = "message"
    static let errorCode                      = "errorCode"
    
    static let userId                         = "userId"
    static let accessToken                    = "accessToken"
    static let agency                         = "agency"
    static let email                          = "email"
    static let firstName                      = "firstName"
    static let lastName                       = "lastName"
    static let mobile                         = "mobile"
    static let profilePic                     = "profilePic"
    static let isProfileSetUp                 = "isProfileSetUp"
    static let userType                       = "userType"
    static let agentId                        = "agentId"
    static let buyerId                        = "buyerId"
    static let password                       = "password"
    static let currentUserData                = "currentUserData"
    static let FCMToken                        = "fcmtoken"
}
struct GoogleKey
{
    //AIzaSyATrHUE_Bjsb2qmja4YiNudwJk_2ykyQcU
    static let googleAPIKey                 = "AIzaSyDhIyuq2l5etgWMmutSshuOvtLEO7QgkvI"//"AIzaSyBMYNiDVQuzvols-I-c7voSYS59mGVME9M"
    //"AIzaSyATrHUE_Bjsb2qmja4YiNudwJk_2ykyQcU" // client account
//    API key: AIzaSyDhIyuq2l5etgWMmutSshuOvtLEO7QgkvI
}

struct Messages {
    
    static let yes = "YES"
    static let no = "NO"
    static let ok = "OK"
    static let cancel = "CANCEL"
    static let setting = "Setting"
    static let NotNow = "NotNow"
    static let searchText = "Search by Locations/Venues"
    static let selectMenu = "Please select at least one menu."
    
    static let noRecords = "No record(s) found"
    static let noVenues = "No venue(s) found"
    static let noItems = "No item(s) found"
    static let noNotifications = "No notification(s) found"
    static let noReviews = "No review(s) found"
    static let removeVenue = "Do you want to unfavourite this venue?"
    static let removeItem = "Do you want to unfavourite this item?"
    static let enterEmail = "Please enter an email."
    static let enterValidEmail = "Please enter valid email."
    static let enterPassword = "Please enter password."
    static let enterMinLengthPassword = "Password should not be less than six characters."
    static let enterEmailorUsername = "Please enter an username or email."
    static let enterUserName = "Please enter your username."
    static let logoutConfirmationMessage = "Are you sure you want to logout?"
    static let enterWriteReview = "Write review description should not be less than 50 characters."
    static let Login = "You are successfully logged-in."
    static let Review = "Please enter review."

    static let noRoute = "No route avaliable."
    static let locationPermissionNotGiven = "GPS is disabled now Do you want to turn ON your GPS?"
    static let sendMail = "Your device could not send e-mail.  Please check e-mail configuration and try again."
    static let selectCheckbox = "Please select atleast one checkbox."
    static let selecTermAndCondition = "Please accept Terms & Conditions."
    static let emailnotfound = "This email is not found."
    static let reportdescription = "Please enter report description."
    static let userNameavailabel = "This user name is available."
    static let notificationDelete = "Are you sure, you want to delete?"
    static let selectReportCheckbox = "Please select a reason to report this venue"
    static let selectRating = "Please select rating."
    
    static let networkDisconnect              = "You are offline, connect to the Internet"
    static let networkConnect                 = "Connect to Internet"
    static let cameraTitleMssg                = "Access to camera not available"
    static let audioTitleMssg                 = "Access to audio not available"
    static let cameraPermissionMssg           = "Please enable access to camera in order to use this feature"
    static let audioPermissionMssg            = "Please enable access to microphone in order to record Audio"
}

struct Validation {
    
    //SignUp/Login/ForgotPassword/ChangePassword..
    
    static let Allfieldrequered = "All fields are mandatory."
    static let BusinessName = "Please enter Business name."
    static let EmailId = "Please enter an Email."
    static let ValidEmailId = "Please enter valid Email."
    static let ValidPassword = "Please enter valid Password."
    
    static let ForgotePassword = "Your password has been sent to your email address."
    
    static let Password = "Please enter Password."
    static let passwordEmoji = "Password can't contain emojis."
    static let MinLengthPassword = "Password should not be less than 8 characters."
    static let firstNameLength = "First name should not be less than 3 characters."
    static let lastNameLength = "Last name should not be less than 3 characters."
    static let PasswordConfirmPswNotMatch = "Password and confirm password does not match."
    static let currentPasswordNotMatch = "Current password is wrong." //"Current password does not match."
    static let NewConfirmPasswordNotMatch = "New password and confirm password does not match."
    static let currentPasswordMinLength = "Current password should be of minimum 8 characters."
    static let newPasswordMinLength = "New password should be of minimum 8 characters."
    
    static let ConfirmPassword = "Please enter Confirm Password."
    static let CurrentPassword = "Please enter Current Password."
    static let CurrentNewPswValidation = "New password cannot be the same as your current password." //Current password and new password should not be same"
    
    static let NewPassword = "Please enter New Password."
    static let GPSDesabled = "GPS is disabled now Do you want to turn ON your GPS?"
    static let cameraAlert = "You don't have camera!"
    static let logOutMssg = "Are you sure you want to logout?"
    static let validPassword = "Password must contain at least one uppercase, lowercase, numeric value, special character and should not be less than 8 characters."
    static let NoInternetConnection = "Please check your internet connection and try again."
    static let validBirthdate = "Age should not be less than 18 years."
    
    //profile
    
    static let selectBirthdate = "Please select Date of Birth."
    static let selectGender = "Please select Gender."
    static let phoneNumber = "Please enter Mobile Number."
    static let phoneNumberLength = "Please enter 10 digits mobile number."
    static let FirstName = "Please enter First name."
    static let ValidFirstName = "First name should have at least 3 characters."
    static let FirstNameSpace = "The Space between the first name should not be accepted."
    static let FirstNameNumeric = "First name should not contain numeric value or any special character." // "First name should not allow to type anything(Digits, Special characters,Space) except alphabets only."
    static let LastName = "Please enter Last name."
    static let ValidLastName = "Last name should have at least 3 characters."
    static let LastNameSpace = "The Space between the Last name should not be accepted."
    static let LastNameNumeric = "Last name should not contain numeric value or any special character."
    static let Phone = "Please enter Mobile number."
    static let PhoneValid = "Please enter valid Mobile number."
    static let AgencyName = "Please enter Agency Name."
    static let AgencyValidName = "Please enter Valid Agency Name."
    
    //Share your exp
    
    static let title = "Please enter Title."
    static let experience = "Please share your experience with us, We'd love to hear from you."
    static let future = "Please share your features would you like to see in the future?"
    static let minLengthfuture = "Future should not be less than 10 characters."
    static let minLengthExp = "Experience should not be less than 10 characters."
}


func removeAllUserDefaults() {
    UserDefaults.standard.removeObject(forKey: Keys.userData)
    UserDefaults.standard.removeObject(forKey: Keys.faceBookProfileName)
    UserDefaults.standard.removeObject(forKey: Keys.faceBookProfilePicture)
}

func isKeyPresentInUserDefaults(key: String) -> Bool {
    return UserDefaults.standard.object(forKey: key) != nil
}

func isRemoveFormatedText(strText: String?) -> String {
    let result = strText ?? "".replacingOccurrences(of: "(", with: "", options: .literal, range: nil)
    let result1 = result.replacingOccurrences(of: ")", with: "", options: .literal, range: nil)
    let result2 = result1.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
    let result3 = result2.replacingOccurrences(of: "+61", with: "", options: .literal, range: nil)
//    let result4 = result3.replacingOccurrences(of: "61", with: "", options: .literal, range: nil)
    return result3.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
}

extension String
{
    func formateMobileNumber() -> String
    {
        let cleanPhoneNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let mark = "XXXX XXX XXX"
        
        var result = ""
        var startIndex = cleanPhoneNumber.startIndex
        var endIndex = cleanPhoneNumber.endIndex
        
        for charct in mark where startIndex<endIndex
        {
            if charct == "X"
            {
                result.append(cleanPhoneNumber[startIndex])
                startIndex = cleanPhoneNumber.index(after: startIndex)
            }
            else
            {
                result.append(charct)
            }
        }
        return result
    }
}

func goToBase(message: String) {
    DispatchQueue.main.async {
        UserDefaults.standard.removeObject(forKey: Keys.userType)
           UserDefaults.standard.removeObject(forKey: Keys.accessToken)
           UserDefaults.standard.removeObject(forKey: Keys.isProfileSetUp)
           UserDefaults.standard.removeObject(forKey: Keys.agentId)
           UserDefaults.standard.removeObject(forKey: Keys.currentUserData)
           UserDefaults.standard.removeObject(forKey: "isUserLogin")
           UserDefaults.standard.removeObject(forKey: Keys.password)
        
           let storyboard = UIStoryboard.init(name: "PreLogin", bundle: nil)
           appdelegate.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "userSelection")
           appdelegate.window?.makeKeyAndVisible()

    }
    
    
   }
