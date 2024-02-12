//
//  APIManager.swift
//  iKnowa
//
//  Created by i-Phone on 08/09/20.
//  Copyright © 2020 i-Verve. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SVProgressHUD


class APIManager {
    
    class var shared : APIManager {
        struct Static {
            static let instance : APIManager = APIManager()
        }
        return Static.instance
    }
    
    static func showLoader() -> Swift.Void {
        DispatchQueue.main.async {
            SVProgressHUD.show()
            SVProgressHUD.setDefaultStyle(.custom)
            SVProgressHUD.setDefaultMaskType(.custom)
            SVProgressHUD.setHapticsEnabled(true)
            SVProgressHUD.setDefaultAnimationType(.flat)
            SVProgressHUD.setBorderWidth(3)
            SVProgressHUD.setBackgroundColor(.kAppBgColor()) //(.kHolidayColor())
            SVProgressHUD.setBorderColor(.white)
            SVProgressHUD.setFont(.custom(style: .Medium, size: .s15))
            SVProgressHUD.setForegroundColor(.kBtnBlueColor())
            SVProgressHUD.setMinimumDismissTimeInterval(0.7)
        }
    }
    
    static func hideLoader()  -> Swift.Void{
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    static func hideLoader(_status : String , isComplete : Bool)  -> Swift.Void{
        DispatchQueue.main.async {
            if isComplete {
                SVProgressHUD.showSuccess(withStatus: _status)
            }else{
                SVProgressHUD.showError(withStatus: _status)
            }
            //SVProgressHUD.dismiss(withDelay: 1)
        }
    }
    
    
    func callGetApi(url: String, showActivityIndicator: Bool = false,callBack:@escaping (_ dataFromServer: JSON?, _ error:Error?) -> Void){
        
        if !Connectivity.isConnectedToInternet() {
            showAlertWith(message: Validation.NoInternetConnection, inView: UIApplication.topViewController()!)
            return
        }
        
        let headers: HTTPHeaders = [
            //.authorization(username: "test@email.com", password: "testpassword"),
            //.accept("application/json")
            "accept": "application/json",
//            "token": "sdfgkjbsdfkj"
        ]
        print("URL : \(url)")
        print("header : \(headers)")
        
        Alamofire.request(url, method: .get, headers: [:]).responseJSON { response in
            debugPrint("\nResponse:\n",response)
            
            switch response.result {
            case .success(let value):
                let finalJson = JSON(value)
                callBack(finalJson,nil)
                
            case .failure(let error):
                callBack(nil,error)
                print("\nResponse ERROR:\n",error.localizedDescription)
            }
        }
    }
    
    func callPostApi(url: String, parameters: [String:Any], callBack:@escaping (Result<Any>) -> Void) {
        if !Connectivity.isConnectedToInternet() {
            showAlertWith(message: Validation.NoInternetConnection, inView: UIApplication.topViewController()!)
            return
        }
        
        var headers: HTTPHeaders!
        
        if APIToken == "" {
            headers = [
                "Content-type": "application/json"
            ]
        } else {
            headers = [
                "Content-type": "application/json",
                "accessToken": APIToken
//                "accessToken": temAPIToken
            ]
        }
        
        print("URL: \(url)")
        print("header: \(headers!)")
        print("parameters: \(parameters)")
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                print("\nResponse:\n",response)
                callBack(.success(JSON(value)))
            case .failure(let error):
                print("\nResponse ERROR:\n",error.localizedDescription)
                callBack(.failure(error))
            }
        }
    }
    //MARK:- Multipart API Call
//    func callPostWithMultiPartApi(reqURL: String, parameters: [String:Any], callBack:@escaping ( _ data: JSON?, _ error:String?) -> Void){
//        
//        if !Connectivity.isConnectedToInternet() {
//            showAlertWith(message: Validation.NoInternetConnection, inView: UIApplication.topViewController()!)
//            return
//        }
//        var headersTemp: HTTPHeaders!
//            headersTemp = [
//                .accept("application/json"),
//                .authorization(bearerToken: "\(APIToken)")
//            ]
//        
//        print("Req URL : \(reqURL)")
//        print("Req Header : \(headers!)")
//        print("Req Params : \(parameters)")
//        
//        APIManager.showLoader()
//        AF.upload(multipartFormData: { multipartFormData in
//            
//            for (key, value) in parameters {
//                if value is String {
//                    multipartFormData.append(((value as Any) as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//                } else if value is Int {
//                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
//                } else if value is UIImage {
//                    let image = value as? UIImage
//                    let imgDataTemp = (image?.jpegData(compressionQuality: 0.4) as Data?)!
//                    multipartFormData.append(imgDataTemp, withName: key, fileName: "coverPic.jpeg", mimeType: "image/jpeg")
//                } else if (key == "data"){
//                    let tmg = try! JSONSerialization.data(withJSONObject:value, options: [])
//                    multipartFormData.append(tmg, withName: key)
//                }
//            }
//        }, to: reqURL, method: .post, headers: headers)
//            .responseJSON { (response) in
//                APIManager.hideLoader()
//                print(response)
//                switch response.result {
//                case .success(let value):
//                    let finalJson = JSON(value)
//                    self.sessionReset(json: finalJson)
//                    callBack(finalJson,"")
//                case .failure(let error):
//                    callBack(nil,error.localizedDescription)
//                    print("\nResponse ERROR:\n",error.localizedDescription)
//                }
//        }
//    }
    func callPostWithMultiPartApiold(url: String, parameters: [String:Any], img: UIImage, callBack:@escaping (Result<Any>) -> Void){
        
        if !Connectivity.isConnectedToInternet() {
            showAlertWith(message: Validation.NoInternetConnection, inView: UIApplication.topViewController()!)
            return
        }
        
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
        
        print("URL: \(url)")
        print("header: \(headers!)")
        print("parameters: \(parameters)")
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            
            for (key, value) in parameters {
                print("Key : \(key) ---  Value : \(value)")
                if value is String
                {
                    multipartFormData.append(((value as Any) as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
                else if value is Int
                {
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                }
                else if value is UIImage
                {
                    let data = img.jpegData(compressionQuality: 0.5)!
                    multipartFormData.append(data, withName: "profilePic", fileName: "image.jpeg", mimeType:"image/jpeg")
                }
            }
            
            print("multipartFormData: \(multipartFormData)")
//            multipartFormData.append(Data(), withName: "profilePic", fileName: "image", mimeType:".png/.jpg")
        }, to: url) { (result) in
            switch result {
            case .success(let value):
                callBack(.success(JSON(value)))
            case .failure(let error):
                callBack(.failure(error))
                print("\nResponse ERROR:\n",error.localizedDescription)
            }
        }
    }
}

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

extension UIApplication {
    static func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
