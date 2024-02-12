//
//  QRScannerController.swift
//  QRCodeReader
//
//  Created by Simon Ng on 13/10/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyJSON
import Alamofire
import SVProgressHUD

class QRScannerController: UIViewController{
    
    //MARK:- OUTLATS
    
    @IBOutlet var btnClose: UIButton!
    
    //MARK:- VARIABLE DECLRATION
    var currentStatusPro = 0
    var currentStatusBuye = 0
    var propertyid = 0
    var isScanned: Bool = false
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    var firstName = ""
    var mobile = ""
    var email = ""
    var lastName = ""
    var profilePic = ""
    
    private let supportedCodeTypes = [AVMetadataObject.ObjectType.upce,
                                      AVMetadataObject.ObjectType.code39,
                                      AVMetadataObject.ObjectType.code39Mod43,
                                      AVMetadataObject.ObjectType.code93,
                                      AVMetadataObject.ObjectType.code128,
                                      AVMetadataObject.ObjectType.ean8,
                                      AVMetadataObject.ObjectType.ean13,
                                      AVMetadataObject.ObjectType.aztec,
                                      AVMetadataObject.ObjectType.pdf417,
                                      AVMetadataObject.ObjectType.itf14,
                                      AVMetadataObject.ObjectType.dataMatrix,
                                      AVMetadataObject.ObjectType.interleaved2of5,
                                      AVMetadataObject.ObjectType.qr]
    
