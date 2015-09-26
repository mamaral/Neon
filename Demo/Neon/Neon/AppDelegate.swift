//
//  AppDelegate.swift
//  Neon
//
//  Created by Mike on 9/16/15.
//  Copyright © 2015 Mike Amaral. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()

        UINavigationBar.appearance().barTintColor = UIColor(red: 80/255.0, green: 108/255.0, blue: 163/255.0, alpha: 1.0)
        UINavigationBar.appearance().translucent = false

        self.window?.rootViewController = UINavigationController(rootViewController: TwitterProfileExampleViewController())
        self.window?.makeKeyAndVisible()
        return true
    }
}
