//
//  PlayViewControllerMock.swift
//  PitchPerfectTests
//
//  Created by Woraphot Chokratanasombat on 7/6/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

@testable import PitchPerfect

class RecordViewControllerMock : RecordViewControllerProtocol {
    var updateViewCallCount: Int = 0
    func updateView() {
        updateViewCallCount += 1
    }
    
    func onSaveSuccess(_ url: URL) {
    }
}