    //MARK:- LIFE CYCLE
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized {
            //already authorized
            self.openScanner()
        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                if granted {
                    //access allowed
                    self.openScanner()
                } else {
                    //access denied
                    print("access denied")
                    
                    let alertController = UIAlertController (title: APP_NAME, message: "We can't access your camera. Please allow camera permission to scan QR code.", preferredStyle: .alert)

                        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in

                            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                                return
                            }

                            if UIApplication.shared.canOpenURL(settingsUrl) {
                                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                                    print("Settings opened: \(success)") // Prints true
                                })
                            }
                        }
                        alertController.addAction(settingsAction)
                        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                        alertController.addAction(cancelAction)

                    self.present(alertController, animated: true, completion: nil)
                }
            })
        }
        
        self.btnClose.layer.cornerRadius = 23
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.bringSubviewToFront(self.btnClose)
    }
    
    //MARK:- FUNCTIONS
    
    func openScanner(){
        
        // Get the back-facing camera for capturing videos
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else{
            print("Failed to get the camera device")
            return
        }
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Set the input device on the capture session.
            captureSession.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
            //            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        
        // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        
        // Start video capture.
        captureSession.startRunning()
        
        // Move the message label and top bar to the front
        view.bringSubviewToFront(btnClose)
        
        // Initialize QR Code Frame to highlight the QR code
        qrCodeFrameView = UIView()
        
        if let qrCodeFrameView = qrCodeFrameView{
            qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
            qrCodeFrameView.layer.borderWidth = 2
            view.addSubview(qrCodeFrameView)
            view.bringSubviewToFront(qrCodeFrameView)
        }
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        
        if let connection =  self.videoPreviewLayer?.connection{
            let currentDevice: UIDevice = UIDevice.current
            let orientation: UIDeviceOrientation = currentDevice.orientation
            let previewLayerConnection : AVCaptureConnection = connection
            
            if previewLayerConnection.isVideoOrientationSupported {
                switch (orientation) {
                case .portrait:
                    updatePreviewLayer(layer: previewLayerConnection, orientation: .portrait)
                    break
                case .landscapeRight:
                    updatePreviewLayer(layer: previewLayerConnection, orientation: .landscapeLeft)
                    break
                case .landscapeLeft:
                    updatePreviewLayer(layer: previewLayerConnection, orientation: .landscapeRight)
                    break
                case .portraitUpsideDown:
                    updatePreviewLayer(layer: previewLayerConnection, orientation: .portraitUpsideDown)
                    break
                default:
                    updatePreviewLayer(layer: previewLayerConnection, orientation: .portrait)
                    break
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- chandan
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        self.checkBaseString()
        
    }
    
    
    func checkBaseString (str : String)
       {
        /*
           1) add status type while opening scan file
           2) get 64 string
        */
//        var qrString =  "1954RP$eyJwcm9wZXJ0eUlkIjoyLCJzdGF0dXMiOjJ9"
       print("str string data => \(str)")
        var qrString = str// "1954RP$eyJmaXJzdE5hbWUiOiJUZXN0IiwibGFzdE5hbWUiOiJEZW1vIiwiZW1haWwiOiJrYW1saUB5b3BtYWlsLmNvbSIsIm1vYmlsZSI6ImJiIiwicHJvZmlsZVBpYyI6IiIsInN0YXR1cyI6MX0="
        let wordToRemove = "1954RP$"
        if qrString.contains("1954RP$")
        {
            if let range = qrString.range(of: wordToRemove) {
               qrString.removeSubrange(range)
            }
            print("qrString data => \(qrString)")
            
            let base64String = qrString
            print("base64String data => \(base64String)")
            if base64String != ""
            {
                let decodedData = Data(base64Encoded: base64String)!
                let decodedString = String(data: decodedData, encoding: .utf8)!
                let objMeta = convertToDictionary(text: decodedString as String)
                
                print("objmeta data => \(objMeta)")
                let dataInt = objMeta!["status"] as? Int ?? 0
                let id = objMeta!["propertyId"] as? Int ?? 0
                print("id data =>\(id)")
                if currentStatusPro == dataInt
                {
                   print(objMeta!["propertyId"] as? Int ?? 0)
                    
                   propertyid = objMeta!["propertyId"] as? Int ?? 0
                   print("propertyid data => \(propertyid)")
                    print("propertyid data stringdata => \(objMeta!["propertyId"] as? String )")
                    print("propertyid data normal data  => \(objMeta!["propertyId"])")
                    if propertyid != 0
                    {
                        self.visitPropertyAPI()
//                        print(".....visitPropertyAPI data1 => ..\(visitPropertyAPI())")
                    }
                    else
                    {
                        let id = objMeta!["propertyId"] as? String ?? "0"
                        print("test id => \(id)")
                        let tempId = Int(id)
                        print("tempId id => \(tempId)")
                        if tempId != 0
                        {
                            propertyid = tempId ?? 0
                            self.visitPropertyAPI()
//                            print(".....visitPropertyAPI data2 => ..\(visitPropertyAPI())")
                        }
                    }
                }
                else if currentStatusBuye == dataInt
                {
                    firstName = objMeta!["firstName"] as? String ?? ""
                    lastName = objMeta!["lastName"] as? String ?? ""
                    email = objMeta!["email"] as? String ?? ""
                    mobile = objMeta!["mobile"] as? String ?? ""
                    profilePic = objMeta!["profilePic"] as? String ?? ""
                    self.CreateBuyerScanAPI()
                }else{
                    print("Scanner Alert should be implemented")
                    self.showAlert()
                }
            }
            else
            {
                self.showAlert()
            }
        }
        else
        {
            self.showAlert()
        }
        
        
        
        
        /*
           3) convert 64 to simple string
           4) check status
           5) curr status and base 64 string's status both are same then it is correct code else show invalid code message
           6) status - 2 =>get property id
           7) status 1 => get buyer data
           8) call api for viewproperty
         
         {
             "propertyId": 3,
             "status": 2
         }
 */
       }

    func visitPropertyAPI()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.buyerId] = buyerId
        params[RequestKeys.accessToken] = APIToken
        params[RequestKeys.propertyId] = propertyid
        
        APIManager.showLoader()
        APIManager.shared.callPostApi(url: APIEndpoint.visitProperty, parameters: params) { (result) in
            APIManager.hideLoader()
            switch result
            {
                
            case.success(let myresponse):
                
                let data = JSON.init(myresponse)
                
                if data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4 || data["status"].intValue == 5
                {
                    self.showAlertMessage(messageStr: data["message"].stringValue)
                    { (okbtn) in
//                        self.openScanner()
                        self.captureSession.startRunning()
                    }
                }
                    else if data["status"].intValue == 1
                    {
                        self.showAlertMessage(messageStr: data["message"].stringValue)
                        { (okbtn) in
                            mybool = false
                            self.navigationController?.popViewController(animated: true)
                        }
                        
                    }
                
                break
            case.failure:
                break
            }
            
        }
        
    }
    
    
    func CreateBuyerScanAPI()
    {
        var params: [String: Any] = [ : ]
        params[RequestKeys.email] = email
        params[RequestKeys.agentId] = agentId
        params[RequestKeys.firstName] = firstName
        params[RequestKeys.lastName] = lastName
        params[RequestKeys.mobile] = mobile
        params[RequestKeys.accessToken] = APIToken
        params[RequestKeys.isScan] = 1
        params[RequestKeys.profilePic] = ""//profilePic
        
        
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
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                                
                for (key,value) in params
                {
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
                        var imageData :Data = Data()
                        
                            let imgProfile = value as? UIImage
                            imageData = imgProfile!.jpegData(compressionQuality: 0.75)!
                        
                        multipartFormData.append(imageData, withName: "profilePic", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
                    }
                }
                
                
            }, to: APIEndpoint.createBuyerProfile,method: .post,headers: headers)
            { (result) in
            
                switch result
                {
                case .success(let upload,_, _):
                    
                    upload.uploadProgress(closure:
                        { (Progress) in
                            print("Upload Progress: \(Progress.fractionCompleted)")
                    })
                    upload.responseJSON
                        { response in
                        APIManager.hideLoader()
                            if let JSONh = response.result.value
                            {
                                print("******api all sucessfully")
                                let data = JSON.init(JSONh)
                                
                                if data["status"].intValue == 0 || data["status"].intValue == 2 || data["status"].intValue == 3 || data["status"].intValue == 4 || data["status"].intValue == 5{
                                    self.showAlertMessage(messageStr: data["message"].stringValue)
                                    { (okbtn) in
                                      //  self.openScanner()
                                        self.captureSession.startRunning()
                                    }
                                }
                                else if data["status"].intValue == 1
                                {
                                    self.showAlertMessage(messageStr: data["message"].stringValue) { (donebtnclicked) in
                                        mybool = false
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
            }
        })

    }

    
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
    
    
    // MARK: - Helper methods
    func showAlert(){
        if presentedViewController != nil{
            return
        }
        let alertPrompt = UIAlertController(title: APP_NAME, message:"Qr code not valid." , preferredStyle: UIAlertController.Style.alert)
        let confirmAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action) -> Void in
            //self.openScanner()
            self.captureSession.startRunning()
            self.navigationController?.popViewController(animated: false)
        })
        alertPrompt.addAction(confirmAction)
        present(alertPrompt, animated: true, completion: nil)
    }
    
    private func updatePreviewLayer(layer: AVCaptureConnection, orientation: AVCaptureVideoOrientation){
        layer.videoOrientation = orientation
        videoPreviewLayer?.frame = self.view.bounds
    }
    
    //MARK:- btn Click
    @IBAction func btnMailClick(_ sender: UIButton) {
        self.dismiss(animated: true) {
             print("QRScanner dimiss")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
 
    
}

//MARK:- EXTENSION

extension QRScannerController: AVCaptureMetadataOutputObjectsDelegate{
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection){
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if supportedCodeTypes.contains(metadataObj.type){
            // If the found metadata is equal to the QR code metadata (or barcode) then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil{
//                if metadataObj.stringValue == barCodeKey{
                    print("Success Print")
                captureSession.stopRunning()
                let str = metadataObj.stringValue ?? ""
                self.checkBaseString(str : str)
//                let popupalert = UIAlertController(title: APP_NAME, message: "QR Code successfully scanned.", preferredStyle: .alert)
//                let Ok = UIAlertAction(title: "Ok", style: .cancel) { (btnOkAction) in
//                    self.navigationController?.popViewController(animated: true)
//                }
//                popupalert.addAction(Ok)
//                self.present(popupalert, animated: true, completion: nil)
//                    self.dismiss(animated: true) {
//                        if (self.isScanned == false){
//                            self.isScanned = true
                           // NotificationCenter.default.post(name: Notification.Name(userKey.scanner), object: nil)
//                self.navigationController?.popViewController(animated: true)
                        }
                        else {
                            self.showAlert()
                        }
                    }
//                }
//                else{
//                    print("Un-Success Print")
//                    self.showAlert(decodedURL: "")
//                }
            }
    }
  
