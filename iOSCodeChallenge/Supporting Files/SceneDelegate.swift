//
//  SceneDelegate.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 24/07/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _scene = (scene as? UIWindowScene) else { return }
        setupSceneDelegate(_scene)
    }
    
    private func setupSceneDelegate(_ scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        let navC = BaseNavigationController()
        
        coordinator = AppCoordinator(navigationController: navC, completion: nil)
        coordinator?.start()
        
        window?.rootViewController = navC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

