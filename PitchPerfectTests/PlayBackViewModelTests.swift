//
//  PlayBackViewModelTests.swift
//  PitchPerfectTests
//
//  Created by Woraphot Chokratanasombat on 7/6/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import XCTest
import Hamcrest

@testable import PitchPerfect

class PlayBackViewModelTests: XCTestCase {
    private var sut: PlayBackViewModel!
    private var view: PlayViewControllerMock!
    
    override func setUp() {
        super.setUp()
        
        view = PlayViewControllerMock()
        sut = PlayBackViewModel(soundUrl: URL(string: "https://guhungry.com")!)
        sut.view = view
    }
    
    override func tearDown() {
        sut.view = nil
        sut = nil
        view = nil
        
        super.tearDown()
    }
    
    func testViewViewUpdate_ShouldBeCalled_WhenIsPlayingIsChanged() {
        assertThat(view.updateViewCallCount, equalTo(0))
        sut.isPlaying = true
        assertThat(view.updateViewCallCount, equalTo(1))
        sut.isPlaying = false
        assertThat(view.updateViewCallCount, equalTo(2))
        sut.isPlaying = false
        assertThat(view.updateViewCallCount, equalTo(2))
    }
}
