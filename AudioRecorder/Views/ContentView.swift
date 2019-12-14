//
//  ContentView.swift
//  AudioRecorder
//
//  Created by Levit Kanner on 13/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        NavigationView{
            VStack{
                RecordingList(audioRecorder: audioRecorder)
                
                
                if audioRecorder.recording == false {
                    Button(action:{
                        self.audioRecorder.startRecording()
                    }){
                        Image(systemName: "circle.fill")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(.red)
                            .frame(width: 100 , height: 100)
                            .clipped()
                            .overlay(Circle().stroke(Color.black , lineWidth: 4))
                            .padding(.bottom , 20)
                    }
                }else {
                    Button(action:{
                        self.audioRecorder.stopRecording()
                    }){
                        Image(systemName: "stop.circle")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.red)
                            .frame(width: 100 , height: 100)
                            .clipped()
                            .overlay(Circle().stroke(Color.black , lineWidth: 4))
                            .padding(.bottom , 20)
                    }
                }
            }
            .navigationBarTitle("AudioRecorder" , displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
    }
}
