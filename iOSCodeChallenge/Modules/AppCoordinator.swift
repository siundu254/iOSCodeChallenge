//
//  AppCoordinator.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 24/07/2022.
//

import Foundation

class AppCoordinator: BaseCoordinator {
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
