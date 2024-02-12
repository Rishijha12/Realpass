//
//  SceneDelegate.swift
//  realpass
//
//  Created by patel chandan on 23/03/21.
//  Copyright © 2021 patel chandan. All rights reserved.
//

import UIKit
import SwiftyJSON

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        (UIApplication.shared.delegate as? AppDelegate)?.self.window = window
        guard let _ = (scene as? UIWindowScene) else { return }
        self.nextVC()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    //MARK:- Support Method
    func nextVC() {
        
        if UserDefaults.standard.bool(forKey: "isUserLogin") == true
        {
            

            if isKeyPresentInUserDefaults(key: Keys.agentId)
            {
                agentId = UserDefaults.standard.object(forKey: Keys.agentId) as! Int
            }
            if isKeyPresentInUserDefaults(key: Keys.buyerId)
            {
                buyerId = UserDefaults.standard.object(forKey: Keys.buyerId) as! Int
            }
            
            if isKeyPresentInUserDefaults(key: Keys.userType)
            {
                userType = UserDefaults.standard.object(forKey: Keys.userType) as! Int
            }
        
            if isKeyPresentInUserDefaults(key: Keys.currentUserData) 
            {
                let dict =  UserDefaults.standard.object(forKey: Keys.currentUserData) as? [String:Any]
                currentUser = UserDataModel.init(dictionary: dict! as NSDictionary)!
//                APIToken = currentUser.accessToken ?? ""
                APIToken = UserDefaults.standard.object(forKey: Keys.accessToken) as! String
            }
            
            // get dict from user defauklt
            
            if UserDefaults.standard.object(forKey: Keys.userType) as! Int == 1
            {
                if UserDefaults.standard.bool(forKey: Keys.isProfileSetUp) == false
                {
                    let mainStoryboard:UIStoryboard = UIStoryboard(name: "Agent", bundle: nil)
                    let navController: UINavigationController =  mainStoryboard.instantiateViewController(withIdentifier: "profileNavigation") as! UINavigationController
                    self.window?.rootViewController = navController
                }
                else
                {
                    let mainStoryboard:UIStoryboard = UIStoryboard(name: "Agent", bundle: nil)
                    let navController: UINavigationController =  mainStoryboard.instantiateViewController(withIdentifier: "homeNav") as! UINavigationController
                    self.window?.rootViewController = navController
                    
                }
            }
            else
            {
               // buyer code
                print("This is buyer ")
                
                if UserDefaults.standard.bool(forKey: Keys.isProfileSetUp) == false
                {
                    let mainStoryboard:UIStoryboard = UIStoryboard(name: "Buyer", bundle: nil)
                    let navController: UINavigationController =  mainStoryboard.instantiateViewController(withIdentifier: "BuyerNav") as! UINavigationController
                    self.window?.rootViewController = navController
                }
                else
                {
                    let mainStoryboard:UIStoryboard = UIStoryboard(name: "Buyer", bundle: nil)
                    let navController: UINavigationController =  mainStoryboard.instantiateViewController(withIdentifier: "BuyerHomeNav") as! UINavigationController
//                    let homePage = mainStoryboard.instantiateViewController(withIdentifier: "BuyerHomeVc") as! BuyerHomeVc
                    self.window?.makeKeyAndVisible()
                    self.window?.rootViewController = navController
                    
                }
            }
            
            
            
        }
            
        }
    
}


