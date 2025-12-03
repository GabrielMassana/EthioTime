//
//  AppDelegate.swift
//  EthioTime
//
//  Migrated to Swift with modern patterns
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Create window
        window = UIWindow(frame: UIScreen.main.bounds)

        // Set root view controller
        let viewController = ViewController()
        window?.rootViewController = viewController

        // Make window visible
        window?.makeKeyAndVisible()

        return true
    }
}
