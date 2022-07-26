//
//  DateFormatter+Extensions.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 25/07/2022.
//

import UIKit

extension Date {
    func dayMontYY() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, yyyy"
        return "\(dateFormatter.string(from: self))"
    }
}
