//
//  PlayViewControllerMock.swift
//  PitchPerfectTests
//
//  Created by Woraphot Chokratanasombat on 7/6/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

@testable import PitchPerfect

class PlayViewControllerMock : PlayViewControllerProtocol {
    var updateViewCallCount = 0
    
    func updateView() {
        updateViewCallCount += 1
    }
}
