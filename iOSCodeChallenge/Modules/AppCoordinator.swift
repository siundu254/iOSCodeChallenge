//
//  AppCoordinator.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 24/07/2022.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    override func start() {
        let vc = HomeViewController()
        vc.didSelectRow = openDetailView
        vc.presentErrorAlert = displayErrorAlert
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func openDetailView(_ nasa: NasaDataModel) {
        let vc = DetailViewController()
        vc.nasa = nasa
        push(viewController: vc)
    }
    
    private func displayErrorAlert(_ error: String) {
        let alert = UIAlertController(
            title: "That didn't work",
            message: error,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "Retry",
            style: .default,
            handler: { _ in
                alert.dismiss(animated: false)
            }
        ))
        present(viewController: alert, completion: nil)
    }
}
