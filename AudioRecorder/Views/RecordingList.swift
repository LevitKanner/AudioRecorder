//
//  RecordingList.swift
//  AudioRecorder
//
//  Created by Levit Kanner on 13/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct RecordingList: View {
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        List{
            ForEach(self.audioRecorder.recordings , id: \.createdAt){ recording in
                RecordingRow(audioURL: recording.fileURL)  
            }
            .onDelete(perform: delete)
        }
    }
    
    func delete(at offsets: IndexSet) {
        
        var urlsToDelete = [URL]()
        for index in offsets {
            urlsToDelete.append(audioRecorder.recordings[index].fileURL)
        }

        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
    }
}

struct RecordingList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingList(audioRecorder: AudioRecorder())
    }
}
