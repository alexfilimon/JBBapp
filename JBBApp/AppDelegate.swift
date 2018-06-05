//
//  AppDelegate.swift
//  JBBApp
//
//  Created by Александр Филимонов on 23.05.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // сслыка на tabBar


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
//        let schemeVC = SchemeController()
//        schemeVC.scheme = curScheme
//
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.rootViewController = schemeVC
//        self.window?.makeKeyAndVisible()
        
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Scheme", bundle: nil)
//        let homePage = mainStoryboard.instantiateViewController(withIdentifier: "SchemeController") as! SchemeController
//        homePage.scheme = curScheme
//        self.window?.rootViewController = homePage
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        do {
            let contentStr = try String(contentsOf: url)
            
            // проверить что url наш на всякий случай
            
            let parser = JBBParser(str: contentStr)
            let curScheme = Scheme(name: parser.name ?? "no name", colors: parser.colors, rows: parser.rows)
            
            // selectViewController
            // popToRoot
            // push
            
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Scheme", bundle: nil)
            let homePage = mainStoryboard.instantiateViewController(withIdentifier: "SchemeController") as! SchemeController
            homePage.scheme = curScheme
            self.window?.rootViewController = homePage
            

//
//            let schemeVC = SchemeController()
//            schemeVC.scheme = curScheme
//
//            self.window = UIWindow(frame: UIScreen.main.bounds)
//            self.window?.rootViewController = schemeVC
//            self.window?.makeKeyAndVisible()
            
            // DrawRectangle
        }
        catch _ {
            print("ERROR OPENING FILE")
        }
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

