//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Woraphot Chokratanasombat on 4/6/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var lblRecording: UILabel!
    @IBOutlet weak var btnStop: UIButton!
    private var isRecording = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAction(_ sender: Any) {
        isRecording = true
        updateView()
    }
    
    @IBAction func stopAction(_ sender: Any) {
        isRecording = false
        updateView()
    }
    
    private func recordingLabel() -> String {
        return isRecording ? "Recording in progress" : "Tap to Record"
    }
    
    private func updateView() {
        lblRecording.text = recordingLabel()
        btnRecord.isEnabled = !isRecording
        btnStop.isEnabled = isRecording
    }
}

