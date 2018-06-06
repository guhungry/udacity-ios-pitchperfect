//
//  PlayBackViewModel.swift
//  PitchPerfect
//
//  Created by Woraphot Chokratanasombat on 5/6/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import UIKit
import AVFoundation

class PlayBackViewModel: NSObject, AVAudioPlayerDelegate {
    public enum AudioEffect: Int { case slow = 0, fast, highPitch, lowPitch, echo, reverb }
    public var isPlaying: Bool = false
    public var soundUrl: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    init(soundUrl: URL) {
        self.soundUrl = soundUrl
    }
    
    func playSound(effect: AudioEffect) {
        isPlaying = true
        switch (effect) {
            case .slow:
                playAudio(rate: 0.5)
            case .fast:
                playAudio(rate:1.5)
            case .highPitch:
                playAudio(pitch: 1000)
            case .lowPitch:
                playAudio(pitch: -1000)
            case .echo:
                playAudio(echo: true)
            case .reverb:
                playAudio(reverb: true)
        }
    }
    
    func stopButtonEnabled() -> Bool {
        return isPlaying
    }
}
