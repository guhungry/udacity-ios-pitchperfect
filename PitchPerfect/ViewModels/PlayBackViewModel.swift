//
//  PlayBackViewModel.swift
//  PitchPerfect
//
//  Created by Woraphot Chokratanasombat on 5/6/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import UIKit

class PlayBackViewModel: NSObject {
    public var soundUrl: URL!
    
    init(soundUrl: URL) {
        self.soundUrl = soundUrl
    }
}
