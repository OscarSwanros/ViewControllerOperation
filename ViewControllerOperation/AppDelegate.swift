//
//  AppDelegate.swift
//  ViewControllerOperation
//
//  Created by Swanros on 1/4/16.
//  Copyright © 2016 Pacific3. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = .whiteColor()
        
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
}
