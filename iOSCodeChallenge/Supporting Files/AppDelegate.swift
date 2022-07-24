//
//  AppDelegate.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 24/07/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupCoordinator(application)
        return true
    }
    
    private func setupCoordinator(_ application: UIApplication) {
        var window = application.windows.first(where: { $0.isKeyWindow })
        window?.resignKey()
        
        let navC = BaseNavigationController()
        coordinator = AppCoordinator(navigationController: navC, completion: nil)
        coordinator?.start()
        
        window = nil
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navC
        window?.makeKeyAndVisible()
        
        self.window = window
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
}

