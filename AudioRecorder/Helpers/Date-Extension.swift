//
//  Date-Extension.swift
//  AudioRecorder
//
//  Created by Levit Kanner on 13/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

extension Date {
    func toString(dateFormat format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
