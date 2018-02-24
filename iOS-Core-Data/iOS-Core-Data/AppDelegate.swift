//
//  AppDelegate.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 2/24/18.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let companiesController = CompaniesController()
        let navController = CustomNavigationController(rootViewController: companiesController)
        window?.rootViewController = navController
        setNavigationStyle()
        return true
    }
    
    func setNavigationStyle() {
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .lightRed
        UINavigationBar.appearance().prefersLargeTitles = true
        let properties = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = properties
        UINavigationBar.appearance().largeTitleTextAttributes = properties
        UINavigationBar.appearance().isTranslucent = false
    }

    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
}

