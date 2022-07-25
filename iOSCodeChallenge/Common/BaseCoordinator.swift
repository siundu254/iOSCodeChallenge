//
//  BaseCoordinator.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 24/07/2022.
//

import UIKit

class BaseCoordinator: NSObject {
    
    var completion: () -> Void = { }
    weak var parentCoordinator: BaseCoordinator?
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?, completion: (() -> Void)?) {
        self.navigationController = navigationController
        
        if let completion = completion {
            self.completion = completion
        }
    }
    
    func start() { }
    
    func push(viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    func finishWorkflow() {
        completion()
    }
    
}
