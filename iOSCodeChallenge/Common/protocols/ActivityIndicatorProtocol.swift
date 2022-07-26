//
//  ActivityIndicatorProtocol.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 26/07/2022.
//

import Foundation
import UIKit

protocol ActivityIndicatorProtocol {
    var activityIndicator: UIActivityIndicatorView { get }
    
    func showActivityIndicator()
    func hideActivityIndicator()
}
