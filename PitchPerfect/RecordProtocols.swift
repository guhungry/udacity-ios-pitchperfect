//
//  RecordProtocols.swift
//  PitchPerfect
//
//  Created by Woraphot Chokratanasombat on 5/6/18.
//  Copyright © 2018 Woraphot Chokratanasombat. All rights reserved.
//

import Foundation

protocol RecordViewControllerProtocol {
    func onSaveSuccess(_ url: URL)
    func updateView()
}
