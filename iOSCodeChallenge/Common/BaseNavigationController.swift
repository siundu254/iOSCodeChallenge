//
//  BaseNavigationController.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 24/07/2022.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        removeBackButtonTitle(for: viewController)
        super.pushViewController(viewController, animated: animated)
    }

    private func removeBackButtonTitle(for viewController: UIViewController) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
    }
}
