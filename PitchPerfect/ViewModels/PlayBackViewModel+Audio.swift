//
//  PlayBackViewModel+Audio.swift
//  PitchPerfect
//
//  Created by Woraphot Chokratanasombat on 5/6/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation
import AVFoundation

extension PlayBackViewModel {
    func prepareAudio() {
        do {
            audioFile = try AVAudioFile(forReading: soundUrl)
        } catch {
            
        }
    }
    
    func setEffect() {
        
    }
    
    func playAudio(rate: Float? = nil, pitch: Float? = nil, reverb: Bool = false, echo: Bool = false) {
        audioEngine = AVAudioEngine()
        audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attach(audioPlayerNode)
        
        let changePitchRate = AVAudioUnitTimePitch()
        if let pitch = pitch {
            changePitchRate.pitch = pitch
        }
        
        if let rate = rate {
            changePitchRate.rate = rate
        }
        audioEngine.attach(changePitchRate)
        
        let changeEcho = AVAudioUnitDistortion()
        changeEcho.loadFactoryPreset(.multiEcho1)
        audioEngine.attach(changeEcho)
        
        let changeReverb = AVAudioUnitReverb()
        changeReverb.loadFactoryPreset(.cathedral)
        changeReverb.wetDryMix = 50
        audioEngine.attach(changeReverb)
        
        if echo && reverb {
            connectAudioNodes(audioPlayerNode, changePitchRate, changeEcho, changeReverb, audioEngine.outputNode)
        } else if echo {
            connectAudioNodes(audioPlayerNode, changePitchRate, changeEcho, audioEngine.outputNode)
        } else if reverb {
            connectAudioNodes(audioPlayerNode, changePitchRate, changeEcho, audioEngine.outputNode)
        } else {
            connectAudioNodes(audioPlayerNode, changePitchRate, audioEngine.outputNode)
        }
        
        audioPlayerNode.stop()
        audioPlayerNode.scheduleFile(audioFile, at: nil) {
            var delay: Double = 0
            if let lastRenderTime = self.audioPlayerNode.lastRenderTime, let playerTime = self.audioPlayerNode.playerTime(forNodeTime: lastRenderTime) {
                if let rate = rate {
                    delay = Double(self.audioFile.length - playerTime.sampleTime) / self.audioFile.processingFormat.sampleRate / Double(rate)
                } else {
                    delay = Double(self.audioFile.length - playerTime.sampleTime) / self.audioFile.processingFormat.sampleRate
                }
                
                self.stopTimer = Timer(timeInterval: delay, target: self, selector: #selector(PlayBackViewModel.stopAudio), userInfo: nil, repeats: false)
                RunLoop.main.add(self.stopTimer, forMode: RunLoopMode.defaultRunLoopMode)
            }
        }
        
        do {
            try audioEngine.start()
        } catch {
            return
        }
        
        audioPlayerNode.play()
    }
    
    @objc func stopAudio() {
        isPlaying = false
        if let audioPlayerNode = audioPlayerNode {
            audioPlayerNode.stop()
        }
        
        if let stopTimer = stopTimer {
            stopTimer.invalidate()
        }
        
        if let audioEngine = audioEngine {
            audioEngine.stop()
            audioEngine.reset()
        }
    }
    
    func connectAudioNodes(_ nodes: AVAudioNode...) {
        for i in 0 ..< nodes.count - 1 {
            audioEngine.connect(nodes[i], to: nodes[i + 1], format: audioFile.processingFormat)
        }
    }
}