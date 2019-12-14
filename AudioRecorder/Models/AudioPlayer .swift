//
//  AudioPlayer .swift
//  AudioRecorder
//
//  Created by Levit Kanner on 14/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class AudioPlayer: ObservableObject{
    
    let objectWillChange = PassthroughSubject<AudioPlayer , Never>()
    
    var isPlaying = false{
        didset{
            objectWillChange.send()
        }
    }
}
