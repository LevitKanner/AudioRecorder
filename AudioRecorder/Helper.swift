//
//  Helper.swift
//  AudioRecorder
//
//  Created by Levit Kanner on 14/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

func getCreationDate(for file: URL) -> Date {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
        let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
        return creationDate
    } else {
        return Date()
    }
}
