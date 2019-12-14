//
//  RecordingDataModel.swift
//  AudioRecorder
//
//  Created by Levit Kanner on 14/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

struct Recording : Comparable{
    static func < (lhs: Recording, rhs: Recording) -> Bool {
        lhs.createdAt < rhs.createdAt
    }
    
    let fileURL: URL
    let createdAt: Date 
}
