//
//  RecordViewModelTests.swift
//  PitchPerfectTests
//
//  Created by Woraphot Chokratanasombat on 5/6/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import XCTest
import Hamcrest

@testable import PitchPerfect

class RecordViewModelTests: XCTestCase {
    private var sut: RecordViewModel!
    override func setUp() {
        super.setUp()
        
        sut = RecordViewModel()
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    func testIsRecording_ShouldBeFalse_AsDefaultValue() {
        assertThat(sut.isRecording == false)
    }
    
    func testRecordLabel_ShouldBeTabToRecord_WhenIsRecordingIsFalse() {
        sut.isRecording = false
        
        assertThat(sut.recordingLabel(), equalTo("Tap to Record"))
    }
    
    func testRecordLabel_ShouldBeRecordingInProgress_WhenIsRecordingIsTrue() {
        sut.isRecording = true
        
        assertThat(sut.recordingLabel(), equalTo("Recording in progress"))
    }
    
    func testRecordButtonEnabled_ShouldBeTrue_WhenIsRecordingIsFalse() {
        sut.isRecording = false
        
        assertThat(sut.recordButtonEnabled() == true)
    }
    
    func testRecordButtonEnabled_ShouldBeFalse_WhenIsRecordingIsTrue() {
        sut.isRecording = true
        
        assertThat(sut.recordButtonEnabled() == false)
    }
    
    func testStopButtonEnabled_ShouldBeFalse_WhenIsRecordingIsFalse() {
        sut.isRecording = false
        
        assertThat(sut.stopButtonEnabled() == false)
    }
    
    func testStopButtonEnabled_ShouldBeTrue_WhenIsRecordingIsTrue() {
        sut.isRecording = true
        
        assertThat(sut.stopButtonEnabled() == true)
    }
}
