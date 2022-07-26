//
//  BaseViewController.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 25/07/2022.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newNavBarAppearance = customNavBarAppearance()
        navigationController?.navigationBar.scrollEdgeAppearance = newNavBarAppearance
        navigationController?.navigationBar.compactAppearance = newNavBarAppearance
        navigationController?.navigationBar.standardAppearance = newNavBarAppearance
    }
    
    @available(iOS 13.0, *)
    func customNavBarAppearance() -> UINavigationBarAppearance {
        let customNavBarAppearance = UINavigationBarAppearance()
        
        // Apply a red background.
        customNavBarAppearance.configureWithOpaqueBackground()
        customNavBarAppearance.backgroundColor = UIColor(hex: "#F9F9F9F0")
        
        // Apply white colored normal and large titles.
        customNavBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(hex: "#151515") ?? UIColor.black]
        customNavBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(hex: "#151515") ?? UIColor.black]
        
        return customNavBarAppearance
    }
}
