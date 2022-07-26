//
//  DateFormatter+Extensions.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 25/07/2022.
//

import UIKit

extension Date {
    func toString(_ date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "dd MMM, yyyy"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let date: Date? = dateFormatter.date(from: date)
        return formatter.string(from: date!)
    }
}
