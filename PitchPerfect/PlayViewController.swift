//
//  PlayViewController.swift
//  PitchPerfect
//
//  Created by Woraphot Chokratanasombat on 4/6/2561 BE.
//  Copyright © 2561 Woraphot Chokratanasombat. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    public var viewModel: PlayBackViewModel!
    @IBOutlet weak var buttonSlow: UIButton!
    @IBOutlet weak var buttonFast: UIButton!
    @IBOutlet weak var buttonHighPitch: UIButton!
    @IBOutlet weak var buttonLowPitch: UIButton!
    @IBOutlet weak var buttonEcho: UIButton!
    @IBOutlet weak var buttonReverb: UIButton!
    @IBOutlet weak var buttonStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.prepareAudio()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopSoundAction(buttonStop)
    }
    
    @IBAction func playSoundAction(_ sender: UIButton) {
        viewModel.playSound(effect: PlayBackViewModel.AudioEffect(rawValue: sender.tag)!)
        updateView()
    }
    
    @IBAction func stopSoundAction(_ sender: Any) {
        updateView()
    }
    
    func updateView() {
        buttonStop.isEnabled = viewModel.stopButtonEnabled()
    }
}
