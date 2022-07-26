//
//  ActivityIndicatorProtocol+Extensions.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 26/07/2022.
//

import Foundation
import UIKit

fileprivate var activityView: UIView?

extension ActivityIndicatorProtocol where Self: UIViewController {
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            activityView = UIView(frame: self.view.bounds)
            activityView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
            
            self.activityIndicator.style = .large
            self.activityIndicator.center = activityView!.center
            self.activityIndicator.startAnimating()
            
            activityView?.addSubview(self.activityIndicator)
            self.view.addSubview(activityView!)
            
            
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            activityView?.removeFromSuperview()
            activityView = nil
        }
    }
}
