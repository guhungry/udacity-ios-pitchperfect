//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Woraphot Chokratanasombat on 4/6/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, RecordViewControllerProtocol {
    public var viewModel: RecordViewModel = RecordViewModel()
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var lblRecording: UILabel!
    @IBOutlet weak var btnStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAction(_ sender: Any) {
        viewModel.startRecordAudio()
        updateView()
    }
    
    @IBAction func stopAction(_ sender: Any) {
        viewModel.stopRecordAudio()
        updateView()
    }
    
    private func updateView() {
        lblRecording.text = viewModel.recordingLabel()
        btnRecord.isEnabled = viewModel.recordButtonEnabled()
        btnStop.isEnabled = viewModel.stopButtonEnabled()
    }
    
    func onSaveSuccess(_ url: URL) {
        Router.showPlayScreen(from: self, forUrl: url)
    }
}
