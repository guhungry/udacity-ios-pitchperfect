//
//  RecordViewModel.swift
//  PitchPerfect
//
//  Created by Woraphot Chokratanasombat on 5/6/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

class RecordViewModel: NSObject {
    public var isRecording: Bool = false
    
    func recordingLabel() -> String {
        return isRecording ?  "Recording in progress" : "Tap to Record"
    }
    
    func recordButtonEnabled() -> Bool {
        return !isRecording
    }
    
    func stopButtonEnabled() -> Bool {
        return isRecording
    }
}
