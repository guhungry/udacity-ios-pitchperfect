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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSoundAction(_ sender: Any) {
    }
    
    @IBAction func stopSoundAction(_ sender: Any) {
    }
}
