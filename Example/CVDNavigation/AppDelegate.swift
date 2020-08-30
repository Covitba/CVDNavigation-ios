//
//  AppDelegate.swift
//  CVDNavigation
//
//  Created by Covitba on 08/29/2020.
//  Copyright (c) 2020 Covitba. All rights reserved.
//

import UIKit
import CVDNavigation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Register deeplink
        let deeplink = CVDNavigationDeeplink(urlPath: "/main", viewController: ViewControllerB.self)
        let hostManager = CVDNavigationHostManager()
        hostManager.registerDeeplink(deeplink)

        CVDNavigationRouter.shared.register(hostManager: hostManager, forHost: "home")

//        let url = URL(string: "cvd://newInteraction/succes?userId=10&id=20")
//
//        CVDNavigationRouter.shared.getViewController(for: url!)

        return true
    }

}
