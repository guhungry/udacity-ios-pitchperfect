//
//  RecordViewModelTests.swift
//  PitchPerfectTests
//
//  Created by Woraphot Chokratanasombat on 5/6/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import XCTest

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
        XCTAssertFalse(sut.isRecording)
    }
    
    func testRecordLabel_ShouldBeTabToRecord_WhenIsRecordingIsFalse() {
        sut.isRecording = false
        
        XCTAssertEqual(sut.recordingLabel(), "Tap to Record")
    }
    
    func testRecordLabel_ShouldBeRecordingInProgress_WhenIsRecordingIsTrue() {
        sut.isRecording = true
        
        XCTAssertEqual(sut.recordingLabel(), "Recording in progress")
    }
    
    func testRecordButtonEnabled_ShouldBeTrue_WhenIsRecordingIsFalse() {
        sut.isRecording = false
        
        XCTAssertTrue(sut.recordButtonEnabled())
    }
    
    func testRecordButtonEnabled_ShouldBeFalse_WhenIsRecordingIsTrue() {
        sut.isRecording = true
        
        XCTAssertFalse(sut.recordButtonEnabled())
    }
    
    func testStopButtonEnabled_ShouldBeFalse_WhenIsRecordingIsFalse() {
        sut.isRecording = false
        
        XCTAssertFalse(sut.stopButtonEnabled())
    }
    
    func testStopButtonEnabled_ShouldBeTrue_WhenIsRecordingIsTrue() {
        sut.isRecording = true
        
        XCTAssertTrue(sut.stopButtonEnabled())
    }
}
