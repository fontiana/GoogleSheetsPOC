//
//  AppDelegate.swift
//  GoogleSheetsPOC
//
//  Created by Victor Oliveira on 01/12/17.
//  Copyright © 2017 Fonts. All rights reserved.
//

import UIKit
import Google
import GoogleSignIn
import SwiftyBeaver

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let log = SwiftyBeaver.self
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss$d $L $M"
        log.addDestination(console)
        return true
    }
    
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: sourceApplication,
                                                 annotation: annotation)
    }
    
    static func shared() -> AppDelegate {
        return (UIApplication.shared.delegate as? AppDelegate)!
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplicationOpenURLOptionsKey: Any]) -> Bool {
        let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String
        let annotation = options[UIApplicationOpenURLOptionsKey.annotation]
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: sourceApplication,
                                                 annotation: annotation)
    }
}
