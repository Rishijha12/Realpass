//
//  Permission.swift
//  basicStructureMVC
//
//  Created by i-Phone7 on 29/08/19.
//  Copyright © 2019 i-Phone7. All rights reserved.
//

import Foundation
import CoreLocation
import AVFoundation
import UIKit
import CoreBluetooth
import Contacts

//MARK:- cameraPermission
func checkForCameraPermission(permissionGranted: @escaping (_ permission: Bool) -> Void) -> Void
{
    if AVCaptureDevice.authorizationStatus(for: .video) == .authorized
    {
        permissionGranted(true)
    }
    else
    {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted) in
            permissionGranted(granted)
        })
    }
}

//MARK:- microphonePermission
func checkForMicrophonePermission(permissionGranted: @escaping (_ permission: Bool) -> Void) -> Void
{
    if AVAudioSession.sharedInstance().recordPermission == .granted {
        permissionGranted(true)
    } else {
        AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
            permissionGranted(granted)
        })
    }
}

//MARK:- ContactPermission
func requestForAccess(completionHandler: @escaping (_ accessGranted: Bool) -> Void)
{
    switch CNContactStore.authorizationStatus(for: .contacts){
    case .authorized:
        completionHandler(true)
        
    case .denied, .notDetermined:
        let store = CNContactStore()
        store.requestAccess(for: CNEntityType.contacts, completionHandler: { (access, accessError) -> Void in
            if access {
                completionHandler(access)
            }
            else {
                if CNContactStore.authorizationStatus(for: .contacts) == CNAuthorizationStatus.denied {
                }
            }
        })
    default:
        completionHandler(false)
    }
}

//MARK:- locationPermission
func checkForLocationPermission(permissionGranted: @escaping (_ permission: Bool) -> Void)
{
    if CLLocationManager.locationServicesEnabled()
    {
        switch CLLocationManager.authorizationStatus()
        {
        case .restricted, .denied:
            permissionGranted(false)
        case .authorizedAlways, .authorizedWhenInUse:
            permissionGranted(true)
        case .notDetermined:
            permissionGranted(false)
        default:
            break
        }
    }
    else
    {
        permissionGranted(false)
    }
}

//MARK:- alertMssg
func cameraPermissionAlert(from:UIViewController, showCancel: Bool) {
    let alert = UIAlertController(title: showCancel ? Messages.audioTitleMssg : Messages.cameraTitleMssg, message:showCancel ? Messages.audioPermissionMssg: Messages.cameraPermissionMssg , preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: Messages.setting, style: .default, handler: { (action) in
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }))
    if showCancel {
        alert.addAction(UIAlertAction(title: Messages.NotNow, style: .default, handler: nil))
    }
    from.present(alert, animated: true, completion: nil)
}
