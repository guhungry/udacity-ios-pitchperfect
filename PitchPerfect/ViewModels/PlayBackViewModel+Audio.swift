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
    // MARK: Audio Playback Functions
    func prepareAudio() {
        do {
            audioFile = try AVAudioFile(forReading: soundUrl)
        } catch {
            
        }
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

        var nodes: [AVAudioNode] = [audioPlayerNode, changePitchRate]
        if echo { nodes.append(changeEcho) }
        if reverb { nodes.append(changeReverb) }
        nodes.append(audioEngine.outputNode)

        connectAudioNodes(nodes)
        
        audioPlayerNode.stop()
        audioPlayerNode.scheduleFile(audioFile, at: nil) {
            if let lastRenderTime = self.lastRenderTime(), let playerTime = self.playerTime(lastRenderTime) {
                var delay = Double(self.fileLength() - playerTime.sampleTime) / self.sampleRate()
                if let rate = rate {
                    delay /= Double(rate)
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

    func connectAudioNodes(_ nodes: [AVAudioNode]) {
        for i in 0 ..< nodes.count - 1 {
            audioEngine.connect(nodes[i], to: nodes[i + 1], format: audioFile.processingFormat)
        }
    }

    func connectAudioNodes(_ nodes: AVAudioNode...) {
        connectAudioNodes(nodes)
    }

    // MARK: Audio File Information Functions
    func lastRenderTime() -> AVAudioTime? {
        return audioPlayerNode.lastRenderTime
    }

    func playerTime(_ lastRenderTime: AVAudioTime) -> AVAudioTime? {
        return audioPlayerNode.playerTime(forNodeTime: lastRenderTime)
    }

    func fileLength() -> AVAudioFramePosition {
        return audioFile.length
    }

    func sampleRate() -> Double {
        return audioFile.processingFormat.sampleRate
    }
}
