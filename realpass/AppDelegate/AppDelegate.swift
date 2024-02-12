//
//  AppDelegate.swift
//  realpass
//
//  Created by patel chandan on 23/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import GooglePlaces
import Firebase
import FirebaseMessaging
import SafariServices

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MessagingDelegate {

    var window: UIWindow?
    
    fileprivate var _deviceToken: String = ""
        var deviceToken: String
        {
            get
            {
                if _deviceToken.textlength == 0
                {
                    return "\(Int(Date().timeIntervalSince1970))" //"2ceac78adbfc5161d12c5da2fd764d2a541c6aab38bea2ba8bb1da8a9dc35e68"
                }
                return _deviceToken;
            }
        }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        sleep(2)
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        GMSPlacesClient.provideAPIKey(GoogleKey.googleAPIKey)
        
        self.nextVC()
        
        Messaging.messaging().delegate = self
        self.registerForPushNotification()
        
        return true
    }
    
    func nextVC() {
        if UserDefaults.standard.bool(forKey: "isUserLogin") == true
        {
            if isKeyPresentInUserDefaults(key: Keys.currentUserData)
            {
                let dict =  UserDefaults.standard.object(forKey: Keys.currentUserData) as? [String:Any]
                currentUser = UserDataModel.init(dictionary: dict! as NSDictionary)!
            }
            
            if UserDefaults.standard.bool(forKey: Keys.isProfileSetUp) == false
            {
                let mainStoryboard:UIStoryboard = UIStoryboard(name: "Agent", bundle: nil)
                let navController: UINavigationController =  mainStoryboard.instantiateViewController(withIdentifier: "profileNavigation") as! UINavigationController
                self.window?.rootViewController = navController
            }
            else
            {
//                currentUser = UserDefaults.standard.object(forKey: Keys.currentUserData) as! UserDataModel
                
                let mainStoryboard:UIStoryboard = UIStoryboard(name: "Agent", bundle: nil)
                let homePage = mainStoryboard.instantiateViewController(withIdentifier: "AgentHomeVc") as! AgentHomeVc
                self.window?.rootViewController = homePage
            }
            
        }
    }
    
    //MARK:- -------- FCM --------
        
        func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
                let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
                Messaging.messaging().apnsToken = deviceToken as Data
                print("Apple device token: \(deviceTokenString)")
            }

            // remove static FCMTOKEN later when using in device...
            func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//                setUserDefaultsValue(value: "Failed to get token", key: Keys.FCMToken)
                //Messaging.messaging().apnsToken = deviceToken as Data
                NSLog("Failed to get Apple device token \(error)")
            }
            
            //MARK:- MessagingDelegate
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?)
    {
    
        print("Firebase registration token: \(fcmToken!)")
        var token = ""
        if fcmToken == ""
        {
            token = "realpass"
        }
        else
        {
            token = fcmToken ?? "realpass"
        }
        print("TOKEN : \(token)")
        UserDefaults.standard.set(token, forKey: Keys.FCMToken)
    }




}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("123")
        completionHandler([.alert, .sound])
        
        let dictNotificaitonPayload = notification.request.content.userInfo as NSDictionary
        
        print("Notification Payload : \(dictNotificaitonPayload)")
        let msg = dictNotificaitonPayload["body"] as? String
        let state = UIApplication.shared.applicationState
        print("state = \(state)")
        if state == .active
        {
            // when aplication open than show tha notification
            //show alert and ok button clicke moved on the login screen
            //user selection screen
            
            let alert = UIAlertController(title: APP_NAME, message: msg, preferredStyle: .alert)
            let Yes = UIAlertAction(title: "Ok", style: .destructive)
            { (btnOkAction) in
                
//                self.LogoutApi()
                
                UserDefaults.standard.removeObject(forKey: Keys.userType)
                UserDefaults.standard.removeObject(forKey: Keys.accessToken)
                UserDefaults.standard.removeObject(forKey: Keys.isProfileSetUp)
                UserDefaults.standard.removeObject(forKey: Keys.agentId)
                UserDefaults.standard.removeObject(forKey: Keys.currentUserData)
                UserDefaults.standard.removeObject(forKey: "isUserLogin")
                UserDefaults.standard.removeObject(forKey: Keys.password)
               
                
                
                let mainStoryboard:UIStoryboard = UIStoryboard(name: "PreLogin", bundle: nil)
                let navController: UINavigationController =  mainStoryboard.instantiateViewController(withIdentifier: "userSelection") as! UINavigationController
                self.window?.rootViewController = navController
                
            }
            alert.addAction(Yes)
            let topVC = window?.rootViewController
            topVC?.present(alert, animated: true, completion: nil)
            
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if let dict = response.notification.request.content.userInfo as? [String: Any], !dict.isEmpty {
            print("Notification Payload : \(dict)")
            self.performActionOfnotificaiton(dict as NSDictionary)
            // when app not open
            //redirect login screen
            //user selection screen
            
            
            UserDefaults.standard.removeObject(forKey: Keys.userType)
            UserDefaults.standard.removeObject(forKey: Keys.accessToken)
            UserDefaults.standard.removeObject(forKey: Keys.isProfileSetUp)
            UserDefaults.standard.removeObject(forKey: Keys.agentId)
            UserDefaults.standard.removeObject(forKey: Keys.currentUserData)
            UserDefaults.standard.removeObject(forKey: "isUserLogin")
            UserDefaults.standard.removeObject(forKey: Keys.password)
            
            
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "PreLogin", bundle: nil)
            let navController: UINavigationController =  mainStoryboard.instantiateViewController(withIdentifier: "userSelection") as! UINavigationController
            self.window?.rootViewController = navController
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        print("didReceive", notification ?? "Nope")
    }
}


extension AppDelegate
{
    func registerForPushNotification() {
          UNUserNotificationCenter.current().delegate = self
          UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert], completionHandler: {(granted, error) in
              if (granted) {
                  DispatchQueue.main.async {
                      UIApplication.shared.registerForRemoteNotifications()
                  }
              } else {
                  //Do stuff if unsuccessful...
                  let alertController = UIAlertController(title:APP_NAME, message: "We highly recommend enabling notification from settings so you won't miss any notification from realPass.", preferredStyle: .alert)
                  let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
                      guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                          return
                      }
                      if UIApplication.shared.canOpenURL(settingsUrl) {
                          UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                          })
                      }
                  }
                  let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                  alertController.addAction(cancelAction)
                  alertController.addAction(settingsAction)
                  DispatchQueue.main.async {
                      self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
                  }
              }
          })
      }
    
    func performActionOfnotificaiton(_ userinfo: NSDictionary)
    {
//        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
//        homeVC.isfromNotification = true
//        let navigationController = UINavigationController(rootViewController: homeVC)
//        self.window?.rootViewController = navigationController
    }
}

