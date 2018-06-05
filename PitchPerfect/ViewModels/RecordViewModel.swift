//
//  RecordViewModel.swift
//  PitchPerfect
//
//  Created by Woraphot Chokratanasombat on 5/6/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation
import AVFoundation

class RecordViewModel: NSObject, AVAudioRecorderDelegate {
    public var isRecording: Bool = false
    private var audioRecorder: AVAudioRecorder!
    
    func recordingLabel() -> String {
        return isRecording ?  "Recording in progress" : "Tap to Record"
    }
    
    func recordButtonEnabled() -> Bool {
        return !isRecording
    }
    
    func stopButtonEnabled() -> Bool {
        return isRecording
    }
    
    func startRecordAudio() {
        if (isRecording) { return }
        
        isRecording = true
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func stopRecordAudio() {
        isRecording = false
        
        audioRecorder.stop()
        let session = AVAudioSession.sharedInstance()
        try! session.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if (flag) {
            print("Record Success")
            // performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("Recording Failed")
        }
    }
}
