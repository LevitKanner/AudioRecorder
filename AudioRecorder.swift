//
//  AudioRecorder.swift
//  AudioRecorder
//
//  Created by Levit Kanner on 13/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation
import Combine
import AVFoundation

class AudioRecorder:  NSObject , ObservableObject{
    let objectWillChange = PassthroughSubject<AudioRecorder , Never>()
    
    var audioRecorder: AVAudioRecorder!
    
    var recordings = [Recording]()
    
    var recording = false {
        didSet{
            objectWillChange.send(self)
        }
    }
    
    
    override init() {
        super.init()
        fetchRecordings()
    }
    
    
    func startRecording(){
        let recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        }catch{
            debugPrint(error)
        }
        
        let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let audioFilePath = filePath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilePath, settings: settings)
            audioRecorder.record()
            recording = true
        }catch{
            debugPrint(error)
        }
    }
    
    
    
    
    func stopRecording(){
        audioRecorder.stop()
        recording = false
        fetchRecordings()
    }
    
    
    func fetchRecordings(){
        recordings.removeAll()
        let fileManager = FileManager.default
        let filePath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContent = try! fileManager.contentsOfDirectory(at: filePath, includingPropertiesForKeys: nil)
        
        for audio in directoryContent{
            let recording = Recording(fileURL: audio, createdAt: getCreationDate(for: audio))
            recordings.append(recording)
        }
        recordings.sort()
        objectWillChange.send(self)
    
    }
}
