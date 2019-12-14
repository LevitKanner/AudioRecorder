//
//  RecordingRow.swift
//  AudioRecorder
//
//  Created by Levit Kanner on 14/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct RecordingRow: View {
    var audioURL: URL
    var body: some View {
        HStack{
            Text("\(audioURL.lastPathComponent)")
            Spacer()
        }
    }
}

